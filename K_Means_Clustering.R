library(reshape2)

## Create Sample Data


# Customer id
ids <- 1:10000

# Number of programs the customer participated in
n_programs_participated <- sample(0:3, size = 10000, replace = TRUE, prob = c(.70,.20,.05,.05))

# Average month energy use by customer (mean in 2019 was 877 kWh according to EIA) 
avg_monthly_kwh <- round(rnorm(10000,877,877/4),2)
hist(avg_monthly_kwh)

# Survey response - how environmentally concious are you?
survey_response <- floor(runif(10000, min=1, max=10))

# Sort energy use ascending and programs descending
avg_monthly_kwh <- sort(avg_monthly_kwh, decreasing = FALSE)
n_programs_participated <- sort(n_programs_participated, decreasing = TRUE)
          
# Combine vectors into dataframe
df <- data.frame(ids,avg_monthly_kwh,n_programs_participated,survey_response)
colnames(df) <- c("id","avg_monthly_kwh","n_programs_participated","survey_response")

## Determine optimal number of groups

clust_vars <- df[,2:4]

# Standardize fields
clust_vars <- scale(clust_vars)
head(clust_vars)

# Ensure results remain the same every time
set.seed(123)

# Create a function to compute within-cluster sum of squares (wss)
# wss measures variability of the customers within each cluster. Small wss = compact cluster
wss <- sapply(1:10, function(k){kmeans(clust_vars, k, nstart=15)$tot.withinss})

plot(1:10, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="wss")




