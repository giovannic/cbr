function [ similarity ] = compute_similarity_centre( case1, case2 )
    %computes similarity based statistical centres
    similarity = 45 - (mean(case1.au_vector) - mean(case2.au_vector));
end