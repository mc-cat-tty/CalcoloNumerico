function [x] = my_diag(A, b)
 d = diag(A);
 x = b ./ d;
end

