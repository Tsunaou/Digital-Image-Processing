function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 

% = £º0.5730
% + £º0.2422
% - £º0.8667

img = input_image;
img = clear_boundary(img);
[m,n] = size(img);
cnts = 0;
for i=1:m
    for j=1:n
        if img(i,j)==0
            cnts = cnts+1;
        end
    end
end
out = cnts/(m*n);

if out>0.8
    output = '-';
elseif out < 0.4
    output = '+';
else
    output = '=';
end
