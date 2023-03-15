Un sistema in forma matriciale si scrive:
$Ax = b$
In cui _A_ è una matrice quadrata nxn, mentre _x_ e _b_ sono vettori colonna. _A_ e _b_ sono determinati (contengono valori numerici), mentre x contiene delle incognite.

La soluzione è quindi $x=A^{-1}b$ con il **metodo dell'inversa**
Ricorda: moltiplica in modo coerente con l'ordine dei fattori.

Calcolare l'inversa richiede il calcolo del determinante, che necessita $n!$ operazioni: $\frac{1}{det(A)}A^{\#t}$
Dove $A^{\#t}$ è la matrice trasposta dei complementi algebrici di A

Vedi: esempio di risoluzione $7x = 21$ con due algoritmi differenti

# Sistemi di facile risoluzione

## Sistema "banale"
$I\begin{pmatrix} x_{1} \\ x_{2} \\ ... \\ x_{n}  \end{pmatrix} = \begin{pmatrix} b_{1} \\ b_{2} \\ ... \\ b_{n}  \end{pmatrix}$

Questo sistema non richiede praticamente soluzione, è equivalente a: $\begin{equation} \begin{cases} x_1 = 2 \\ x_2 = 1 \\ ... \\ x_n = 5 \end{cases} \end{equation}$

## Sistema diagonali
Dato il seguente sistema:
$\begin{equation} \begin{cases} d_1x_1 = 2 \\ d_2x_2 = 1 \\ ... \\ d_nx_n = 5 \end{cases} \end{equation}$

Scritto come $Dx=b$, dove D è una matrice diagonale (solo coeff sulla diagonale principale), può essere risolto in O(n) -> n divisioni

$x_i = \frac{b_i}{d_i} \quad \forall i=1,...,n$

## Sistemi triangolari
$\begin{equation} \begin{cases} 2x_1=6 \rightarrow x_1 = 3 \\ 3x_1+x_2=5 \rightarrow x_2 = 5 - (3*3) = -4 \\ x_1-3x_2+\frac{1}{2}x_3 = 4 \\ x_1 + 2x_2+\frac{1}{2}x_3 - x_4 = 0 \end{cases} \end{equation}$

Si risolve facilmente con una **sostituzione in avanti**

$\begin{pmatrix} a_{11} & 0 & ... & 0 \\ a_{21} & a_{22} & ... & 0 \\ \vdots & \vdots & \vdots \\ a_{n1} & a_{n2} & ... & a_{nn} \\ \end{pmatrix} \begin{pmatrix} x_{1} \\ x_{2} \\ ... \\ x_{n}  \end{pmatrix} = \begin{pmatrix} b_{1} \\ b_{2} \\ ... \\ b_{n}  \end{pmatrix}$

La matrice A è una matrice triangolare inferiore

$x_i = \frac{1}{a_{ii}}(b_i - \sum^{i-1}_{j=i}a_{ij}x_{j})$

Costo intorno a $n^2$ -> sempre meglio di calcolare l'inversa

Nel caso di una matrice triangolare superiore:
TODO: sistema generico con A triangolare superiore

Soluzione: $x_i = \frac{1}{a_{ii}}(b_i - \sum^{n}_{j=i+1}a_{ij}x_{j})$

## Implementazione Matlab
Dati $a, b$ rispettivamente matrice 1xn e nx1, abbiamo che:
- $a*b = c$ di dimensione 1x1
- $b*a = M$ di dimensione nxn

Vedi:
- `D = diag(d)` -> crea una matrice diagonale D a partire da un vettore colonna d
- `d = diag(D)` -> estrae la matrice 
- `istril()` e `istriu()` -> matrice triangolare inferiore/superiore
![[diag_solver.m]]

Verifica soluzione: $Az=b$ con $z$ soluzione

TODO: test diag_solver.m
TODO: risoluzione matrice triangolare in matlab

## Stabilità degli algoritmi di sostituzione in avanti
Dato il sistema:
$\begin{pmatrix} l_{11} & 0 \\ l_{21} & l_{22} \end{pmatrix}\begin{pmatrix} x_{1} \\ x_{2} \end{pmatrix}=\begin{pmatrix} b_{1} \\ b_{2} \end{pmatrix}$

La soluzione esatta è $x^*$, mentre quella in aritmetica finita è $\tilde{x}$

TODO: completa con slide 179

>Gli algoritmi di sostituzione possono diventare instabili qualora gli elementi del triangolo inferiore siano molto più grandi degli elementi sulle diagonali

# Sistemi qualsiasi
## Metodo di Cramer
Problema: devo calcoare n+1 determinanti

Richiami metodo di Cramer:
TODO: determinante della matrice A in cui la prima colonna è sostituita dal vettore colonna b, diviso per il determinante di A e via così per x1, x2, x3, ...

Se calcolo il det con il metodo di Laplace:
$det(A) = ...$
TODO: sommatoria per la dimensione della matrice di $m_{ij}$ con segno $(-1)^{i*j}$ per il determinate della matrice ottenuta rimuovendo riga i e colonna j
vedi: https://it.wikipedia.org/wiki/Teorema_di_Laplace

Costo di n!

## Riconducendosi a sistema triangolare
Dato il sistema $Ax = b$ vogliamo fattorizzre A in modo tale che $A = L*U$ con:
- L matrice triangolare inferiore
- R matrice triangolare superiore

Possiamo riscrivere il sistema: $L*U*x = b$ con $U*x=y$

Ci basta risolvere: $\begin{equation} \begin{cases} L*y=U \\ U*x=y \end{cases} \end{equation}$

### Fattorizzazione di A
Se vogliamo ricavare la triangolare superiore U -> n-1 passi di eliminazione gaussiana per azzerare gli elementi sotto alla diagonale. Durante il procedimento modificheremo anche gli elementi sopra alla diagonale, l'importante è azzerare gli elementi sotto alla diagonale principale.

Gli elementi verranno annullati con combinazioni lineari delle righe. Date:
- $\bar{v} = (v_1, v_2, v_3, v_4)$
- $\bar{u}=(u_1, u_2, u_3, u_4)$

La combinazione lineare di questi due vettori è $\bar{u} = r \bar{v}$ -> $(u_1+rv_1, u_2+rv_2, ..., u_n+rv_n)$

#### Passo 1 eliminazione
- Pivot: $a_{11}$
- Hp: $a_{11} \neq 0$
- Moltiplicatori: TODO: sotto pivot, sopra elemento in questione della prima sottocolonna

TODO: mostra cosa succede

Partiamo con A1 = A

Posso esprimere la moltiplicazione per il moltiplicatore e la somma con la riga come prodotto $L_1A_1$ dove $L_1$ è una matrice identità con i moltiplicatori nella prima sottocolonna (colonna sotto alla diagonale principale), mentre $A_1$ è la matrice al passo 1.

Quindi $A_2 = L_1A_1$

#### Passo 2 eliminazione
$A_3=L_2A_2$

TODO: vedi slide 185

#### Passo k generico eliminazione
Devo annullare gli elementi di n-k righe

#### Esempio numerico
$L_k$ -> k-esima matrice di trasformazione elementare di Gauss

TODO: inventa

#### Wrap up
$U=A_n=L_{n-1}A_{n-1}=L_{n-1}L_{n-2}A_{n-2}=...=L_{n-1}L_{n-2}...L_2L_1A$

- Rinominando il prodotto delle matrici $L_i$ con $L^{-1}$ -> matrice quadrata nxn
- Se L fosse invertibile
- $LU=A$

Quindi:
- si calcola il prodotto
- si inverte la matrice risultante
- si moltiplica a sinistra per $U$
