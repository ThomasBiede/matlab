% clear all, close all, clc

% mI = double(fitsread('../Assets/Mean M81_Lu_Cropped.fits'));
% fNorm = @(mI) (mI-min(mI(:)) / range(mI(:)));
% mI = fNorm(mI);

% fGamma = @(mI, gamma) power(mI, gamma);
% fLog = @(mI, d) log10(mI*10^d+1)/log10(10^d+1);


% % fT = @(mI) fGamma(mI, 1/3);
% fT = fLog(mI, 4);

% figure,
% imshow(fT, [])
clear all, close all, clc , warning('off','all')

mI = fitsread('../Assets/Mean M81_Lu_Cropped.fits');
mI = double(mI);

fnorm = @(mI) (mI -min(mI(:))) / range(mI(:));
mI = fnorm(mI);

imshow(mI,[]) , title('originalbild')
imhist(mI), grid on, title('histogramm original')
fGamma = @ (mI,gamma) power(mI,gamma); % Verändern des bldes
fT = @(mI) fGamma(mI,1/3);
ezplot(fT,[1 0]), title('grauwertinformation')
mI_enh = fT(mI); %enhanced image
imshow (mI_enh,[])
Tg =@(g , d) log10(g*10^d+1) / log10(10^d+1);
fT = Tg(mI , 3);
imshow(fT)


