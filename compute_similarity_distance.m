function [ similarity ] = compute_similarity_distance( case1, case2 )
    %COMPUTE_SIMILARITY2 computes similarity based on euclidean distance
    %   Detailed explanation goes here
    attributes1 = zeros(1,45);
    for i = 1 : length(case1.au_vector)
        attributes1(case1.au_vector(i)) = 1;
    end
    attributes2 = zeros(1,45);
    for i = 1 : length(case2.au_vector)
        attributes2(case2.au_vector(i)) = 1;
    end


    distance = pdist([attributes1;attributes2]);
    similarity = distance/sqrt(45);

end