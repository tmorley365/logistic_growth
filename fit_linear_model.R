# Load necessary library
install.packages("dplyr") 
library(dplyr)

# Load the data
# Replace 'your_file_path.csv' with the actual path to your CSV file
growth_data <- read.csv("experiment.csv.csv")

# Case 1: Early phase where K >> N0 and t is small
# Here, you need to define a threshold for `t` where the initial growth is approximately exponential.
# Replace `threshold_t1` with an appropriate value (e.g., `t < 10`).

threshold_t1 <- 1000  # Example threshold; adjust based on your data

data_subset1 <- growth_data %>%
  filter(t < threshold_t1) %>%
  mutate(N_log = log(N))

# Fit a linear model to log-transformed N to approximate early growth rate
model1 <- lm(N_log ~ t, data = data_subset1)
summary(model1)

# Case 2: Late phase where N(t) approaches the carrying capacity K
# Choose a threshold where `t` is large enough that N(t) ≈ K.
# Replace `threshold_t2` with an appropriate value (e.g., `t > 50`).

threshold_t2 <- 2000  # Example threshold; adjust based on your data

data_subset2 <- growth_data %>%
  filter(t > threshold_t2)

# Fit a linear model to estimate the carrying capacity, assuming N is constant at this phase
model2 <- lm(N ~ 1, data = data_subset2)
summary(model2)

