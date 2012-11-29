function [ node ] = create_heap_node(cbr_case, ranking, left, right)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    node.case = cbr_case;
    node.value = ranking;
    node.leaves{1} = left;
    node.leaves{2} = right;
end

