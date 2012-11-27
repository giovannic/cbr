function [ similarity ] = compute_similarity2( case1, case2 )
%COMPUTE_SIMILARITY2 computes similarity based on euclidean distance
%   Detailed explanation goes here
attributes1 = zeroes(45,1);
for i = 1 : length(case1.au_vector)
    attributes1(case1.au_vector(i)) = 1;
end
attributes2 = zeroes(45,1);
for i = 1 : length(case2.au_vector)
    attributes2(case2.au_vector(i)) = 1;
end

distance = pdist([attributes1;attributes2]);
if distance == 0
    similarity = 1;
else
    similarity = 1/distance;
end