##### Exploratory Data Analysis #####
### Run 1st ###

# Libraries and Options ---------------------------------------------------
library(tidyverse)
library(psych)
library(mvnormalTest)
library(multiUS)
library(corrplot)

## Set seed
set.seed(123)

# Data Cleaning -----------------------------------------------------------
## Load data
data <- read.csv("data_wave_13.csv", header = TRUE)

head(data)
nrow(data)
## Subset dataframe to isolate variables we are interested in
data <- select(data, 
               act_hands, act_mask, act_trips, act_travel, act_work, # Policy Cooperation Variables
               trust_cdc, trust_sthealth, trust_pcp, # Trust Variables
               cdc_valuesim, sthealth_valuesim, pcp_valuesim, # Value Congruence Variables
               egal1, egal2, egal3, indiv1, indiv2, indiv3, hier1, hier2, hier3, fatal1, fatal2, fatal3, # Deep Core Beliefs
               covid_risk_you, covid_risk_econ, covid_risk_sec, # Risk Perception Variables
               cdc_competent, sthealth_competent, pcp_competent) # Competency Variables

## Create variable indices
#data$egalscale <- data$egal1 + data$egal2 + data$egal3 # Egalitatrian index

#data$indivscale <- data$indiv1 + data$indiv2 + data$indiv3 # Individualist index

#data$hierscale <- data$hier1 + data$hier2 + data$hier3 # Hierarchist index

#data$fatalscale <- data$fatal1 + data$fatal2 + data$fatal3 # Fatalist index

data$coopscale <- data$act_hands + data$act_mask + data$act_travel + data$act_trips + data$act_work # Cooperation index

## Check internal validity of indices
alpha_data <- alpha(data, check.keys = TRUE) 
alpha_data # Good internal consistency

## Subset data to only include indices
data <- select(data,
               #egalscale, hierscale, fatalscale, indivscale, # Deep Core Beliefs indices
               egal1, egal2, egal3, indiv1, indiv2, indiv3, hier1, hier2, hier3, fatal1, fatal2, fatal3,
               covid_risk_you, covid_risk_econ, covid_risk_sec, # Risk Perception Variables
               cdc_valuesim, sthealth_valuesim, pcp_valuesim, # Value Congruence Variables
               coopscale, # Cooperation index
               trust_cdc, trust_sthealth, trust_pcp, # Trust variables
               cdc_competent, sthealth_competent, pcp_competent) # Competency variables

# Testing Assumptions of SEM ----------------------------------------------
## Describe data
describe(data)
# egalscale: The mean score is approximately 9.95, suggesting that respondents, on average, rated their agreement with items related to egalitarian beliefs close to 10. The standard deviation of 3.04 indicates moderate variability in responses. The distribution is slightly negatively skewed (-0.25), indicating a slightly longer left tail.
# 
# hierscale: Similar to egalscale, respondents, on average, rated their agreement with items related to hierarchical beliefs close to 10 (mean = 9.94). The standard deviation is 2.84, suggesting moderate variability. The distribution is also slightly negatively skewed (-0.29).
# 
# fatalscale: The mean score is 8.84, indicating that respondents, on average, rated their agreement with items related to fatalistic beliefs lower than the previous two scales. The standard deviation is 2.95, indicating moderate variability. The distribution is slightly positively skewed (0.06).
# 
# indivscale: The mean score is 9.59, indicating relatively high agreement with items related to individualistic beliefs. The standard deviation is 2.93, suggesting moderate variability. The distribution is close to symmetric, with a slight negative skew (-0.08).
# 
# coopscale: The mean score is 20.06, suggesting moderate agreement with items related to cooperation. The standard deviation is relatively large (5.23), indicating substantial variability. The distribution is negatively skewed (-1.06), indicating a longer left tail.
# 
# trust_cdc, trust_sthealth, trust_pcp: These variables represent trust in different entities (e.g., CDC, state health departments, primary care physicians). The mean scores are around 3.4 to 3.7, indicating moderate levels of trust on a scale of 1 to 5. The standard deviations are relatively small (around 1), suggesting limited variability. The distributions are negatively skewed, indicating longer left tails.
# 
# cdc_competent, sthealth_competent, pcp_competent: These variables represent perceptions of competency of different entities (e.g., CDC, state health departments, primary care physicians). The mean scores are around 3.5 to 3.9, indicating moderate to high perceptions of competency on a scale of 1 to 5. The standard deviations are relatively small (around 1), suggesting limited variability. The distributions are negatively skewed, indicating longer left tails.

