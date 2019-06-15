function [vG_perc,vP_perc] = findGrayValueLimits(mI,percentile)
%Seeks for the gray value in the image at percentile and 100-percentile
%   [vG_perc,vP_perc] = findGreyValueLimits(mI,percentile)
%   
%   INPUT
%       mI ... gray-scale-image
%       percentile ... in the range from 0 to 100%
%
%   OUTPUT
%       vG_perc ... two gray values corresponding to the percentile
%       vP_perc ... two (exact) probabilities corresponding to the percentile

[vCount, vBin] = imhist(mI);
vCumFrequency = cumsum(vCount);
vP = vCumFrequency/vCumFrequency(end)*100;
perc = percentile;
vId_perc(1) = find(vP > perc, 1);
vId_perc(2) = find(vP > 100-perc, 1);

vP_perc = vP(vId_perc);
vG_perc = vBin(vId_perc);
end

