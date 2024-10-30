# Load the required library
install.packages("ggplot2", dependencies=TRUE)
library(ggplot2)

# Load the data
# Replace 'your_file_path.csv' with the actual path to your CSV file containing the logistic growth data
growth_data <- read.csv("experiment.csv.csv")

# Ensure the data has columns `t` (for time) and `N` (for population size) or adjust accordingly

# Plotting the data with raw scale for y-axis
ggplot(data = growth_data, aes(x = t, y = N)) +
  geom_point() +
  xlab("Time (t)") +
  ylab("Population Size (N)") +
  theme_bw()

# Plotting the data with logarithmic scale on y-axis
ggplot(data = growth_data, aes(x = t, y = N)) +
  geom_point() +
  xlab("Time (t)") +
  ylab("Population Size (log scale)") +
  scale_y_continuous(trans='log10') +
  theme_bw()

