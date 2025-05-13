data {
  int<lower=0> N;           // liczba obserwacji
  vector[N] pi_t;           // inflacja
  vector[N] pi_lead1;       // oczekiwana inflacja
  vector[N] pi_lag1;       // oczekiwana inflacja 
  vector[N] x_t;            // luka popytowa
}

parameters {
  real<lower=0, upper=1> beta;
  real<lower=0> kappa;
  real<lower=-1, upper=1> rho;        
  real<lower=0> sigma;
  vector[N] u;
}

model {
  // Priory (możesz dopasować)
  beta ~ normal(0.5, 0.1); 
  kappa ~ normal(0.0, 0.05);
  rho ~ normal(0, 0.4);               
  sigma ~ inv_gamma(2, 0.01);

  u[1] ~ normal(0, sigma / sqrt(1 - square(rho))); // stacjonarna wariancja
  for (n in 2:N)
    u[n] ~ normal(rho * u[n - 1], sigma);
  
  // Model
  for (n in 1:N)
    pi_t[n] ~ normal(beta * pi_lead1[n] + (1 - beta) * pi_lag1[n] + kappa * x_t[n] + u[n], 1e-6);
}
