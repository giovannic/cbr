function [ new_heap ] = insert_heap( heap, cbr_case, ranking)
    %inserts case to the heap

    new_node = create_heap_node(cbr_case, ranking, [],[]);
    
    if (isempty(heap))
        new_heap = new_node;
    else

        %get to the first free spot
        free_branch = find(cellfun(@isempty,heap.leaves) == 1);
        if (~isempty(free_branch))
            %place at the bottom
            heap.leaves{free_branch(1)} = new_node;
        else
            %recurse further
            branch = randi([1,2]);
            heap.leaves{branch} = insert_heap(heap.leaves{branch}, cbr_case, ranking);
        end
        
        %find biggest leaf
        leaves = heap.leaves;
        for l = 1:2
            if isempty(leaves{l})
                rankings(l) = 0;
            else
                rankings(l) = leaves{l}.value;
            end
        end
        
        [value, position] = max(rankings);
        other_position = 2 - (position - 1);
        if(value > heap.value)
            %swap parent with new node
            new_child = create_heap_node(heap.case, heap.value, heap.leaves{position}.leaves{1}, heap.leaves{position}.leaves{2});
            if (position == 1)
                new_heap = create_heap_node(cbr_case, ranking, heap.leaves{other_position}, new_child);
            else
                new_heap = create_heap_node(cbr_case, ranking, new_child, heap.leaves{other_position});
            end
        else
            new_heap = heap;
        end
    end
end