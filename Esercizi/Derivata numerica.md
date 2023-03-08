# Cicli for
Possiamo usare un ciclo for:
```Matlab
h = zeros(16, 1); % ";" per evitare la stampa
for i = 1 : 16
	h(i) = 10^(-i); % indentazione ininfluente
end
```

Attenzione: gli indici partono da 1

Versione asciutta: `h = 10.^(-1:-16:-1);`

```Matlab
a = 1;
alpha_star = (sin(a + h) - sin(a)) ./ h;
```

Posso fare somma di uno scalare con un vettore interpretandola come la somma di a (e poi di sin(a)) con tutti gli elementi del vettore h.

Vedi `loglog()` per plottare un grafico
