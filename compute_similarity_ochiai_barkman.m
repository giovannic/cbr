function [ similarity ] = compute_similarity_ochiai_barkman( case1, case2 )
    %COMPUTE_SIMILARITY2 computes similarity based on the ochiai_barkman
    %index
    similarity = intersect(case1.au_vector, case2.au_vector) / sqrt(length(case1.au_vector) * length(case1.au_vector));
end