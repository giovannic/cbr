function [ similarity ] = compute_similarity_jaccard( case1, case2 )
%COMPUTE_SIMILARITY_JACCARD Summary of this function goes here
%   Detailed explanation goes here

    attributes1 = zeros(1,45);
    for i = 1 : length(case1.au_vector)
        attributes1(case1.au_vector(i)) = 1;
    end
    attributes2 = zeros(1,45);
    for i = 1 : length(case2.au_vector)
        attributes2(case2.au_vector(i)) = 1;
    end
    
    similarity = length(and(attributes1, attributes2))/length(or(attributes1, attributes2));

end

