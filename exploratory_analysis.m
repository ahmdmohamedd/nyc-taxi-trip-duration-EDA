%% Load Data

% Load the CSV file
data = readtable('nyc_taxi_trip_duration.csv');

% Display the first few rows
head(data)


%% Data Prepsocessing

% Check for dimensions and variable names
disp(size(data));
disp(data.Properties.VariableNames);

% Check for missing values
missingData = sum(ismissing(data));
disp('Missing values per column:');
disp(missingData);

% Remove rows with missing data (if needed)
dataClean = rmmissing(data);


% Convert datetime columns to proper format
data.pickup_datetime = datetime(data.pickup_datetime, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');
data.dropoff_datetime = datetime(data.dropoff_datetime, 'InputFormat', 'yyyy-MM-dd HH:mm:ss');

%% Generate Summary Statistics

% Summary statistics for numeric variables
summary(data);

% Compute specific statistics
meanTripDuration = mean(data.trip_duration);
medianTripDuration = median(data.trip_duration);
stdTripDuration = std(data.trip_duration);

disp(['Mean Trip Duration: ', num2str(meanTripDuration)]);
disp(['Median Trip Duration: ', num2str(medianTripDuration)]);
disp(['Standard Deviation of Trip Duration: ', num2str(stdTripDuration)]);


%% Visualize Data Distributions
% Histogram of trip durations
figure;
histogram(data.trip_duration, 50); % Adjust bins as needed
title('Distribution of Trip Duration');
xlabel('Trip Duration (seconds)');
ylabel('Frequency');


% Bar chart for passenger count

[counts, passengerCategories] = groupcounts(data.passenger_count);
figure;
bar(passengerCategories, counts);
title('Passenger Count Distribution');
xlabel('Passenger Count');
ylabel('Frequency');


%% Exploring Relationships
% Scatter plot for trip duration vs passenger count
figure;
scatter(data.passenger_count, data.trip_duration, 'filled');
title('Trip Duration vs Passenger Count');
xlabel('Passenger Count');
ylabel('Trip Duration (seconds)');


% Boxplot of trip duration by vendor
figure;
boxplot(data.trip_duration, data.vendor_id);
title('Trip Duration by Vendor ID');
xlabel('Vendor ID');
ylabel('Trip Duration (seconds)');


%% Geospatial Analysis
% Heatmap of pickup locations (using histogram2 for simplicity)
figure;
histogram2(data.pickup_longitude, data.pickup_latitude, 'DisplayStyle', 'tile', 'ShowEmptyBins', 'on');
colorbar;
title('Heatmap of Pickup Locations');
xlabel('Longitude');
ylabel('Latitude');


% Scatter plot of pickup and dropoff locations
figure;
scatter(data.pickup_longitude, data.pickup_latitude, 'r.');
hold on;
scatter(data.dropoff_longitude, data.dropoff_latitude, 'b.');
legend('Pickup', 'Dropoff');
title('Pickup and Dropoff Locations');
xlabel('Longitude');
ylabel('Latitude');
hold off;


%% Correlation Analysis
% Calculate correlation matrix for numeric columns
numericVars = {'trip_duration', 'passenger_count', 'pickup_longitude', 'pickup_latitude', 'dropoff_longitude', 'dropoff_latitude'};
corrMatrix = corr(table2array(data(:, numericVars)), 'Rows', 'complete');
figure;
heatmap(numericVars, numericVars, corrMatrix, 'Colormap', jet, 'ColorbarVisible', 'on');
title('Correlation Matrix');


%% Time-Based Analysis
% Extract hour of day from pickup datetime
data.hour_of_day = hour(data.pickup_datetime);

% Boxplot of trip duration by hour of day
figure;
boxplot(data.trip_duration, data.hour_of_day);
title('Trip Duration by Hour of Day');
xlabel('Hour of Day');
ylabel('Trip Duration (seconds)');
ylim('auto');
set(gca, 'YScale', 'log');

