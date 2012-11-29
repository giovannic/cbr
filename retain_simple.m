function [ cbr ] = retain_simple( cbr, case_to_add )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

added_this_round = 0;
for j = 1:length(cbr)
    if compare_case_equality(cbr(j), case_to_add)
        cbr(j).typicality = cbr(j).typicality + 1;
        added_this_round=1;
        break;
    end
end
if ~added_this_round
    cbr = [cbr, case_to_add];
end

end

function [ is_equal ] = compare_case_equality( c1, c2 )
is_equal = isequal(c1.au_vector, c2.au_vector) && isequal(c1.solution, c2.solution);
end