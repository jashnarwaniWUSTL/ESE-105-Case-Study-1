load('COVIDbyCounty.mat') 



% Change Data sets here if you wish to run this algorithm in a different
% dataset. 


% Using the provided divisionLabels data to categorize
% each row within CNTY_COVID with it's corresponding 
% storing categorized data into new variable. 
Labeled_COVID = cat(2, divisionLabels, CNTY_COVID);


% Cross validation function to create two matrix tables 
% from the ordered CNTY_COVID data base frmo the 
% Labeled_COVID matrix. Each newly created matrix 
% will be randomized within calling the function while 
% maintaining assigned division labeled. 
% will split data towards, 70 percent training and 30 testing
cross_validation = cvpartition(size(Labeled_COVID,1),'HoldOut',0.3);

% using corss_validation object to create indexes for the data sets
training_set_idx = cross_validation.training; 
test_set_idx= cross_validation.test; 


% Creating the data sets
training_data_set = Labeled_COVID(training_set_idx, :); 
test_data_set = Labeled_COVID(test_set_idx, :); 

% While loop for data checking. Runs the process of clustering data until
% all 9 regions are within the created data sets for anaylzing. 

% Counter variable to terminate while loop at appropriate time. 
while_termination = true;  

while(while_termination)
    
    % Using kmeans to cluster testing data and storing data (indx,
    % centroids, etc.) into variables. This kmeans only opperates on the
    % training data set which should correspond to 70 percent of the total
    % data. This kmeans also skips the division label coloumn so those
    % numbers do not alter the kmeans clustering. This kmeans creates 20
    % centroids which we will then categorize into the proper division. 
    [C_idx, Centroids, ~, ~] = kmeans(training_data_set(:, 2:131), 20, "Replicates", 100,'Distance', 'cityblock', 'Start','cluster', 'Display','final');
    
    % Algorithm for classifying each centroid. 


    % The premise of this part is to make an array that is made from all
    % the devision labels of the centroid being looked at. Each Centroid will
    % have a mixture of different division labels, and this array is made
    % from those labels. Taking the mode of this array gives us the most
    % common devision label within this centroid. This means that what ever
    % number the mode is means that this centroid is that certain region of
    % the U.S. (1 our of 9). This is due to the centroid being made from
    % the kmeans algorithm, taking into account the distance between
    % different points, therefore this centroid corresponds to the points
    % inside the data that are closest to this centroid. 

    % Creating an array from the kmeans clustered training_data_set. This
    % array will be created from the desired centroid. Basically, this is
    % the centroid desired. 
    Centroid_1_array = training_data_set(C_idx==1); 

    % Generating the centroid division label from the mode of the devision
    % labels within the centriod's data set. 
    centriod_division_1 = mode(Centroid_1_array(:, 1));
    
    % Process is replicated for all 20 kmeans clustered centroids. 
       
    Centroid_2_array = training_data_set(C_idx==2);
    centriod_division_2 = mode(Centroid_2_array(:, 1));

    Centroid_3_array = training_data_set(C_idx==3);
    centriod_division_3 = mode(Centroid_3_array(:, 1));

    Centroid_4_array = training_data_set(C_idx==4);
    centriod_division_4 = mode(Centroid_4_array(:, 1));

    Centroid_5_array = training_data_set(C_idx==5);
    centriod_division_5 = mode(Centroid_5_array(:, 1));

    Centroid_6_array = training_data_set(C_idx==6);
    centriod_division_6 = mode(Centroid_6_array(:, 1));

    Centroid_7_array = training_data_set(C_idx==7);
    centriod_division_7 = mode(Centroid_7_array(:, 1));
    
    Centroid_8_array = training_data_set(C_idx==8);
    centriod_division_8 = mode(Centroid_8_array(:, 1));

    Centroid_9_array = training_data_set(C_idx==9);
    centriod_division_9 = mode(Centroid_9_array(:, 1));

    Centroid_10_array = training_data_set(C_idx==10);
    centriod_division_10 = mode(Centroid_10_array(:, 1));

    Centroid_11_array = training_data_set(C_idx==11); 
    centriod_division_11 = mode(Centroid_11_array(:, 1));
    
    Centroid_12_array = training_data_set(C_idx==12);
    centriod_division_12 = mode(Centroid_12_array(:, 1));

    Centroid_13_array = training_data_set(C_idx==13);
    centriod_division_13 = mode(Centroid_13_array(:, 1));

    Centroid_14_array = training_data_set(C_idx==14);
    centriod_division_14 = mode(Centroid_14_array(:, 1));

    Centroid_15_array = training_data_set(C_idx==15);
    centriod_division_15 = mode(Centroid_15_array(:, 1));

    Centroid_16_array = training_data_set(C_idx==16);
    centriod_division_16 = mode(Centroid_16_array(:, 1));

    Centroid_17_array = training_data_set(C_idx==17);
    centriod_division_17 = mode(Centroid_17_array(:, 1));
    
    Centroid_18_array = training_data_set(C_idx==18);
    centriod_division_18 = mode(Centroid_18_array(:, 1));

    Centroid_19_array = training_data_set(C_idx==19);
    centriod_division_19 = mode(Centroid_19_array(:, 1));

    Centroid_20_array = training_data_set(C_idx==20);
    centriod_division_20 = mode(Centroid_20_array(:, 1));


    % Create an 1x20 array to have all division labels for all clusters.
    % Ordered from 1 through 20. 

    total_centroid_devisions = [ centriod_division_1, centriod_division_2, ...
                                 centriod_division_3, centriod_division_4,...
                                 centriod_division_5, centriod_division_6,...
                                 centriod_division_7, centriod_division_8,...
                                 centriod_division_9, centriod_division_10,...
                                 centriod_division_11, centriod_division_12, ...
                                 centriod_division_13, centriod_division_14,...
                                 centriod_division_15, centriod_division_16,...
                                 centriod_division_17, centriod_division_18,...
                                 centriod_division_19, centriod_division_20]; 

    % Reset region counter by recreating it with value of zero. 
    region_requirement = 0; % supposed to reach a value of 9. 

    % For loop to determine if all nine regions are included in the kmeans
    % algorithm.This ensures we have all nine regions and increase our
    % accuracy by having the while loop to rerun untill we have desired
    % data analysis. 
    for i = 1:9 % Counts 1 for each region. 9 total. 
        % checks if each region is included at least once in array with all
        % devision of all centroids. 
        if(ismember(1, total_centroid_devisions))
           % Will add one and make new number be the required check 
           region_requirement = region_requirement + 1;
        end 
    end
    
    % If the counter has reached 9, that means that all nine regions are
    % included within the arrray. This part terminates the while loop if
    % such requirement is met. 

    if(region_requirement == 9)
        while_termination = false; 
    end 

