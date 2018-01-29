%%%%%%% Data Understanding %%%%%%%

% Load NIST data file
data_file = prnist(0:9, 1:250);

% Hide warning messages
prwarning off;

% Investigate classifier based on Dissimilarity (euclidian distance)
% data_set = dissimilarity_preparation(data_file,20,30,0);

% Investigate classifier based on Dissimilarity (city-block)
data_set = dissimilarity_preparation(data_file,20,30,1);

crossvalidation(data_set, 5, 10)

%%%%%%% Model optimization %%%%%%%

% k-Nearest Neighbor
gridsearch(data_set, [], 'cross-validation', 'knnc', 1:10)

% Back-propagation Feed-forward Neural Network
gridsearch(data_set, [], 'cross-validation', 'bpxnc', 5:5:50, 2000)

% Support Vector Machine
data_file = prnist(0:9, 1:400);
data_set = dissimilarity_preparation(data_file,20,30,0);
[training, test] = gendat(data_set, 0.5);
gridsearch(training, test, 'hold-out', 'svc', 1:10, [], 'radial_basis')
