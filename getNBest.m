function [ cases ] = getNBest( heap, n)
    %get top three cases
    %get kids
    best = heap.case;
    positions = heap.leaves(~cellfun('isempty', heap.leaves));
    i = 1;
    while (i < n && ~isempty(positions))
        values = [positions{:}];
        values = values.value;
        [m, index] = max(values);
        parent = positions{index};
        positions{index} = [];
        best = [best, parent.case];
        positions = horzcat(positions, parent.leaves);
        positions = positions(~cellfun('isempty', positions));
        i = i + 1;
    end
    
    cases = best;
end