end

% Transpose the centroid devision array to add to centroids. 
transpose_cen_div = transpose(total_centroid_devisions);

% Here, the corresponding devision label is assigned to each centroid. 
Centriods_categorized = cat(2, transpose_cen_div, Centroids); 


%% 

% This part of the code corresponds to the test section algorithm
% implemented to test the accuracy of the kmeans centroid categorization. 
tracker_var = 0; 

% Create a temp array only used for testing. 
dummy_test_arr = []; 

% For loop for testing accuracy. 

% The premise of this algorithm is to 

for i = 1:length(training_data_set) % 1 through length of data set 158
    % row i, skipping div labels 
    temp_row = training_data_set(i, 2:131); 

    % This will ultimately be the centroid closest to the respective row. 
    temp_centroid = 0; 
    
    % Temp variable used to replace the closest distance. This will help
    % determine which centriod has the smallest distance between each row
    % of the test data set and the specified centroid. Set at large number
    % to ensure that the first distance will always be smaller than this to
    % make sure the if statement always runs the first time. 
    min_dummy_var = 123456789123456789; 
    
    % integrated for loop to run for the number of centriods created
    % earlier. 
    for j = 1:20 
        % Create temp array of j row, with all col data except for div col
        temp_c_array = Centriods_categorized(j,2:131); 
        % calculate the distance between the centroid and the COVID
        % training data. 
        temp_norm_distance = norm(temp_row - temp_c_array);
        
        % If the norm distance is smaller, then that distance becomes the
        % new check parameter. The smallest distance indicates that region
        % is part of that centriod. 
        if(temp_norm_distance < min_dummy_var)
            % Creates a smaller distance check parameter. 
            min_dummy_var = temp_norm_distance; 
            
            % Stores what centroid the data belongs too. 
            temp_centroid = Centriods_categorized(j,:);
        end 
    end
    

    % Keeps track of how many training data set dev labels equal the
    % calculated designated centroid. If the div label from the row i
    % matches the div label from the calculated centroid, then tracker
    % variable is increased by one. 
    if(training_data_set(i, 1) == temp_centroid(1,1) )
        tracker_var = tracker_var + 1; 
    end


end    


% This is what calculates our success rate. The higher the percentage the
% more successful our algorithm has been. 

rate = (tracker_var/length(training_data_set)) *100;  
disp("Final Success Rate: "); 
disp(rate); 




