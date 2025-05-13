file_path <- paste0(dirname(rstudioapi::getSourceEditorContext()$path),"/")

set.seed(123)
N <- 100
pi_t <- rnorm(N, 0, 0.01)
x_t  <- rnorm(N, 0, 0.01)
i_t  <- rnorm(N, 0, 0.01)

stan_data <- list(
  N = N,
  pi_t = pi_t,
  x_t = x_t,
  i_t = i_t
)

fit <- stan(
  file = paste0(file_path, "nkpc_three_equations.stan"),
  data = stan_data,
  iter = 2000,
  warmup = 500,
  chains = 4,
  seed = 123, 
  verbose = TRUE,
  diagnostic_file = "out.csv"
)
