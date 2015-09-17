function [ out ] = ButterHPF( image, cutoffFreq, order)
%BUTTERHPF Summary of this function goes here
%   Detailed explanation goes here

h = size(image, 1);
w = size(image, 2);

[x, y] = meshgrid(-floor(w/2):floor(w-1)/2, -floor(h/2) : floor(h-1)/2);

out = 1./(1.+(cutoffFreq./(x.^2+y.^2).^0.5).^(2*order));

end

