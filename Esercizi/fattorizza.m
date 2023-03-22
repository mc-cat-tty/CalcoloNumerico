% Funzione che calcola la fattorizzazione LU di A 
% con l'algoritmo di fattorizzazione di Gauss

function [L, U] = fattorizza(A)
n = length(A);
for k = 1:n-1
    if (abs(A(k, k)) < eps)  % Equivalente a A(k, k) == 0
        error("Fattorizzazione non eseguibile \n");
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