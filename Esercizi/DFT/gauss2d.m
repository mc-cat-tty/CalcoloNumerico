function F = gauss2d(Amp, muX, sigmaX, muY, sigmaY, x, y)  % every arg is a scalar
 F = Amp * exp(   -((x - muX).^2 / (2*sigmaX^2) + (y - muY).^2 / (2*sigmaY^2))    );