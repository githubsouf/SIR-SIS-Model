
# Load necessary libraries
library(reshape2)
library(ggplot2)

# Define the SIS model and RK4 solver function
dSdt <- function(t, S, I) {
  return(-beta * S * I / N + delta * I)
}

dIdt <- function(t, S, I) {
  return(beta * S * I / N - delta * I)
}

RK4SIS <- function(n, beta, delta, S0, I0, dt = 1) {
  N <<- S0 + I0  # fixed population
  
  S <- c(S0, rep(0, n))
  I <- c(I0, rep(0, n))
  for (i in 1:n) {
    Si <- S[i]
    Ii <- I[i]
    
    S.k1 <- dSdt(i, Si, Ii)
    I.k1 <- dIdt(i, Si, Ii)
    
    S.k2 <- dSdt(i + dt / 2, Si + dt / 2 * S.k1, Ii + dt / 2 * I.k1)
    I.k2 <- dIdt(i + dt / 2, Si + dt / 2 * S.k1, Ii + dt / 2 * I.k1)
    
    S.k3 <- dSdt(i + dt / 2, Si + dt / 2 * S.k2, Ii + dt / 2 * I.k2)
    I.k3 <- dIdt(i + dt / 2, Si + dt / 2 * S.k2, Ii + dt / 2 * I.k2)
    
    S.k4 <- dSdt(i + dt, Si + dt * S.k3, Ii + dt * I.k3)
    I.k4 <- dIdt(i + dt, Si + dt * S.k3, Ii + dt * I.k3)
    
    S[i + 1] <- Si + dt / 6 * (S.k1 + 2 * S.k2 + 2 * S.k3 + S.k4)
    I[i + 1] <- Ii + dt / 6 * (I.k1 + 2 * I.k2 + 2 * I.k3 + I.k4)
  }
  return(data.frame(n = 0:n, S = S, I = I))
}

# Set initial parameters for SIS model
S0 <- 120000
I0 <- 10
beta <- 1.44
delta <- 0.48
n <- 20

# Simulate the SIS model
r_sis <- RK4SIS(n, beta, delta, S0, I0)

# Reshape the data for plotting
r_sis_plot <- melt(r_sis, id = "n", measure = c("S", "I"))

# Create the plot for SIS model
p_sis <- ggplot(r_sis_plot, aes(x = n, y = value, group = variable, color = variable))
p_sis + geom_line() +
  ggtitle("SIS Model Simulation") +
  xlab("Time") +
  ylab("machines")

