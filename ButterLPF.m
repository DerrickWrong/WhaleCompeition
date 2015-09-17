function [ out ] = ButterLPF( image, cutoffFreq, order)
%BUTTERLPF Summary of this function goes here
%   Detailed explanation goes here
out = 1 - ButterHPF(image, cutoffFreq, order);

end

