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

Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
Is the slope of the linear model considered to be zero? Why or why not?
Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
