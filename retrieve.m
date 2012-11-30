function [ cbr_case ] = retrieve( new_case, cbr )
%inserts case to cluster and updates similarities
    %set threshold
    t = 0.9;
    
    %set k
    k = 5;
    topK = {};
    
    top_size = cbr.initial_tier_size;
    
    %start at the top tier
    level = 0;
    
    %similarity function
    sim = @(c) (compute_similarity_cosine(c, new_case));
    
    %initialise
    for c = 1:length(cbr.clusters)
        clusters(c).no = c;
        clusters(c).cluster = cbr.clusters;
        clusters(c).finished = 0;
    end

    %loop
    while(~all(clusters.finished == 1))
        similarities = zeros(length(clusters), 1);
        for cluster = 1:length(clusters)
            start = level * top_size + 1;
            finish = start + top_size * (level + 1);
            
            cases = clusters{cluster}.cases;
            
            if (finish > length(cases))
                finish = length(cases);
                clusters{cluster}.finished = 1;
            end
            
            if (start < length(cases))
                cases = clusters{cluster}.cases(start:finish);

                sims = arrayfun(sim,cases);
                [sims,indexes] = sort(sims, 'decsend');
                possible = cases{indexes(1:k)};
                possible = arrayfun(@(c, s) (setfield(c, 'average_sim', s)), possible, sims);
                horizcat(topK, possible);

                topK = case_sort(topK);
                topK = topK(1:k);
            end
        end
        
        m = max(similarities);
        %eliminate straglers
        clusters = clusters(similarities(similarities > m*t));
        
        level = level + 1;
    end
    
    scores = zeros(6,0);
    for c = 1:k
        scores(topK{c}.case.label) = scores(topK{c}.case.label) + topK{c}.rank
    end
    
end