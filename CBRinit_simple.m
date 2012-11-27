function [ cbr ] = CBRinit_simple( x, y )
%CBRINIT_SIMPLE Summary of this function goes here
%   Detailed explanation goes here
cbr = [];
added_this_round = 0;
for i = 1 : length(x)
    this_case = (create_case(create_AU(x(i,:)), y(i)));
    for j = 1:length(cbr)
        j
        cbr
        if compare_case_equality(cbr(j), this_case)
            cbr(j).typicality = cbr(j).typicality + 1;
            added_this_round=1;
            break;
        end
    end
    if ~added_this_round
        cbr = [cbr, this_case ]
    end
added_this_round = 0;
end
end

function [ is_equal ] = compare_case_equality( c1, c2 )
is_equal = isequal(c1.au_vector, c2.au_vector) && isequal(c1.solution, c2.solution);
end