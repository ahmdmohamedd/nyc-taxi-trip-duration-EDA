# NYC Taxi Trip Duration Analysis

## Overview

This repository contains an exploratory data analysis (EDA) of the NYC taxi trip duration dataset. The analysis aims to uncover insights and patterns in taxi trip durations based on various factors, such as passenger count, time of day, and vendor identification. The project is implemented in MATLAB and includes detailed visualizations and statistical analyses.

## Dataset

The dataset used for this analysis is `nyc_taxi_trip_duration.csv`. This dataset includes information about taxi trips in New York City, such as:

- **pickup_datetime**: Date and time when the trip started.
- **dropoff_datetime**: Date and time when the trip ended.
- **trip_duration**: Duration of the trip in seconds.
- **pickup_longitude**: Longitude of the pickup location.
- **pickup_latitude**: Latitude of the pickup location.
- **dropoff_longitude**: Longitude of the dropoff location.
- **dropoff_latitude**: Latitude of the dropoff location.
- **passenger_count**: Number of passengers in the taxi.
- **vendor_id**: Identifier for the taxi vendor.

## Contents

- `exploratory_analysis.m`: MATLAB script that performs the exploratory data analysis, including:
  - Data loading and preprocessing.
  - Summary statistics for numeric variables.
  - Data visualizations (histograms, scatter plots, boxplots).
  - Correlation analysis among numeric variables.
  - Geospatial analysis of pickup and dropoff locations.
  - Time-based analysis of trip durations.

## Installation

1. Clone this repository to your local machine using:
   ```bash
   git clone https://github.com/ahmdmohamedd/nyc-taxi-trip-duration-EDA.git
   ```

2. Navigate to the repository folder:
   ```bash
   cd nyc-taxi-trip-duration-EDA
   ```

3. Ensure you have MATLAB installed on your machine.

## Usage

1. Open the `exploratory_analysis.m` script in MATLAB.
2. Run the script to load the dataset and generate visualizations and summary statistics.
3. Explore the results and insights obtained from the analysis.

## Results

The analysis includes various visualizations that provide insights into:

- The distribution of trip durations.
- The relationship between passenger count and trip duration.
- Variations in trip duration across different taxi vendors.
- Geospatial distribution of pickup and dropoff locations.
- Time-based patterns in trip durations based on the hour of the day.

## Contributing

If you would like to contribute to this project, please fork the repository and create a pull request. Any improvements, suggestions, or additional analyses are welcome!


## Acknowledgments

- NYC Taxi & Limousine Commission for providing the dataset.
- MATLAB for the analytical tools used in this project.
```
