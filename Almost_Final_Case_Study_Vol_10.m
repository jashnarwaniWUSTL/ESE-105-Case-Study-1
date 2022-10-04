load('COVIDbyCounty.mat')

%[idx,C,sumd,D] = kmeans(CNTY_COVID,9,'Display','final','Replicates',10);

%newTable = addvars(CNTY_CENSUS(:, "CTYNAME"), CNTY_COVID);



%Adding division labels to CNTY_COVID data
Division_CNTY_COVID = cat(2, divisionLabels, CNTY_COVID);

%Randomizing all of the rows (a little redundant since we used cross-validation)
[m,n] = size(Division_CNTY_COVID) ;
random_Indexes = randperm(m) ;
randomized_Division_CNTY_COVID = Division_CNTY_COVID(random_Indexes, :) ;

%Using cross-validation to assign 80% training and 20% test
cv = cvpartition(size(randomized_Division_CNTY_COVID,1),'HoldOut',0.2);

%Training and Test indexes
training_idx = cv.training;
test_idx = cv.test;


%Forming training/test sets from given indexes
training_data = randomized_Division_CNTY_COVID(training_idx, :);
test_data = randomized_Division_CNTY_COVID(test_idx, :);


%removed division labels
% emoved_division_training_data = training_data(:, 2:131);

%removed division labels
% removed_division_test_data = test_data(:, 2:131);


counter_var = 0;
while(counter_var == 0)
    [idx, C, sumd, D] = kmeans(training_data(:, 2:131), 18, "Replicates",30,'Distance', 'correlation', 'Start','uniform'); 

    array_division_centroid_1 = training_data(idx==1); 
    centroid_number_test_1 = mode(array_division_centroid_1(:, 1));
     
    
    array_division_centroid_2 = training_data(idx==2); 
    centroid_number_test_2 = mode(array_division_centroid_2(:, 1));
    
    
    array_division_centroid_3 = training_data(idx==3); 
    centroid_number_test_3 = mode(array_division_centroid_3(:, 1));
    
    
    array_division_centroid_4 = training_data(idx==4); 
    centroid_number_test_4 = mode(array_division_centroid_4(:, 1));
    
    
    array_division_centroid_5 = training_data(idx==5); 
    centroid_number_test_5 = mode(array_division_centroid_5(:, 1));
    
    
    array_division_centroid_6 = training_data(idx==6); 
    centroid_number_test_6 = mode(array_division_centroid_6(:, 1));
    
    
    array_division_centroid_7 = training_data(idx==7); 
    centroid_number_test_7 = mode(array_division_centroid_7(:, 1));
    
    
    array_division_centroid_8 = training_data(idx==8); 
    centroid_number_test_8 = mode(array_division_centroid_8(:, 1));
    
    
    array_division_centroid_9 = training_data(idx==9); 
    centroid_number_test_9 = mode(array_division_centroid_9(:, 1));
    
    
    array_division_centroid_10 = training_data(idx==10); 
    centroid_number_test_10 = mode(array_division_centroid_10(:, 1));
    
    
    array_division_centroid_11 = training_data(idx==11); 
    centroid_number_test_11 = mode(array_division_centroid_11(:, 1));
    
    
    array_division_centroid_12 = training_data(idx==12); 
    centroid_number_test_12 = mode(array_division_centroid_12(:, 1));
    
    
    array_division_centroid_13 = training_data(idx==13); 
    centroid_number_test_13 = mode(array_division_centroid_13(:, 1));
    
    
    array_division_centroid_14 = training_data(idx==14); 
    centroid_number_test_14 = mode(array_division_centroid_14(:, 1));
    
    
    array_division_centroid_15 = training_data(idx==15); 
    centroid_number_test_15 = mode(array_division_centroid_15(:, 1));
    
    
    array_division_centroid_16 = training_data(idx==16); 
    centroid_number_test_16 = mode(array_division_centroid_16(:, 1));
    
    
    array_division_centroid_17 = training_data(idx==17); 
    centroid_number_test_17 = mode(array_division_centroid_17(:, 1));
    
    
    array_division_centroid_18 = training_data(idx==18); 
    centroid_number_test_18 = mode(array_division_centroid_18(:, 1));

    centroid_test_number_array = [centroid_number_test_1,centroid_number_test_2,centroid_number_test_3, ...
        centroid_number_test_4,centroid_number_test_5,centroid_number_test_6,...
        centroid_number_test_7,centroid_number_test_8,centroid_number_test_9,centroid_number_test_10,centroid_number_test_11,...
        centroid_number_test_12,centroid_number_test_13,centroid_number_test_14,centroid_number_test_15,centroid_number_test_16,...
        centroid_number_test_17,centroid_number_test_18]; 

    counter_checker = 0; 

    for i = 1:9
        if(ismember(i, centroid_test_number_array))
            counter_checker = counter_checker + 1; 
            
        end
    end 
    if(counter_checker == 9)
        counter_var= 1; 
    end

end 

col_2_rows = transpose(centroid_test_number_array); 

C_with_div_labels = cat(2, col_2_rows, C); 



%{
array_division_centroid_19 = training_data(idx==19); 
centroid_number_test_19 = mean(array_division_centroid_19(:, 1));

array_division_centroid_20 = training_data(idx==20); 
centroid_number_test_20 = mean(array_division_centroid_20(:, 1));

array_division_centroid_21 = training_data(idx==21); 
centroid_number_test_21 = mean(array_division_centroid_21(:, 1));

array_division_centroid_22 = training_data(idx==22); 
centroid_number_test_22 = mean(array_division_centroid_22(:, 1));

array_division_centroid_23 = training_data(idx==23); 
centroid_number_test_23 = mean(array_division_centroid_23(:, 1));

array_division_centroid_24 = training_data(idx==24); 
centroid_number_test_24 = mean(array_division_centroid_24(:, 1));

array_division_centroid_25 = training_data(idx==25); 
centroid_number_test_25 = mean(array_division_centroid_25(:, 1));


%} 
