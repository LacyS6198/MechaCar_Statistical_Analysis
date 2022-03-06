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
