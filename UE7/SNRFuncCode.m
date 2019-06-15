%% Entrauschen von Bildern mit einem optimalen Tiefpass
% In dieser Übung wurde ein Tiefpass generiert um Bilder zu entrauschen. Man 
% verwendet einen Tiefpass anstatt der Mittelung weil wenn man einen Echtzeit 
% Videostream zum Beispiel hat kann man nicht 30 Bilder Zusammenfassen um ein 
% rauschfreies Bild zu erhalten, dies würde sich bei einem Videostream gewaltig 
% auf die FPS(Frames per second) auswirken. Wenn man z. B. mit 60FPS einen Videostream 
% aufnehmen würde und jeweils 30 Bilder mitteln würde dann hätte man 2 Bilder 
% in der Sekunde als Ergebnis. Um eine Echtzeit Entrauschung zu gewährleisten 
% wird ein Tiefpass verwendet mit dem man das Rauschen für jedes Bild herausfiltert, 
% so bleiben bei einer Echtzeitübertragung mit 60FPS auch alle 60 Bilder erhalten


listdir = dir('./LenaPics/*.jpg');
N = length(listdir);
mI = zeros(512,512,N);
for x = 1:N
    path = sprintf('./LenaPics/%s', listdir(x).name);%Einlesen der Bilder
    mI(:, :, x) = imread(path);%Speichern der Bilder in einer Matrix
end
%%
mSNR_db = zeros(N,1);
for x= 1:N
    [P_S, P_N, SNR_db, mMean, mNoise] = calcSNR(mI(:,:,1:x));%Berechnen der Signal-Noise-Ratio f�r 1:x Bilder
    mSNR_db(x) = SNR_db;
end
mNoise_best = mNoise;
%%
figure,
plot(1:N, mSNR_db(:), 'b-'), grid on, legend('SNR in db'), title('Signal-Noise-Ratio f�r N Bilder'), xlabel('Anzahl der Bilder'), ylabel('SNR_{db}');
vSNR_db = [];
mI_best = mMean;%Seperates speichern des besten Bildes(gemitteltes Bild)
vSDR_db = [];
vSigma = linspace(0.5, 2.5, 100);%Generieren der 100 Sigma Werte von 0,5 bis 2,5 
%%
for sigma = vSigma
    L = 2 * ceil(5/2 * sigma)+1;
    mH_Gaus = fspecial('gaussian', L, sigma);
    
    mI_filterd = imfilter(mI, mH_Gaus);
    
    [P_S, P_N, SNR_db, mMean, mNoise] = calcSNR(mI_filterd);
    vSNR_db(end+1) = SNR_db;
    
    mD = mI_filterd - mI_best;
    P_D = std(mD(:)).^2;
    SDR = P_S / P_D;
    
    vSDR_db(end+1) = 10*log10(SDR);
    
end
%%
maximum = max(vSDR_db);
[y, x] = find(vSDR_db==maximum);
figure,
plot(vSigma, vSNR_db, 'b-', vSigma, vSDR_db, 'r-',vSigma(x), maximum, 'kx', vSigma(x), vSNR_db(x), 'kx'),grid on, legend('SNR in db', 'SDR in db'), xlabel('Sigma'), ylabel('SDR_{db}, SNR_{db}'), title('SDR_{db} & SNR_{db}, dargestellt f�r das jeweilige Sigma');
%%
L_opt = 2 * ceil(5/2*vSigma(x))+1;
mH_Gaus_opt = fspecial('gaussian', L_opt, vSigma(x));
mI_filterd_opt = imfilter(mI(:,:,1), mH_Gaus_opt);
%%
figure,
subplot(231), imshow(mI(:,:,1), []), title('Verrauschtes Bild'),
subplot(232), imshow(mNoise_best(:,:,1), []), title('Bildrauschen'),
subplot(233), imshow(mI_best, []), title('Bild nach Mittelung'),
subplot(234), imshow(mI(:,:,1), []), title('Verrauschtes Bild')
subplot(235), imshow(mNoise(:,:,1), []), title('Bildrauschen (Tiefpass)')
subplot(236), imshow(mI_filterd_opt, []), title('Bild nach Tiefpassfilterung')