## Assumptions of SEM
# 1. Non-normality - observations are drawn from a continuous and multivariate normal population
# 2. Missing data - each unit of analysis has complete data
# 3. Specification Error - the omission of relevant variables in any equation of the system of equations

## Test for non-normality
mardia_test <- mardia(data)

# Perform multivariate normality test
mardia_test$mv.test

# Shapiro-Wilk Univariate normality test
mardia_test$uv.shapiro

# Results from both the univariate and multivariate tests indicate that the measures do not come from normally distributed univariate or multivariate distributions.
# ex: the 'No' results in the table
# We address these issues in the model specification stage.

## Handle missing data
# Check for missing values in the entire dataset
missing_values <- is.na(data)

# Summarize missing values by variables
summary(missing_values)

# Use KNN imputation 
data <- KNNimp(data, k = 3, scale = FALSE, meth = "weighAvg", distData = NULL) # This function uses the k-nearest neighbours to fill in the unknown (NA) values in a data set. For each case with any NA value it will search for its k most similar cases and use the values of these cases to fill in the unknowns. If meth='median' the function will use either the median (in case of numeric variables) or the most frequent value (in case of factors), of the neighbours to fill in the NAs. If meth='weighAvg' the function will use a weighted average of the values of the neighbours. The weights are given by exp(-dist(k,x) where dist(k,x) is the euclidean distance between the case with NAs (x) and the neighbour k. 

# Check for missing values again
missing_values <- is.na(data)
summary(missing_values)

# Visualizations ----------------------------------------------------------
# Create a list to store the ggplot objects
histogram_list <- list()

# Loop through each column in the dataset
for (column in names(data)) {
  # Check if the variable is numeric
  if (is.numeric(data[[column]])) {
    # Create a histogram for numeric variables
    p <- ggplot(data, aes(x = !!sym(column))) +
      geom_histogram(binwidth = 1, fill = "skyblue", color = "black") +
      labs(title = paste("Histogram of", column), x = column, y = "Frequency") +
      theme_classic()
    
    # Store the ggplot object in the list
    histogram_list[[column]] <- p
  }
}

# Print visualizations
histogram_list$egalscale
histogram_list$hierscale
histogram_list$fatalscale
histogram_list$indivscale
histogram_list$covid_risk_you
histogram_list$covid_risk_econ
histogram_list$covid_risk_sec
histogram_list$coopscale
histogram_list$trust_cdc
histogram_list$trust_sthealth
histogram_list$trust_pcp
histogram_list$cdc_competent
histogram_list$sthealth_competent
histogram_list$pcp_competent
histogram_list$cdc_valuesim
histogram_list$sthealth_valuesim
histogram_list$pcp_valuesim

# Matrices  ---------------------------------------------------------------
# Compute the covariance matrix
cov_matrix <- cov(data)

# Compute the correlation matrix
correlation_matrix <- cor(data)

# Compute standard deviations for each variable
standard_deviations <- apply(data, 2, sd)

cov_matrix
correlation_matrix
standard_deviations

# Convert the covariance matrix to a data frame
cov_df <- as.data.frame(cov_matrix)

# Reshape the data frame for plotting
cov_df <- reshape2::melt(cov_matrix)

# Create a heatmap using ggplot2
ggplot(cov_df, aes(Var1, Var2, fill = value)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(low = "red4", mid = "gray89", high = "royalblue3", midpoint = 0) +
  labs(title = "Covariance Matrix Heatmap", x = "Variables", y = "Variables") +
  theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1))

# Plot the correlation matrix
corrplot(correlation_matrix, method = "circle", type = "upper", order = "hclust", tl.col = "black", tl.srt = 45)

