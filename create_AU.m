function [ output_vector ] = create_AU( input_vector )
output_vector = [];
for i = 1:length(input_vector)
    if input_vector(i)
        output_vector = [output_vector, i];
    end
end

end

