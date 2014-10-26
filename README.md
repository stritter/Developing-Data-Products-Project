Developing-Data-Products-Project
================================

Simulation of the coverage probability of the exponential distribution


Compare the empirical with theoretical coverage probalility.

The app calculates the empirical coverage of a number of samples (number of simulations). The empirical mean and (1-alpha) % confidence intervall of each sample is calculated. Then the app counts how often the theoretical mean (1/lambda), population mean of the exponential distribution, is in the calculated confidence intervall of each sample. The percentage,i.e. the count that the population mean is covered by the confidence intervall divided by the number of simulations, is the result the app displays in the main panel.

Enter the values for the variables defining the simulation on the sidebar panel.

The seed value makes it possible to reproduce the results.

The main panel shows the values for the variables and the empirical coverage of the simulation after the submit button is pressed.

A simple approximation to the exact interval endpoints of the exponential distribution can be derived using a normal approximation. This approximation is used to compute the values for a (1-alpha)% confidence interval.
