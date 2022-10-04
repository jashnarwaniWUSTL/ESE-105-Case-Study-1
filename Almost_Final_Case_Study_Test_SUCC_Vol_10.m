

counter = 0; 
test_row = [];
%disp(length(training_data));

for i = 1:length(training_data) % length of training data is 180
    test_row = training_data(i,2:131); % row i, all col in training data except for div labels
    test_centroid = 0; 
    min_distance = 9999999999999999999999999999999999999;
    %disp(min); % testing debug feature
    for j= 1:18 % for j, start at 0 and go up until the number of centroids 
        dummy_var = norm(test_row-C_with_div_labels(j,2:131)); % distance between the test data with the centroid
        % disp(dummy_var); % testing debug feature

        % this if selects the min distance between the row and the
        % centroid, then that centroid becomes the designated centroid
        % for that row. 
        if(dummy_var < min_distance)
            min_distance = dummy_var; 
            test_centroid = C_with_div_labels(j,:);
        end 
        %disp(min); % testing debug feature
    end
    
    % success rate counter  
    if( training_data(i,1) == test_centroid(1,1) )
        counter = counter + 1;
    end
      
end 
% ratio for successs
succ = counter / length(test_data); 
disp(succ*100); 





