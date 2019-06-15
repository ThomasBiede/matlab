function [vG_perc, vP_perc] = findGrayValueLimits(mI,percentile)
% Seeks for the gray values in the image at percentile and 100-percentile.
%
%   [vG_perc vP_perc] = findGrayValueLimits(mI,percentile)
%
%   INPUT
%       mI ... gray scale image
%       percentile ... in the range from 0 to 100%
%
%   OUTPUT
%       vG_perc ... two gray values corresponding to the percentiles
%       vP_perc ... two (exact) propabilities corresponding to the
%       percentiles

[vCount, vBin] = imhist(mI);
vCumFrequency = cumsum(vCount);
vP = vCumFrequency/vCumFrequency(end) * 100;

vId_percentile(1) = find(vP>percentile, 1);
vId_percentile(2) = find(vP>100-percentile, 1);
vP_perc = vP(vId_percentile);
vG_perc = vBin(vId_percentile);

end

