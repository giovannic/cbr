function [ cbr_case ] = retrieve( new_case, cbr )
%inserts case to cluster and updates similarities
    %set threshold
    t = 0.9;
    
    %set k
    k = 10;
    topK = [];
    
    top_size = cbr.initial_tier_size;
    
    %start at the top tier
    level = 0;
    
    %similarity function
    sim = @(c) (compute_similarity_cosine(c, new_case));
    
    %initialise
    for c = 1:length(cbr.clusters)
        clusters{c}.cluster = cbr.clusters{c};
        clusters{c}.finished = 0;
    end
    
    avg_sim = zeros(length(clusters), 1);
    
    %loop
    while(~all(cellfun(@(c)(c.finished),clusters) == 1))
        
        
        for cluster = 1:length(clusters)
            start = level * top_size + 1;
            finish = start + top_size * (level + 1);
            
            cases = clusters{cluster}.cluster;
            
            if (finish > length(cases))
                finish = length(cases);
                clusters{cluster}.finished = 1;
            end
            
            if (start < length(cases))
                cases = clusters{cluster}.cluster(start:finish);

                sims = arrayfun(sim,cases);
                [sims,indexes] = sort(sims, 'descend');
                b = k;
                if (k > length(indexes))
                    b = length(indexes);
                end
                possible = cases(indexes(1:b));
                possible = arrayfun(@(c, s) (setfield(c, 'average_sim', s)), possible(1:b), sims(1:b));
                topK = vertcat(topK, possible);

                topK = case_sort(topK);
                topK = topK(1:k);
                
                avg_sim(cluster) = (avg_sim(cluster) * (start - 1) + sum(sims)) / finish;
            end
            
            
        end
        
        m = max(avg_sim);
        %eliminate straglers
        
        clusters = clusters(find(avg_sim > m*t));
        avg_sim = avg_sim(find(avg_sim > m*t));
        level = level + 1;

    end
    
    scores = zeros(6,1);
    for c = 1:k
        scores(topK(c).solution) = scores(topK(c).solution) + topK(c).average_sim;
    end
    
    [~, w] = max(scores);
    winningK = topK(arrayfun(@(c)(c.solution == w), topK));
    ranks = arrayfun(@(c)(c.average_sim), topK);
    [~, p] = max(ranks);
    cbr_case = winningK(p);
end