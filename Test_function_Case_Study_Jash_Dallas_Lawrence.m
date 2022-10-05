%***NOTE*** Case_Study_Val_5.m must be ran first in order to get varaibles
%in the workspace that are called in the file (i.e. training_data, 
% C_with_div_labels, etc.)

%counter of the successes. initiated to 0
counter = 0; 

%initiated the array; later this will be filled with the training data
test_row = [];

for i = 1:length(training_data) % length of training data is 180
    test_row = training_data(i,2:131); % row i, all col in training data except for div labels
    test_centroid = 0; %initialize a test_centroid to 0

    %we initialized this to an incredibly high number so that in the if
    %statement below it will always go through
    min_distance = 99999; 

    for j= 1:16 % for j, start at 0 and go up until the number of centroids 
        dummy_var = norm(test_row-C_with_div_labels(j,2:131)); % distance between the test data with the centroid

        % this if selects the min distance between the row and the
        % centroid, then that centroid becomes the designated centroid
        % for that row. 
        if(dummy_var < min_distance)
            min_distance = dummy_var; 
            test_centroid = C_with_div_labels(j,:);
        end 
    end
    
    % Success rate counter. Everytime we get the correct division we
    % increment counter to keep track of the # of successes
    if( training_data(i,1) == test_centroid(1,1) )
        counter = counter + 1;
    end
      
end 

% ratio for successs. Divide counter (the # of successes) by the length of
% the test_data to get the percentage of values we got right
success_rate = counter / length(test_data); 
disp(success_rate*100); 





