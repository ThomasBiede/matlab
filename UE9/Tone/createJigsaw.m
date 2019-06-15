function [mMontage mL mI] = createJigsaw(mI, mJigsawTemplate, isRandomizeOn)
% Create a jigsaw from image mI using the jigsaw template mJigsawTemplate.
% 
% EXAMPLE
%
%   mJigSaw = rgb2gray(imread('puzzle_5_7.jpg'));
%   mJigsawTemplate = imbinarize(mJigSaw, 'global');
% 
%   mI = rgb2gray(imread('peppers.png'));
%
%   mMontage = createJigsaw(mI, mJigsawTemplate, false);
% 
%   figure, imshow(mMontage, [])

scaleFactor = max(size(mJigsawTemplate)./size(mI));
mI = double(imresize(mI,scaleFactor, 'OutputSize', size(mJigsawTemplate)));
mL = bwlabel(mJigsawTemplate);

vsProps = regionprops(mL, 'Image', 'BoundingBox');
maxWidth = 0;
for i = 1:length(vsProps)
    maxWidth = max([vsProps(i).BoundingBox(3:4) maxWidth]);
end
width = floor(maxWidth*1.1/2)*2 + 1; 

mSelect = zeros(width, width, length(vsProps));
[vTemp vIdRand] = sort(rand(length(vsProps),1));
vIdRand = [1; setdiff(vIdRand, 1, 'stable')]; % start always with the upper most piece
for i = 1:length(vsProps),
     if isRandomizeOn  
        n = vIdRand(i);
     else
        n = i;
     end
    mPiece = imcrop((mL==n) .* mI, vsProps(n).BoundingBox);
    vPad = width-size(mPiece);
    vPadPre = floor(vPad/2);
    vPadPost = vPad - vPadPre;
    mPiece = padarray(mPiece, vPadPre, 'pre');
    mPiece = padarray(mPiece, vPadPost, 'post');
    
    mSelect(:,:,i) = mPiece;
end

N = ceil(sqrt(length(vsProps)));
oMontage = montage(mSelect, 'Size', [N N], 'ThumbnailSize', []);
mMontage = uint8(oMontage.CData);
mI = uint8(mI);
end

