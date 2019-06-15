listdir = dir('./LenaPics/*.jpg');

N = length(listdir);
mI = zeros(512,512,N);

for x = 1:N
    path = sprintf('./LenaPics/%s', listdir(x).name);
    mI(:, :, x) = imread(path);

end
   % mI = double(mI);
    
mSNR_db = zeros(N,1);

for x= 1:N
    [P_S, P_N, SNR_db, mMean, mNoise] = calcSNR(mI(:,:,1:x));
    mSNR_db(x) = SNR_db;
end

figure,
subplot(121), plot(1:N, mSNR_db(:), 'b-'), grid on;

%mSNR_db = zeros(n);

mI_best = mMean;

for x= 1:N
    
    sigma = x;
    L = 2 * ceil(5/2 * sigma)+1;
    mH_Gaus = fspecial('gaussian', L, sigma);
    
    mI = imfilter(mI, mH_Gaus);
    
    [P_S, P_N, SNR_db, mMean, mNoise] = calcSNR(mI(:,:,:));
    P_D = std(mI_best-mMean)^2;
    Dist(x) = 10 * log10(P_S/P_D);
    mSNR_db(x) = SNR_db;
end

subplot(122), plot(1:N(1,1), mSNR_db(:), 'b-', 1:N(1,1), Dist(:), 'r-', grid on;
