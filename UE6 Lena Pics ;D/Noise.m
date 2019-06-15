listdir = dir('./LenaPics/*.jpg');

n = size(listdir);
mI = zeros(512,512);

for x = 1:n
    path = sprintf('./LenaPics/%s', listdir(x).name);
    mI(:, :, x) = imread(path);
    mI = double(mI);
end

for y = 1:n
    imshow(mI(:, :, y), [])
end