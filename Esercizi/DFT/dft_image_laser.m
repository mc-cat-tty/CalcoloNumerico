img = imread("ref.jpeg");
img1D1 = imread("d1_1.jpeg") - img;
img2D1 = imread("d1_1.jpeg") - img;
imgD2 = imread("d2.jpeg") - img;
imgs = {img1D1(:, : , 1), img2D1(:, :, 1), imgD2(:, :, 1)}; % filter red channel
l = length(imgs);
figure(1);

dftImgs = cell(1, l);

for i=1:l
    dftImg = fftshift(ifft2(cell2mat(imgs(i))));
    realDftImg = real(dftImg);
    dftImgs{i} = realDftImg;
end

Rs = zeros(1, l);
for i=1:l
    Rs(i) = max(cell2mat(dftImgs(i)), [], 'all');
end
R = min(Rs);
c = 255 / log(1 + abs(R));


for i=1:l
    realDftImg = cell2mat(dftImgs(i));
    logCompressedDft = c * log(1 + abs(realDftImg));
    
    subplot(2, l, i);
    imshow(logCompressedDft);
    
    subplot(2, l, i+l);
    imshow(cell2mat(imgs(i)));
end
