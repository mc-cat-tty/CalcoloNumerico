function [L, D] = fattorizza_simm(A)
n = length(A);
P = zeros(n);
D = zeros(n, 1);
L = eye(n);

if (~ issymmetric(A))
    error("La matrice non è simmetrica");
end

for j = 1:n
    %{
    for k = 1:j-1
        P(j, k) = L(j, k) * D(k);
    end
    %}
    
    P(j, 1:j-1) = L(j, 1:j-1) .* D(1:j-1)'; % sopra si trova l'equivalente

    D(j) = A(j, j) - L(j, 1:j-1) * P(j, 1:j-1)';
    
    if (abs(D(j)) < eps)
        error("Fattorizzazione non eseguibile");
    end

    for i = j+1:n
        L(i, j) = (A(i, j) - L(i, 1:j-1) * P(j, 1:j-1)') / D(j);
    end
end

D = diag(D);