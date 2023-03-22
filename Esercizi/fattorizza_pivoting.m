% Funzione che calcola la fattorizzazione LU di A 
% con l'algoritmo di fattorizzazione di Gauss

function [L, U, P] = fattorizza_pivoting(A)
n = length(A);
P = eye(n);

for k = 1:n-1
    if (abs(A(k, k)) < eps)  % Equivalente a A(k, k) == 0
        error("Fattorizzazione non eseguibile \n");
    end

    [~, max_idx] = max(abs(A(k:n, k)));
    max_idx = max_idx - 1 + k;  % Aggiorna l'indice rispetto alla matrice A
    if (max_idx ~= k)
        current_perm = eye(n);
        current_perm(k, k) = 0;
        current_perm(max_idx, max_idx) = 0;
        current_perm(max_idx, k) = 1;
        current_perm(k, max_idx) = 1;

        A = current_perm * A;
        P = current_perm * P;
    end
    
    A(k+1:n, k) = A(k+1:n, k) / A(k, k);  % Salvo il moltiplicatore nel 
    % vettore colonna sotto a k
    
    A(k+1:n, k+1:n) = A(k+1:n, k+1:n) - A(k+1:n, k) * A(k, k+1:n);
end

% Alla fine di questi passaggi ho la matrice A fattorizzata, ma non ancora
% splittata in 2

U = triu(A);  % Estraggo dalla matrice A una matrice triangoloare superiore

L = tril(A, -1);  % Estraggo la matrice triangolare inferiore, scartando
% la diagonale principale

L = L + eye(n);  % Inserisco come diagonale principale una serie di 1 in L

end