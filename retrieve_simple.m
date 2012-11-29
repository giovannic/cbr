function [ matched_case ] = retrieve_simple( cbr, new_case, sim_fun_num )
similarity   = 0;
matched_case = [];

for i = 1 : length(cbr)
    handle = get_sim_function(sim_fun_num);  
    this_similarity = handle(cbr(i), new_case);
    
    if this_similarity > similarity
        matched_case  = cbr(i);
        similarity    = this_similarity;
    elseif this_similarity == similarity
        matched_case = get_typical_case([ matched_cases, cbr ]);
    end
    
end
end

function [ typical_case ] = get_typical_case( cases )
typicality   = cases(1).typicality;
typical_case = cases(1);

%In event of a single element list will just return the head
    for i = 2 : length(cases)
        if cases(i).typicality > typicality
            typical_case = cases(i);
            typicality = cases(i).typicality;
        end
    end
end

