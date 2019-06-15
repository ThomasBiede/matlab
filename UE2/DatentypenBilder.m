%% Datentypen von digitalen Bildern
% In diesem Abschnitt werden die Grundlagen von Einlesen und Anzeigen von 
% digitalen Bildern behandelt.

clear all, close all, clc

mI = imread('moon.tif'); %Grauwertbild, uint 8

figure, imshow(mI)
impixelinfo()
colormap(gray), colorbar

%% Dynamik eines Bildes
% Die Bittiefe eines Pixels definiert die mögliche Anzahl an Abstufungen
% (Quantisierung), die die Amplitude eines Signals annehmen kann und wird
% auch als Dynamik bezeichnet. Ein 8-Bit-Bild kann 256 Graustufen
% auflösen, was für Menschen ausreichend ist, da diese maximal 200
% Graustufen voneinander unterscheiden können, d.h. 0.5% Unterschied.

%mI_black = bitsra(mI, 7);
%mI_black_minVal = min(min(mI_black))
%mI_black_maxVal = max(max(mI_black))

%figure, 
%subplot(121), imshow(mI_black, []), title(num2str([mI_black_minVal, mI_black_maxVal], 'min: %d, max %d'))
%subplot(122), imhist(mI_black), grid on
%impixelinfo()

figure, 
for n=0:7
    mI_black = bitsra(mI, n);
    mI_black_minVal = min(min(mI_black));
    mI_black_maxVal = max(max(mI_black));
    subplot(131), imshow(mI_black, []), title(num2str([mI_black_minVal, mI_black_maxVal], 'min: %d, max %d'))
    subplot(132), imshow(mI_black)
    subplot(133), imhist(mI_black), grid on
    impixelinfo()
    pause()
end

%%
% Wird die Funktion imshow ohne weitere Parameter aufgerufen, so entspricht
% die angezeigte Intensität am Monitor dem Pixelwert, d.h. desto kleiner
% der Wert, desto dunkler erscheint das Pixel am Monitor.
%
% unit8: 0-> Schwarz und 255-> weiß (2^8 Graustufen)
% unit8: 0-> Schwarz und 65535-> weiß (2^16 Graustufen)
% double: 0-> Schwarz und 1-> weiß
%
% Wird die Funktion imshow mit dem Parameter [] (leeres Array) aufgerufen,
% so wird der kleinste Pixelwert als schwarz und der größte Pixelwert als
% Weiß dargestellt -- es geschieht eine automatische Kontrastanpassung für
% die Darstellung, ohne die originalen Werte im Bild tatsächlich zu
% verändern

%%
figure,
    mI_mult_d = double(mI) / 255;
    imshow(mI_mult_d)
    impixelinfo

%% Bilder mit Double-Datentypen
% Um mit Bildern rechnen zu können, muss ein Zahlenraum mit einer größeren
% Dynamik verwendet werden, z.B. double oder int16 oder int32. Der
% uint8-Wert 130 kann nicht verdoppelt werden, da 130*2=260 und dieser Wert
% in uint8 nicht mehr enthalten ist!
% Daher werden Berechnungen in double durchgeführt und wenn nötig legidlich
% das Endergebnis zurück in unit8 konvertiert, z.B. bei Abspeichern des
% Bildes auf die Festplatte (jpg-Format, png-Format, tif-Format...).
%
% Die Dynamik des ursprünglichen Bildes bleibt nach der Konvertiering
% unveränder erhalten, d.h. diese wird nicht erhöht!
