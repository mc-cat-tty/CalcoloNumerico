img = imread("ref.jpeg");
img1D1 = imread("d1_1.jpeg") - img;
img2D1 = imread("d1_2.jpeg") - img;
img3D2 = imread("d2.jpeg") - img;
imgs = {img1D1(:, : , 1), img2D1(:, :, 1), img3D2(:, :, 1)}; % filter red channel
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
R = max(Rs);
c = 255 / log(1 + abs(R));


for i=1:l
    realDftImg = cell2mat(dftImgs(i));
    logCompressedDft = c * log(1 + abs(realDftImg));
    
    subplot(3, l, i);
    imshow(logCompressedDft);
    
    subplot(3, l, i+l);
    imshow(cell2mat(imgs(i)));

    % 2D gaussian fitting
    [h, w] = size(logCompressedDft);
    s = max(size(logCompressedDft));
    lb = [0, -w/2, 0, -h/2, 0, -pi/4];
    ub = [255, w/2, (w/2)^2, h/2, (h/2)^2, pi/4];
    x0 = [1,0,50,0,50,0];
    [X,Y] = meshgrid(-w/2:w/2-1, -h/2:h/2-1);
    xdata = zeros(h, w, 2);
    xdata(:, :, 1) = X;
    xdata(:, :, 2) = Y;
    [x, resnorm, residual, exitflag] = lsqcurvefit(@gauss2d_params, x0, xdata, logCompressedDft, lb, ub);
    params = x

    % Visualize DFT surface and gaussian 2D surface
    subplot(3, l, 2*l+i);
    f = @(x, y) gauss2d(params(1), params(2), params(3), params(4), params(5), x, y);
    fsurf(f, [-400, 400]);
    % surf(logCompressedDft);
end