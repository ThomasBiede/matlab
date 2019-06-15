%%
clear all, close all, clc
%% Automatische Kontrastverbesserung

mI = im2double(imread('pout.tif'));
cInfo = num2str([min(mI(:)) max(mI(:))], 'min: %.2f max: %.2f');
figure, 
subplot(121), imshow(mI), title('Originalbild') 
subplot(122), imhist(mI), grid on, title(cInfo)

percentile=1;
[vG_perc, vP_perc] = findGrayValueLimits(mI,percentile);
mIs=(mI-vG_perc(1))/(vG_perc(2)-vG_perc(1));
cInfo02 = num2str([vG_perc(1), vG_perc(2)], 'min: %.2f max: %.2f');
figure,
subplot(121), imshow(mIs), title('Kontrastverbessertes Bild')
subplot(122), imhist(mIs), grid on, title(cInfo02)

%% Darstellung der Grauwerttransformation
% Wir verwenden eine sogenannte anonyme Funktion, um die Funktionswerte der
% Grauwerttransformation g_out = T(g_in) zu berechnen.

vGin = 0:255;
fAC = @(g, gmin, gmax) ((min(max((g-gmin)/(gmax-gmin),0),1)));
fT = @(g) fAC(g, vG_perc(1), vG_perc(2));
figure, ezplot(fT, [0 1]), grid on, axis equal, title('Grauwerttransformation'), xlabel('g_{in}'), ylabel('g_{out}')
vLUT=uint8(255*fT(vGin/255));
%figure, plot(vLUT), grid on, axis equal tight, title('Grauwerttransformation'), xlabel('g_{in}'), ylabel('g_{out}')
mIat = vLUT(im2uint8(mI)+1);
figure, 
imshow(mIat)