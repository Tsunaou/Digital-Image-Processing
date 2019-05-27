function output = my_operator(input_image)
%in this function, you should finish the operator recognition task.
%the input parameter is a matrix of an image which contains an operator.
%the output parameter represents which operator it is. 

% = £º0.5714
% + £º0.2504
% - £º0.9962

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
ra = m/n; %±ÈÀı

if out>0.8 || ra < 0.3
    output = '-';
elseif out < 0.4 && ra > 0.7
    output = '+';
else
    output = '=';
end
