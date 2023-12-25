clc;
clear;
close all;

% Initialize an empty table to store the combined data
combinedData = table();

% List of filenames
filenames = {'dataset1.csv', 'dataset2.csv', 'dataset3.csv', 'dataset4.csv', 'dataset5.csv', 'dataset6.csv', 'dataset7.csv', 'dataset8.csv', 'dataset9.csv', 'dataset10.csv', 'dataset11.csv', 'dataset12.csv', 'dataset13.csv', 'dataset14.csv', 'dataset15.csv', 'dataset16.csv' , 'dataset17.csv', 'dataset18.csv', 'dataset19.csv', 'dataset20.csv', 'dataset21.csv', 'dataset22.csv', 'dataset23.csv', 'dataset24.csv', 'dataset25.csv', 'dataset26.csv', 'dataset27.csv', 'dataset28.csv', 'dataset29.csv'}; % Add more filenames as needed

% Loop through each file and append data to combinedData
for i = 1:length(filenames)
    % Read the CSV file
    data = readtable(filenames{i});
    
    % Append the data to the combinedData table
    combinedData = [combinedData; data];
end

% Write the combined data to a single CSV file
writetable(combinedData, 'combined_dataset.csv');
disp('Combined data saved to combined_dataset.csv');