function [P_S, P_N, SNR_db, mMean, mNoise] = calcSNR(mI)
%CALCSNR Summary of this function goes here
% Detailed explanation goes here
mMean = mean(mI, 3);
mI_diff = mI-mMean;
P_S = std(mMean(:))^2;
P_N = std(mI_diff(:))^2;
SNR = P_S/P_N;
SNR_db = 10*log10(SNR);
mNoise = mI_diff;
end

