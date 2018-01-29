% Specify number of objects for training set (10)
number_of_objects = 10;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
data_set = my_rep(data_file);

% Compute the classifier
start = clock;
classifier = ldc(data_set);
%classifier = svc(data_set, 'radial_basis', 4);
finish = clock;

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100);

% Show training time
fprintf('%2.3f s\n', etime(finish, start));