function [ au_output ] = exam_to_au( examples )
    au_output = cell(size(examples,1));
    for i = 1:size(examples, 1)
        au_output{i} = create_AU(examples(i, :));
    end
end

