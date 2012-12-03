function [ predictions ] = testCBR( cbr, test_ex )

predictions = zeros(length(test_ex), 1);

for i = 1 : length(test_ex)
    c1 = create_case(create_AU(test_ex(i,:)), []);
    retrieved = retrieve(cbr, c1);
    reused = reuse(retrieved, c1);
    predictions(i) = reused.solution;
    cbr = retain(cbr, reused);
end

end

