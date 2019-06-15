%Bilder laden und Anzeigen
clear all %alle vars l�schen
close all %alle fenster schlie�en
clc %clear console

%%Digitalbild laden und Anzeigen
matrix_image = imread('peppers.png'); %laden des RGB Bildes

%matrix_image = matrix_image(150:300, 300:450, :); nur Paprika (Array
%slicing Python), alternative: imcrop();

%%Farbkan�le
matrix_image_red = matrix_image(:, :, 1); %Rotkanal
matrix_image_green = matrix_image(:, :, 2); %Gr�nkanal
matrix_image_blue = matrix_image(:, :, 3); %Blaukanal


figure,
subplot(2, 2, 1),
imshow(matrix_image),
title('RGB'),

subplot(2, 2, 2),
imshow(matrix_image_red),
title('Red'),

subplot(2, 2, 3),
imshow(matrix_image_green),
title('Green'),

subplot(2, 2, 4),
imshow(matrix_image_blue),
title('Blue');
%%
%RGB to Grey
matrix_image_gray = rgb2gray(matrix_image);

[matrix_image_row, matrix_image_col] = size(matrix_image_gray);

%figure,
%imshow(matrix_image_gray),
%title('Grey');

%figure,
%imhist(matrix_image_gray),
%title('Histogramm h(g)');

figure, 
mesh(matrix_image_gray),
title('Grauwertgebirge'),
colormap();
%%
%In einem Grauwerthistogramm werden die H�ufigkeiten der im Bild
%auftretende Intensit�t (Pixelwerte) dargestellt. Auf der Abzisse (x-Achse)
%sind alle m�glichen Intensit�tswerte aufgetragen. Auf der
%Ordinate(y-Achse) ist die H�ufigkeit der jeweiligen Intensit�t
%aufgetragen, d.h. die Anzahl der Pixel, die den jeweiligen Intensit�tswert
%besitzen.

[vCount, vBin] = imhist(matrix_image_gray);

figure,
subplot(121), imshow(matrix_image_gray), title('Grauwertbild'), impixelinfo
subplot(122), bar(vBin, vCount), grid on, axis tight
xlabel('g'), ylabel('H�ufigkeit h(g) oder h_g')
title('Histogramm')

%% Kumulative H�ufigket

vCumFrequency = cumsum(vCount);
vP = vCumFrequency/vCumFrequency(end)*100;

figure,
subplot(311), plot(vBin, vCount), axis tight, grid on, axis tight, title('Histogramm'),
subplot(312), plot(vBin, vCumFrequency), axis tight, grid on, axis tight, title('Kummulative Histogramm'),
subplot(313), plot(vBin, vP), grid on, axis tight, title('Wahrscheinlichkeitsverteilung'), hold on

% Perzentille
perc = 10;
[vG_perc,vP_perc] = findGrayValueLimits(matrix_image_gray, perc);

plot(vG_perc, vP_perc, 'ro');
title({'Wahrscheinlichkeitsverteilung', num2str([perc, 100-perc], 'Perzentile: [%d%% %d%%]')});

%findGreyValueLimits(matrix_image_gray, 10)
