vidobj = videoinput('winvideo');

triggerconfig(vidobj, 'manual');
N = 500;
T_thresh = 150;
vCount = [];

s_1 = strel('disk', 5);
s_2 = strel('disk', 25);

start(vidobj);

I_bg = gpuArray(im2uint8(rgb2gray(getsnapshot(vidobj))));

figure, 

for i = 1:N
    gFrame = gpuArray(im2uint8(rgb2gray(getsnapshot(vidobj))));
    I_bg = I_bg + sign(gFrame - I_bg);
    
    I_diff = gather(imabsdiff(gFrame, I_bg));
    
    [w, h] = size(I_diff);
    I_nn = gpuArray(I_diff>T_thresh);
    c = nnz(I_nn);
    c_rel = c / (w*h);
    
    vCount(i) = c_rel;
    
    gFrame_thresh = gpuArray(imbinarize(I_diff, graythresh(I_diff)));
    
    mT_open = imopen(gpuArray(gFrame_thresh), s_1);
    mT_close = imclose(mT_open, s_2);
    
    mBB = regionprops(gFrame_thresh, 'BoundingBox', 'Area'); 
    area = [mBB.Area].';
    [~, j] = max(area);
    box = mBB(j).BoundingBox;
    
    subplot(3, 2, 2), imshow(gFrame), hold on, rectangle('Position', box,'EdgeColor','r');
    
    subplot(3, 2, 1), imshow(I_bg);
    subplot(3, 2, 3), hist(vCount);
    subplot(3, 2, 4), imshow(I_diff);
    subplot(3, 2, 5), imshow(mT_open);
    subplot(3, 2, 6), imshow(mT_close);
    drawnow;
    
    fprintf("%d\n", i)
end

stop(vidobj);
delete(vidobj);