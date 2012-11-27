function [ similarity ] = compute_similarity1( case1, case2 )
%COMPUTE_SIMILARITY Summary of this function goes here
%   Detailed explanation goes here

difference = abs(length(case1.au_vector)-length(case2.au_vector));
similarity = 1/(difference+eps);

end

