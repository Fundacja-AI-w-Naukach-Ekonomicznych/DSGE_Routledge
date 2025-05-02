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
  real<lower=0> sigma;
}

model {
  // Priory (możesz dopasować)
  beta ~ beta(1.5, 1.5);
  kappa ~ normal(0.05, 0.02);
  sigma ~ inv_gamma(2, 0.01);
  
  // Model
  for (n in 1:N)
    pi_t[n] ~ normal(beta * pi_lead1[n] +  (1 - beta)* pi_lag1[n] + kappa * x_t[n], sigma);
}
