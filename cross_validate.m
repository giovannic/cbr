function [ predictions ] = cross_validate(examples, targets)

predictions     = [];

num_folds       = 10;
fold_size       = floor(length(examples) / num_folds);
remainder       = length(targets) - (num_folds * fold_size);

start_test_data = 1;
stop_test_data  = fold_size;

results = [];

for i = 1:num_folds
    i
    [r1, r2] = removerows(examples, 'ind', [start_test_data:stop_test_data]);
    [r3, r4] = removerows(targets, 'ind', [start_test_data:stop_test_data]);   
        
    
    r2 = removerows(examples, 'ind', r2.keep_ind);
    
    
    cbr = CBRinit(r1, r3, 20);
    p   = testCBR(cbr, r2);
    
    predictions = [predictions; p];
    
    start_test_data = start_test_data + fold_size;
    stop_test_data  = stop_test_data + fold_size;
    
    %Adds any remainder on to the end could greatly effect it in the data
    %set is smaller
    if i == (num_folds - 1)
        stop_test_data = stop_test_data + remainder;
    end
end
end
