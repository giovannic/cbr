function [ new_cbr ] = retrieve( new_case, cbr )
%inserts case to cluster and updates similarities
    %set threshold
    t = 0.9;
    
    %store duplicates
    duplicates = {};
    
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
            level = 1;
            if (level <= length(clusters{cluster}.tier))
                for cbr_case = 1:length(clusters{cluster}.tier)
                    
                    %get similarities
                    set = clusters{cluster}.tier(level);
                    c = set{cbr_case};
                    s = compute_similarity_cosine(c, new_case);
                    similarities(cluster) = similarities(cluster) + s;
                    
                    %notify about duplicates
                    if (cases_equal(new_case, cbr_case))
                        d.cluster = cluster;
                        d.sim = s;
                        duplicates(length(duplicates + 1)) = d;
                    end
                    
                    %update similarities - remember update by value not ref
                    c.average_sim = ((c.average_sim*clusters{cluster}.n) + s)/n+1;
                    set{cbr_case} = c;
                    clusters{cluster}.tier(level) = set;
                end
            else
                clusters(c).finished = 1;
            end
        end
        
        if (~isempty(duplicates))
            [~, p] = max(duplicates.sim);
            clusters = clusters(p);
        else
            m = max(similarities);
            clusters = clusters(similarities(similarities > m*t));
        end
    
    end
    
    [~, p] = max(similarities);
    cbr.clusters{clusters{p}.no} = clusters{p};
    
    %reorder
    
    new_cbr = cbr;
    
end