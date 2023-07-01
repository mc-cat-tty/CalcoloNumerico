function [x_next, k] = iterative_jacobi(x_corr, A, b, K_max, tau)
% A deve essere invertibile (es. diagonale dominante)
% x_corr (ovvero x0) random
% K_max intorno a 10^3
% tau intorno a 10^-2
D = diag(diag(A));
E = -1 .* tril(A, -1);
F = -1 .* triu(A, 1);
norm_tau_b = tau * norm(b);

for k = 1:K_max
x_next = diag_solver(D, (E+F) * x_corr + b);
res = b - A * x_corr;
if (norm(x_next - x_corr) < tau * norm(x_next) && norm(res) < norm_tau_b)
    return;
end
x_corr = x_next;
end

error("Safeguard parameter triggered");