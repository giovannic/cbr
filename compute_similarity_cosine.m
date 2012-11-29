function [ similarity ] = compute_similarity_cosine( case1, case2 )
% taken from http://en.wikipedia.org/wiki/Cosine_similarity

attributes1 = zeros(1,45);
for i = 1 : length(case1.au_vector)
    attributes1(case1.au_vector(i)) = 1;
end
attributes2 = zeros(1,45);
for i = 1 : length(case2.au_vector)
    attributes2(case2.au_vector(i)) = 1;
end

dp = dot(attributes1, attributes2);
d1 = sqrt(sum(attributes1));
d2 = sqrt(sum(attributes2));
similarity = dp/(d1*d2);


end