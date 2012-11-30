function [ ret ] = john_test( item, cluster )
    
    ret = arrayfun(@compute_similarity_cosine, item, cluster);

end

