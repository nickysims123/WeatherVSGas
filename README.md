# WeatherVSGas
CS506 Spring 2025 Final Project

Initial Proposal: 

We are trying to predict the natural gas consumption based on 
regional temperatures and humidity levels. 

Data Collection: Gas consumption data will be supplied
through eia.gov (https://www.eia.gov/naturalgas/data.php#consumption).
Weather data will be supplied through a weather api
(https://www.weatherapi.com/). Data points will be monthly and 
taken over a 25 year span. 

Data Modeling: A multivariate regression model will be used
to model and fit our data. 

Data Visualization: We will use n-dimensional scatter plots
to visualize our data. 

Test Plan: We will randomly select 6 months out of our 
entire data set to designate for testing, then use the rest
for training. 