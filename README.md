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

The 
```
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg)
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg))
```
Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?
Is the slope of the linear model considered to be zero? Why or why not?
Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
