data {
  int<lower=2> N;
  vector[N] pi_t;
  vector[N] x_t;
  vector[N] i_t;
}

parameters {
  real<lower=0, upper=1> beta;
  real<lower=0> kappa;
  real<lower=0> sigma_inv;
  real<lower=0, upper=1> rho;
  real<lower=0> phi_pi;
  real<lower=0> phi_x;

  real<lower=-1, upper=1> rho_u;
  real<lower=-1, upper=1> rho_eps;
  real<lower=-1, upper=1> rho_eta;

  real<lower=0> sigma_u;
  real<lower=0> sigma_eps;
  real<lower=0> sigma_eta;

  vector[N] u;
  vector[N] eps;
  vector[N] eta;
}

model {
  // PRIORY
  beta ~ beta(1.5, 1.5);
  kappa ~ normal(0.05, 0.02);
  sigma_inv ~ normal(1, 0.3);

  rho ~ beta(2, 2);
  phi_pi ~ normal(1.5, 0.3);
  phi_x ~ normal(0.5, 0.2);

  rho_u ~ normal(0.5, 0.2);
  rho_eps ~ normal(0.5, 0.2);
  rho_eta ~ normal(0.5, 0.2);

  sigma_u ~ inv_gamma(2, 0.01);
  sigma_eps ~ inv_gamma(2, 0.01);
  sigma_eta ~ inv_gamma(2, 0.01);

  // AR(1) dla błędów strukturalnych
  u[1] ~ normal(0, sigma_u / sqrt(1 - square(rho_u)));
  eps[1] ~ normal(0, sigma_eps / sqrt(1 - square(rho_eps)));
  eta[1] ~ normal(0, sigma_eta / sqrt(1 - square(rho_eta)));

  for (t in 2:N) {
    u[t] ~ normal(rho_u * u[t - 1], sigma_u);
    eps[t] ~ normal(rho_eps * eps[t - 1], sigma_eps);
    eta[t] ~ normal(rho_eta * eta[t - 1], sigma_eta);
  }

  // Równania strukturalne (forward-looking)
  for (t in 2:(N - 1)) {
    pi_t[t] ~ normal(beta * pi_t[t + 1] + (1 - beta) * pi_t[t - 1] + kappa * x_t[t] + u[t], 1e-6);
    x_t[t]  ~ normal(x_t[t + 1] - (1 / sigma_inv) * (i_t[t] - pi_t[t + 1]) + eps[t], 1e-6);
    i_t[t]  ~ normal(rho * i_t[t - 1] + (1 - rho) * (phi_pi * pi_t[t] + phi_x * x_t[t]) + eta[t], 1e-6);
  }

}
