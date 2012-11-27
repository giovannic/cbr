function [ similarity ] = compute_similarity_test( case1, case2 )
%COMPUTE_SIMILARITY2 computes similarity based on euclidean distance
%   Detailed explanation goes here

distance = pdist([case1.au_vector;case2.au_vector]);
if distance == 0
    similarity = 1;
else
    similarity = 1/distance;
end