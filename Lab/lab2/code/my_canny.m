function [output] = my_canny(input_image)
%MY_CANNY Canny编译检测器
%   此处显示详细说明

    gray =input_image;
    a = im2single(gray);
    [m,n] = size(a);
    % 用于输出的边界位图
    e = false(m,n);
    % Magic numbers
    GaussianDieOff = .0001; 
    PercentOfPixelsNotEdges = .7; % 用于阀值选择
    ThresholdRatio = .4;          % 低阀值相对高阀值的比值
    sigma = 2.5; %设置sigma
    thresh = [];
   
    % 设计滤波器 - a gaussian和它的导数
    pw = 1:30; % possible widths
    ssq = sigma^2;
    width = find(exp(-(pw.*pw)/(2*ssq))>GaussianDieOff,1,'last');%find函数很给力...
    if isempty(width)
    width = 1;  % the user entered a really small sigma
    end
   
    t = (-width:width);
    gau = exp(-(t.*t)/(2*ssq))/(2*pi*ssq);     % 高斯一维滤波
   
    % Find the directional derivative of 2D Gaussian (along X-axis)
    % Since the result is symmetric along X, we can get the derivative along
    % Y-axis simply by transposing the result for X direction.
    [x,y]=meshgrid(-width:width,-width:width);
    dgau2D=-x.*exp(-(x.*x+y.*y)/(2*ssq))/(pi*ssq);%二维高斯方向导数
   
    % Convolve the filters with the image in each direction
    % The canny edge detector first requires convolution with
    % 2D gaussian, and then with the derivitave of a gaussian.
    % Since gaussian filter is separable, for smoothing, we can use
    % two 1D convolutions in order to achieve the effect of convolving
    % with 2D Gaussian.  We convolve along rows and then columns.
   
    %用一阶高斯滤波器平滑图像
    aSmooth=imfilter(a,gau,'conv','replicate');   % run the filter accross rows
    aSmooth=imfilter(aSmooth,gau','conv','replicate'); % and then accross columns
   
    %应用方向导数
    ax = imfilter(aSmooth, dgau2D, 'conv','replicate');
    ay = imfilter(aSmooth, dgau2D', 'conv','replicate');
   
    %计算梯度幅值
    mag = sqrt((ax.*ax) + (ay.*ay));
    magmax = max(mag(:));
    if magmax>0
        mag = mag / magmax;   % normalize
    end
   
    % 选择高低两个阀值,用于双阀值算法检测和连接边缘.
    if isempty(thresh)
        counts=imhist(mag, 64);
        highThresh = find(cumsum(counts) > PercentOfPixelsNotEdges*m*n,...
                   1,'first') / 64;
        lowThresh = ThresholdRatio*highThresh;
        thresh = [lowThresh highThresh];
    elseif length(thresh)==1
        highThresh = thresh;
        if thresh>=1
            eid = sprintf('Images:%s:thresholdMustBeLessThanOne', mfilename);
            msg = 'The threshold must be less than 1.';
            error(eid,'%s',msg);
        end
            lowThresh = ThresholdRatio*thresh;
            thresh = [lowThresh highThresh];
        elseif length(thresh)==2
            lowThresh = thresh(1);
            highThresh = thresh(2);
        if (lowThresh >= highThresh) || (highThresh >= 1)
            eid = sprintf('Images:%s:thresholdOutOfRange', mfilename);
            msg = 'Thresh must be [low high], where low < high < 1.';
            error(eid,'%s',msg);
        end
    end
   
    % The next step is to do the non-maximum supression. 
    % We will accrue indices which specify ON pixels in strong edgemap
    % The array e will become the weak edge map.
    idxStrong = []; 
    for dir = 1:4
        idxLocMax = cannyFindLocalMaxima(dir,ax,ay,mag);
        idxWeak = idxLocMax(mag(idxLocMax) > lowThresh);
        e(idxWeak)=1;
        idxStrong = [idxStrong; idxWeak(mag(idxWeak) > highThresh)];
    end
   
    if ~isempty(idxStrong) % result is all zeros if idxStrong is empty
        rstrong = rem(idxStrong-1, m)+1;
        cstrong = floor((idxStrong-1)/m)+1;
        e = bwselect(e, cstrong, rstrong, 8);
        e = bwmorph(e, 'thin', 1);  % Thin double (or triple) pixel wide contours
    end
    output = e;
end

function idxLocMax = cannyFindLocalMaxima(direction,ix,iy,mag)

	[m,n] = size(mag);
 
	% Find the indices of all points whose gradient (specified by the
	% vector (ix,iy)) is going in the direction we're looking at. 
	idx = find((iy<=0 & ix>-iy)  | (iy>=0 & ix<-iy));
 
	% Exclude the exterior pixels
	if ~isempty(idx)
        v = mod(idx,m);
        extIdx = find(v==1 | v==0 | idx<=m | (idx>(n-1)*m));
        idx(extIdx) = [];
    end
 
	ixv = ix(idx); 
	iyv = iy(idx);  
	gradmag = mag(idx);
 
	% Do the linear interpolations for the interior pixels
	d = abs(iyv./ixv);
	gradmag1 = mag(idx+m).*(1-d) + mag(idx+m-1).*d;
    gradmag2 = mag(idx-m).*(1-d) + mag(idx-m+1).*d;
 
    idxLocMax = idx(gradmag>=gradmag1 & gradmag>=gradmag2);
end
