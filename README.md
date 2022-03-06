# MechaCar_Statistical_Analysis Project Overview
The purpose of this analysis is to review production data for the MechaCar to determine any patterns or insights that will assist management in understanding the manufacturing team's issues.

## Linear Regression to Predict MPG

### Data Set Used
The "MechaCar_mpg.csv" data set was used for the linear regression analysis.

### Analysis Type
Multiple linear regression was used. The below variables were used to assess their effect on mpg.

- vehicle_length
- vehicle_weight
- spoiler_angle
- ground_clearance
- AWD

### R Functions Used
The linear regression and summary functions were used for the analysis.
```
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))
```
### Summary of Findings

![MechaCar_lm](https://user-images.githubusercontent.com/93630042/156927416-f219d900-32eb-4165-b396-e97038ef9079.png)

![MechaCar_lm_summary](https://user-images.githubusercontent.com/93630042/156927422-975ecd9e-1db5-4003-9ebd-e2e754157eac.png)

Based on the summary statistics we can determine which variables have a random amount of variance, and which do not. Determining this is based on each variables p-value when compared against the standard p-value of 0.05. 

- Variables statistically likely to have a non-random amont of variance:
  - vehicle_length (p-value = 2.60e-12)
  - ground_clearance (p-value = 5.21e-08)

- Variables statistically likely to have a random amount of variance:
  - vehicle_weight (p-value = 0.0776)
  - spoiler_angle (p-value = 0.3069)
  - AWD (p-value = 0.1852)

The slope of the model is not considered to be zero. This is based on the very small model p-value of 5.35e-11, which is significantly less the the standard p-value set of 0.05. Since this is much smaller then 0.05, we should reject the null hypothesis. The null hypothesis is a slope of 0 so since we are rejecting it, we can determine the slope must not be zero (either greather or less than). 

Based on the Multiple R<sup>2</sup> value of 0.7149, we can expect this model predicts 71.5% of the variance and outcome of x. However, this may be overfitted since it was previoulsy determined that the below three variables do not significantly explain the outcome due to their high (greater than 0.05) p-values. 

  - vehicle_weight (p-value = 0.0776)
  - spoiler_angle (p-value = 0.3069)
  - AWD (p-value = 0.1852)

For this reason we should also take into consideration the Adjusted R<sup>2</sup> value of 0.6825 which adjusts for the number of variables. 

We could also remove the above listed three variables in order to see that the R<sup>2</sup> value withot taking them into consideration at all. When this is done, the Multiple R<sup>2</sup> value drops to 67.4%. This is only a 5% change ((.674-.7149)/.7149) in the R<sup>2</sup> value.

![MechaCar_lm_summary_mod](https://user-images.githubusercontent.com/93630042/156928636-3c0baab3-52f9-4f3a-9665-b158e5a68676.png)

Based on the above, the the linear model predicts. mpg of MechaCar prototypes effectively.

## Summary Statistics on Suspension Coils
The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Analysis was done to determine whether the current manufacturing data meets this design specification for lots in total, and per lot.

### Data Set Used
The "Suspension_Coil.csv" data set was used for the linear regression analysis.

### Analysis Type
Summary statistic tables were created for this analysis. 

### R Functions Used
The summarize, mean, median, var and SD functions were used for this analysis. 

```
# Read in Suspension_Coil data set
Suspension_Coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

#create summary table
total_summary <- Suspension_Coil %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD = sd(PSI))

#create summary table by manufacturing lot
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI), Variance=var(PSI),SD = sd(PSI), .groups = 'keep')
```

### Summary of Findings
The total variance for all lots was 62.9356 which is under the requirement of 100. 

![total_summary](https://user-images.githubusercontent.com/93630042/156929991-200be9ec-0db4-4653-8dfb-e5fb82c12b75.png)

However, when looking at the individual lots we can see that Lot3 is significantly different than Lot1 and Lot2, causing a skewed overall variance. 

- Lot1 variance:  0.9795918
- Lot2 variance:  7.4693878
- Lot3 variance:  170.2861224

![lot_summary](https://user-images.githubusercontent.com/93630042/156929999-ac1edda5-0654-4768-a8f5-18b9b80d8b27.png)

The Lot3 variance is much higher than the requirement of 100 and does not meet the specifications.
The Lot1 and Lot2 variances are below 100 and therefor meet the specifications. 

## T-Tests on Suspension Coils
T-Tests were used to determine if all and each individal lots were statistically different from the population mean of 1,500 pounds per square inch.

### Data Set Used
The "Suspension_Coil.csv" data set was used for the linear regression analysis.

### Analysis Type
T-tests were used for this analysis.

### R Functions Used
The t.test and subset functions were used for this analysis.

```
#One sample t-test
t.test(Suspension_Coil$PSI,mu=1500)

#T-test for Lot1
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot1"),mu=1500)

#T-test for Lot2
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot2"),mu=1500)

#T-test for Lot3
t.test(subset(Suspension_Coil$PSI, Suspension_Coil$Manufacturing_Lot == "Lot3"),mu=1500)
```

### Summary of Findings
For all of the below analyses, the null hypothesis is that the mean of the lot(s) being analyized are equal to 1500. The p-value for significance is set to 0.05. 
 - Any values with a p-value above(greater than) 0.05 will fail to reject the null hypothesis and indicate that the given sample's mean is not significantly different than 1500.
 - Any values with a p-value below (less than) 0.05 will reject the null hypothesis and indicate that the given sample's mean is significantly different than 1500.
 
 #### All Lots
 - P-value:  0.06028
 - Mean of x:  1498.78 
 - Finding:  The p-value is greater than the significance level set; fail to reject the null hypothesis. Sample mean is not significantly different than poplation mean of 1500.
 
 ![1t-test](https://user-images.githubusercontent.com/93630042/156931025-c4f88f1c-6229-45d8-939e-f1db7e89eccb.png)
 
 #### Lot1
 - P-value:  p-value = 1
 - Mean of x:  1500
 - Finding:  The p-value is greater than the significance level set; fail to reject the null hypothesis. Sample mean is not significantly different than poplation mean of 1500.
 
 ![lot1](https://user-images.githubusercontent.com/93630042/156931041-99890e77-7ce7-4485-912b-2a5d8b2f72f1.png)
 
 #### Lot2
 - P-value:  0.6072
 - Mean of x:  1500.2 
 - Finding:  The p-value is greater than the significance level set; fail to reject the null hypothesis. Sample mean is not significantly different than poplation mean of 1500.

  ![lot2](https://user-images.githubusercontent.com/93630042/156931044-b718de26-887f-4b54-a2b1-d9c57e04be9f.png)
 
 #### Lot3
 - P-value:  0.04168
 - Mean of x:  1496.14
 - Finding:  The p-value is less than the significance level set; reject the null hypothesis. Sample mean is significantly different than poplation mean of 1500.

  ![lot3](https://user-images.githubusercontent.com/93630042/156931054-781c7cb1-91a6-49f4-b50f-5864243a4060.png)
