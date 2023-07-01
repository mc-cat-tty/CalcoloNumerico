function [x] = diag_solver(A, b)
    d = diag(A);
    x = d .\ b;
end