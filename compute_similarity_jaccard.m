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
    atts_and = and(attributes1, attributes2);
    atts_or = or(attributes1, attributes2);
    similarity = length(atts_and(atts_and==1))/length(atts_or(atts_or==1));

end

