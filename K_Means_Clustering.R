require(reshape2)

## Create Sample Data


#customer id
ids <- 1:10000

#number of programs the customer participated in
n_programs_participated <- sample(0:3, size = 10000, replace = TRUE, prob = c(.70,.20,.05,.05))

#average month energy use by customer (mean in 2019 was 877 kWh according to EIA) 
avg_monthly_kwh <- rnorm(10000,877,877/4)
hist(avg_monthly_kwh)

#survey response - how environmentally concious are you?
survey_response <- floor(runif(10000, min=1, max=10))

# Sort energy use ascending and programs descending
avg_monthly_kwh <- sort(avg_monthly_kwh, decreasing = FALSE)
n_programs_participated <- sort(n_programs_participated, decreasing = TRUE)
          
#Combine vectors into dataframe
df <- data.frame(ids,avg_monthly_kwh,n_programs_participated,survey_response)
colnames(df) <- c("id","avg_monthly_kwh","n_programs_participated","survey_response")


