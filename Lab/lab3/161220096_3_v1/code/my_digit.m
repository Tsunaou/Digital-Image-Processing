function output = my_digit(input_image)
%in this function, you should finish the digit recognition task.
%the input parameter is a matrix of an image which contains a digit.
%the output parameter represents which digit it is.

word = ocr(input_image,'TextLayout','Word','CharacterSet','1234567890');
if isempty(word.Words)
    output = word.Words;
else
    output = word.Words{1};
end
