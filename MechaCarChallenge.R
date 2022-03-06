library(dplyr)
library(tidyverse)

# Read in MechaCar data set
MechaCar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)

# Multiple linear regression analysis and summary
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))

# Multiple linear regression analysis and summary - modified
lm(mpg ~ vehicle_length + ground_clearance,data=MechaCar_mpg)
summary(lm(mpg ~ vehicle_length + ground_clearance,data=MechaCar_mpg))

# Read in Suspension_Coil data set
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#create summary table
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD = sd(PSI))

#create summary table by manufacturing lot
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD = sd(PSI), .groups = 'keep') 
