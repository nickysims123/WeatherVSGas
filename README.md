# WeatherVSGas
# Nicholas Sima, Kaya Rahbar, Krish Asija, and Owen Reilly

# Midterm Report Video
https://youtu.be/SFSiUapP3t8

# Final Report Video

CS506 Spring 2025 Final Project

Initial Proposal: 

We are trying to predict the natural gas consumption based on 
regional temperatures and humidity levels. 


Data Modeling: A multivariate regression model will be used
to model and fit our data. 

Data Visualization: We will use n-dimensional scatter plots
to visualize our data. 

Test Plan: We will randomly select 6 months out of our 
entire data set to designate for testing, then use the rest
for training. 

Project Overview
This project aims to predict natural gas prices using various energy market indicators, weather data, and macroeconomic factors. By analyzing historical patterns and relationships between these variables, we seek to develop an accurate forecasting model for Henry Hub natural gas spot prices.
Data Sources
Our analysis uses two primary datasets:

U.S. Monthly Energy Data (USMonthlyEnergy.csv) - Contains various energy metrics including consumption, production, and weather indicators
Natural Gas Price Data (NG_SandF.csv) - Contains historical Henry Hub spot prices for natural gas

Energy Metrics Processing

Data Loading and Cleaning:

Loaded the U.S. Monthly Energy dataset, skipping header rows
Stripped column names of unnecessary characters
Filtered out non-data rows (headers, empty rows)


Data Transformation:

Converted wide-format data to long-format time series
Each row now contains date, metric name, and corresponding value
Converted date strings to datetime objects
Set date as the index for time series analysis


Feature Selection:
Identified 18 potential predictive features including:

Energy production indicators (Coal, Crude Oil, Natural Gas, Renewables)
Consumption metrics (Total Energy Consumption)
Weather indicators (Heating Degree Days, Cooling Degree Days)
Economic indicators (GDP, Personal Income, Manufacturing Index)
Price indicators (Crude Oil WTI Spot, Natural Gas Henry Hub Spot)

Natural Gas Price Processing

Data Loading and Cleaning:

Identified header row dynamically based on column names
Converted price column to numeric values, handling missing values
Created datetime index for time series analysis


Aggregation:

Converted daily price data to monthly averages using resampling
Aligned monthly price data with energy metrics for modeling
Sorted data chronologically for time series analysis

Modeling Methods:

Standard Multiple Linear Regression:

Using OLS (Ordinary Least Squares) to model the relationship between energy indicators and natural gas prices
Testing various combinations of predictor variables to identify the optimal feature set
Analyzing regression diagnostics (residuals, multicollinearity, heteroscedasticity)

Why Regression Modeling?

The relation between weather and gas prices is very cyclical. Regression analysis was chosen because it effectively captures the relationships between independent variables (weather conditions, energy metrics, economic indicators) and the dependent variable (natural gas consumption). Multiple Linear Regression (MLR) allows us to quantify how each predictor contributes to gas consumption fluctuations, making it a suitable choice for this type of structured, numerical dataset.

Preliminary Regression:

We generated a correlation matrix with each feature in our dataset to identify key determinants of natural gas prices. This matrix identified Electricity, Total Energy Production, Gas Supply, Coal Production, and Crude Oil Production as the five features with the highest correlation coefficients. We then regressed HH Spot Price on these five features to create our preliminary predictive model. The regression and corresponding residual plot can be found in the Python notebook. 

# Further Findings:

# Model Training
We replaced our original linear approach with a LightGBM gradient boosting regressor (LGBMRegressor) configured with 200 trees, a learning rate of 0.1, and 31 leaves per tree. We then fit the model on the remaining training set. This setup takes advantage of boosting’s sequential tree-building to capture any nonlinear relationships and interactions among predictors without excessive feature engineering.

# Model Performance
Our model accuracy is quantified by RMSE and R^2 on both our training and test splits. RMSE measures average deviation in $/MMBTU, and R^2 indicates the proportion of variance explained. We then generated diagnostic plots: actual vs. predicted scatter, residual vs. predicted plot to check for bias or heteroskedasticity, and either a time-series overlay or distribution comparison depending on whether the test index is datetime.

# Insights
Raw importance scores from LightGBM reveal which variables contribute most to predictive power; these are visualized in a horizontal bar chart. To contextualize effect sizes, we also standardize all features and refit a linear model to produce standardized coefficients, offering a more interpretable ranking of drivers. Finally, when timestamps are available, we examine residuals by month in a boxplot to detect any seasonal patterns that the model may under- or over-predict.
