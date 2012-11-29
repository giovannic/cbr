function [ cases ] = getTopThree( heap )
    %get top three cases
    %get kids
    kids = heap.leaves(~cellfun('isempty', heap.leaves));
    if (isempty(kids))
        kid_cases = [];
    else
        kid_cases = [kids.case];
    end
    cases = [heap.case,kid_cases];
end