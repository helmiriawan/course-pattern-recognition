% Specify number of objects for training set (200-1000)
number_of_objects = 400;

% Retrieve NIST data file
data_file = prnist(0:9, 1:number_of_objects);

% Pre-process and convert data file to data set
a = my_rep(data_file);
% w = proxm(a);	% euclidian distance	
w = proxm(a,'c'); % city-block
d = a*w;
w2 = psem(d,30);
data_set = d*w2;

% Compute the classifier
start = clock;
% classifier = w*w2*svc(data_set, 'radial_basis', 5);
classifier = w*w2*svc(data_set, 'radial_basis', 6);
finish = clock;

% Evaluate the error classification
error = nist_eval('my_rep', classifier, 100)

% Show training time
fprintf('%2.3f s\n', etime(finish, start));

start = clock;
classifier = w*w2*qdc(data_set);
finish = clock;
error = nist_eval('my_rep', classifier, 100)
fprintf('%2.3f s\n', etime(finish, start));

start = clock;
classifier = w*w2*knnc(data_set,1);
finish = clock;
error = nist_eval('my_rep', classifier, 100)
fprintf('%2.3f s\n', etime(finish, start));

start = clock;
classifier = w*w2*parzenc(data_set);
finish = clock;
error = nist_eval('my_rep', classifier, 100)
fprintf('%2.3f s\n', etime(finish, start));