% Function that takes an image then samples and quantizes it.
% input: image path
% output: quantized image matrix

function [image] = sqi(path)
% read in image
im = imread(path);
% get dimensions of image
[m,n] = size(im);
% sample every 10
ims = im(1:10:m, 1:10:n);
% now quantize
imq = floor(ims./51)*51;
image = imq;

return
end