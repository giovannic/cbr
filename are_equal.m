function [ are_equal ] = are_equal( case1, case2 )
    are_equal = (length(case1) == length(case2)) && (all(eq(case1.au_vector, case2.au_vector)) == 1);z\n
end

