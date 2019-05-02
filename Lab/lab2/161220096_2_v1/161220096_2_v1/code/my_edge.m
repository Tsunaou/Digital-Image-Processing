function output = my_edge(input_image,type)
%in this function, you should finish the edge detection utility.
%the input parameter is a matrix of a gray image
%the output parameter is a matrix contains the edge index using 0 and 1
%the entries with 1 in the matrix shows that point is on the edge of the
%image
%you can use different methods to complete the edge detection function
%the better the final result and the more methods you have used, you will get higher scores
switch type
    case 'r'
        output = my_roberts(input_image);
    case 'p'
        output = my_prewitt(input_image);
    case 's'
        output = my_sobel(input_image);
    case 'm'
        output = my_marr(input_image,4);
    case 'c'
        output = my_canny(input_image);
    otherwise
        output = my_sobel(input_image);
end

        
