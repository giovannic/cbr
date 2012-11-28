function [ matched_case ] = retrieve_simple( cbr, new_case )
%RETRIEVE_SIMPLE Summary of this function goes here
%   Detailed explanation goes here
similarity = 0;

for i = 1 : length(cbr)
    this_similarity = compute_similarity_distance(cbr(i), new_case);
    if this_similarity > similarity
        matched_cases = cbr(i)
        similarity = this_similarity
    elseif this_similarity == similarity
        matched_cases = [ matched_cases, cbr ];
    end
end
if length(matched_cases)==1
    matched_case = matched_cases;
else
    matched_case = get_typical_case(matched_cases);
end
end

function [ typical_case ] = get_typical_case( cases )
typicality = 0;
    for i = 1 : length(cases)
        if cases(i).typicality > typicality
            typical_case = cases(i);
            typicality = cases(i).typicality;
        end
    end
end

