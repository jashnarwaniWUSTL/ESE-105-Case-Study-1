load('COVIDbyCounty.mat')

%Adding division labels to CNTY_COVID data that way we can see which data
%lined up with which division.
Division_CNTY_COVID = cat(2, divisionLabels, CNTY_COVID);

%Randomizing all of the rows. This part was a little redundant because
%after doing some reasearch on cvpartition we found out that randomly
%selected indexes. So this part was not necessary but didn't think it would
%hurt to leave in.
[m,n] = size(Division_CNTY_COVID) ;
random_Indexes = randperm(m) ;
randomized_Division_CNTY_COVID = Division_CNTY_COVID(random_Indexes, :) ;

%Using cross-validation to assign 80% training and 20% test. How we defined
%the values was sort of arbitrary. We just found this to be best.
cv = cvpartition(size(randomized_Division_CNTY_COVID,1),'HoldOut',0.2);

%Training and Test indexes. Using the cvpartition function it created the
%80/20 split indexes that we used in the next step.
training_idx = cv.training;
test_idx = cv.test;


%Forming training/test sets from given indexes. Here we called the indexes
%on the array to create the two sets with the proper rows.
training_data = randomized_Division_CNTY_COVID(training_idx, :);
test_data = randomized_Division_CNTY_COVID(test_idx, :);


%Here we orginally thought we had to remove the division labels in order to
%call K-means but we found that we could just call 2:131 directly on the
%cols, but we thought to include this in our process.

%removed_division_training_data = training_data(:, 2:131);
% removed_division_test_data = test_data(:, 2:131);


%We treated counter_var as a "boolean" here. If it is zero continue while
%loop. Stop when it is not. Eventually we will check to make sure every
%division in accounted for. At that point we will increment counter_var to
%1 and the loop will stop.
counter_var = 0;
while(counter_var == 0)
    
    % First we tried running K-means with 25 lusters. We thought it was
    % best to start with a high cluster count and work our way down.
    % [idx, C, sumd, D] = kmeans(training_data(:, 2:131), 25, "Replicates", 65);
 
    
    % Next we tried adding additional properties/attributes to see if that
    % would make adifference.
    % [idx, C, sumd, D] = kmeans(training_data(:, 2:131), 25, "Replicates", 65,'Distance', 'correlation', 'Start','uniform');
    
    % We decided to keep the additional attributes but modify it from
    % uniform to cluster
    %[idx, C, sumd, D] = kmeans(training_data(:, 2:131), 25, "Replicates", 70,'Distance', 'cityblock', 'Start','cluster'); 
    
    % Now that we were confident with the attributtes we decided to
    % lowerthe k-means until we found a good amount
    % [idx, C, sumd, D] = kmeans(training_data(:, 2:131), 20, "Replicates", 40,'Distance', 'cityblock', 'Start','cluster'); 
    
    % Eventually we concluded with a k-means of 16 being the best   
    [idx, C, sumd, D] = kmeans(training_data(:, 2:131), 16, "Replicates", 70,'Distance', 'cityblock', 'Start','cluster'); 

    
    %next we created all of our centroids at their given index. And did a
    %test to see which division they would fall under. Originally, we were
    %using mean to find the index and found that we were getting a ton of
    %decimal values which was not ideal. We also were not getting anyof the
    %outliers 9s and 1s because those were less likely using mean. We then
    %tried median which got better but was still not the results we were
    %looking for. Eventually we finalized on using mode.

    %centroid 1
    array_division_centroid_1 = training_data(idx==1); 
    centroid_number_test_1 = mode(array_division_centroid_1(:, 1));
     
    %centroid 2
    array_division_centroid_2 = training_data(idx==2); 
    centroid_number_test_2 = mode(array_division_centroid_2(:, 1));
    
    %centroid 3
    array_division_centroid_3 = training_data(idx==3); 
    centroid_number_test_3 = mode(array_division_centroid_3(:, 1));
    
    %centroid 4
    array_division_centroid_4 = training_data(idx==4); 
    centroid_number_test_4 = mode(array_division_centroid_4(:, 1));
    
    %centroid 5
    array_division_centroid_5 = training_data(idx==5); 
    centroid_number_test_5 = mode(array_division_centroid_5(:, 1));
    
    %centroid 6
    array_division_centroid_6 = training_data(idx==6); 
    centroid_number_test_6 = mode(array_division_centroid_6(:, 1));
    
    %centroid 7
    array_division_centroid_7 = training_data(idx==7); 
    centroid_number_test_7 = mode(array_division_centroid_7(:, 1));
    
    %centroid 8
    array_division_centroid_8 = training_data(idx==8); 
    centroid_number_test_8 = mode(array_division_centroid_8(:, 1));
    
    %centroid 9
    array_division_centroid_9 = training_data(idx==9); 
    centroid_number_test_9 = mode(array_division_centroid_9(:, 1));
    
    %centroid 10
    array_division_centroid_10 = training_data(idx==10); 
    centroid_number_test_10 = mode(array_division_centroid_10(:, 1));
    
    %centroid 11
    array_division_centroid_11 = training_data(idx==11); 
    centroid_number_test_11 = mode(array_division_centroid_11(:, 1));
    
    %centroid 12
    array_division_centroid_12 = training_data(idx==12); 
    centroid_number_test_12 = mode(array_division_centroid_12(:, 1));
    
    %centroid 13
    array_division_centroid_13 = training_data(idx==13); 
    centroid_number_test_13 = mode(array_division_centroid_13(:, 1));
    
    %centroid 14
    array_division_centroid_14 = training_data(idx==14); 
    centroid_number_test_14 = mode(array_division_centroid_14(:, 1));
    
    %centroid 15
    array_division_centroid_15 = training_data(idx==15); 
    centroid_number_test_15 = mode(array_division_centroid_15(:, 1));
    
    %centroid 16
    array_division_centroid_16 = training_data(idx==16); 
    centroid_number_test_16 = mode(array_division_centroid_16(:, 1));


    %Now we combined all of the division results into an array. This was
    %used to test to make sure that we were actually getting each division.
    centroid_test_number_array = [centroid_number_test_1, ...
        centroid_number_test_2, centroid_number_test_3, ...
        centroid_number_test_4, centroid_number_test_5, ...
        centroid_number_test_6, centroid_number_test_7, ...
        centroid_number_test_8, centroid_number_test_9, ...
        centroid_number_test_10, centroid_number_test_11, ...
        centroid_number_test_12, centroid_number_test_13, ...
        centroid_number_test_14, centroid_number_test_15, ...
        centroid_number_test_16]; 
    
    %counter to check that increments everytime we find a new division. We
    %should expect this to get up to 9 then we know every division isl
    %isted.
    counter_checker = 0; 
    
    %for i 1-9 (divisions 1-9) check if there is a value i in the array of
    %division results above. If it is found then increment the counter. If
    %the counter reaches 9 (meaning all divisions were accounted for) then
    %set counter_var to 1 and at that point the while loop will end.
    for i = 1:9
        if(ismember(i, centroid_test_number_array))
            counter_checker = counter_checker + 1; 
        end
    end 
    if(counter_checker == 9)
        counter_var= 1; 
    end

end 

%transposing the division results array
col_2_rows = transpose(centroid_test_number_array); 

%concatenating the division labels with the centroids C from k-means
C_with_div_labels = cat(2, col_2_rows, C); 


