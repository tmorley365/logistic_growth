# Load the required library
install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# Load the data
# Replace 'your_file_path.csv' with the actual path to your CSV file
growth_data <- read.csv("experiment.csv.csv")

# Define the logistic growth function
logistic_fun <- function(t) {
  # Calculate N based on logistic growth parameters
  N <- (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
  return(N)
}

# Parameters: Replace these with actual estimated values from your model fitting
N0 <- 879 # Initial population size (e.g., first observed population size in your dataset)
  r <- 0.0100086   # Growth rate (e.g., from the summary of model1)
  K <- 5.979e+10   # Carrying capacity (e.g., from the summary of model2)
  
# Plotting the data and the logistic model with a logarithmic y-axis
  ggplot(data = growth_data, aes(x = t, y = N)) +
    geom_point() +  # Plot observed data points
    geom_function(fun = logistic_fun, colour = "red") +  # Overlay logistic model as a red line
    xlab("Time (t)") +
    ylab("Population Size (N)") +
    theme_bw()


