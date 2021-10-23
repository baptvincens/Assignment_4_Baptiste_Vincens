clc;
clear all;
close all;

%% Main
%Here the function "computeDisplcamentsUncertainty" can be called to make
%plots for the desired csv files. The obtained results are matrices which
%give the standard deviation and average value of the noise obtained when
%no displacement is given to the target

filenames = ["MANTA_1_Test_2_061021_0004_0.csv", "MANTA_1_Test_2_061021_0003_0.csv", "MANTA_1_Test_2_061021_0002_0.csv", "MANTA_1_Test_2_061021_0001_0.csv"]; % files which will be read
nb_subset = 10; % number of rows and columns used for division of the field into sub-areas
pixel_size = .303; % mm

[Std_u, Std_v, Std_w, Avg_u, Avg_v, Avg_w] = computeDisplacementsUncertainty(filenames, nb_subset, pixel_size);


