function [ output_cases ] = remove_duplicate_cases( input_cases )
output_cases = [];
for i = 1:length(input_cases)
  [r1, r2] = arrayfun(@(x)find(isequal(x.au_vector, input_cases(i).au_vector)),output_cases,'uniformoutput',false);
  if ~(sum(cellfun(@sum, r1))) 
   output_cases = [output_cases; input_cases(i)];
  end
end

%for i = 1:length(input_cases)
%   is_present = 0;
%   for j = 1:length(output_cases)
%       if all(isequal(input_cases(i).au_vector, output_cases(j).au_vector)) == 1
%           is_present = 1;
%           break;
%       end
%   end
   
%   if ~is_present
%       output_cases = [output_cases; input_cases(i)];
%   end
   
%end

end

