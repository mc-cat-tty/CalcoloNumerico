img = imread("squirrel.jpeg");
imgL = imread("lowpassed.png");
imgH = imread("highpassed.png");
imgs = {img; imgL; imgH};
figure(1);

for i=1:length(imgs)
    dftImg = fftshift(ifft2(cell2mat(imgs(i))));
    realDftImg = real(dftImg);
    R = max(realDftImg, [], 'all');
    c = 255 / log(1 + abs(R));
    logCompressedDft = c * log(1 + abs(realDftImg));

    subplot(2, 3, i);
    imshow(logCompressedDft);
    
    subplot(2, 3, i+3);
    imshow(cell2mat(imgs(i)));
end

waitforbuttonpress();
close(1);