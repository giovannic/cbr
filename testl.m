function [ output_args ] = testl( x,y, cbr )
%TESTL Summary of this function goes here
%   Detailed explanation goes here
for i = 601 : length(x)
    c1 = create_case(create_AU(x(i,:)), []);
    retrieved = retrieve_simple(cbr, c1);
    output_args(i-600, 1) = retrieved.solution;
    temp = y(i);
    output_args(i-600, 2) = temp;
    c1 = reuse(retrieved, c1);
    cbr = retain(cbr, c1);
end

end

