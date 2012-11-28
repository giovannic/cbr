function [ cbr ] = CBRinit_simple( x, y )
%CBRINIT_SIMPLE Summary of this function goes here
%   Detailed explanation goes here
cbr = [];
for i = 1 : length(x)
    this_case = (create_case(create_AU(x(i,:)), y(i)));
    cbr = retain( cbr, this_case );
end
end