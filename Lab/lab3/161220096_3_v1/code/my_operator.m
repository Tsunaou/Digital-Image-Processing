function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 

word = ocr(input_image,'TextLayout','Word');
if isempty(word.Words)
    output = word.Words;
else
    output = word.Words{1};
end
