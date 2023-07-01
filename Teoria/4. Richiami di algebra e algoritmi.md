Le matrici (che useremo) vivono nello spazio $\mathbb{R}^{mxn}$
Dove m numero righe e n numero colonne.

Matrice identica ($I$) moltiplicata per A continua a dare A
Matrice inversa $A^{-1}$ se moltiplicata per A dà $I$
Matrice trasposta ha dimensione $\mathbb{R}^{nxm}$ con righe e colonne scambiate

# Costi
Somma e differenza sono lineari, costano $nxm$

Prodotto matrice-matrice: $O(n^3)$
Il prodotto matriciale tra matrice $m*n$ e $n*p$ costa. L'elemento $c_{ij}$ della matrice risultato è il prodotto scalare tra la riga i e la colonna j:
- $n-1$ somme per elemento
- $m*p$ elementi nel risultato (matrici compatibili)
Costo $n*m*p$

Prodotto matrice-vettore (colonna): $O(n^2)$

# Proprietà prodotto matriciale
## Elementro neutro
Data $A$ con dimensione $n*m$

$A*I_n = A*I_m$

## Trasposizione
$(AB)^T = B^T*A^T$

Vedi: BLAS - Basic Linear Algebra Subroutine -> Netlib

## Inversa di una matrice (quadrata)
Le matrici inverse esistono solo per le matrici quadrate (condizione necessaria, ma non sufficiente)

Data $A$ quadrata di ordine $n$ si dice **invertibile** (o **non singolare**) se esiste $X\in\mathbb{R}^{n*n}$ tale che

$AX=XA=I$ a questo punto $X=A^{-1}$

### Proprietà
- $(A^{-1})^{-1} = A$
- $(A^{T})^{-1}=(A^{-1})^{T}=A^{-T}$
- Se A, B invertibili, lo è anche il loro prodotto: $(AB)^{-1} = B^{-1}A^{-1}$

# Determinante di una matrice
$det(a_{11}) = a_{11}$
$det\begin{pmatrix}   a_{11} & a_{12}\\ a_{21} & a_{22} \end{pmatrix} = a_{11}a_{22} - a_{12}a_{21}$
$det\begin{pmatrix}   a_{11} & a_{12} & a_{13}\\ a_{21} & a_{22} & a_{23}\\ a_{31} & a_{32} & a_{33} \end{pmatrix} = a_{11} det\begin{pmatrix}   a_{22} & a_{23}\\ a_{32} & a_{33} \end{pmatrix} - a_{12} det\begin{pmatrix}   a_{21} & a_{23}\\ a_{31} & a_{33} \end{pmatrix} + a_{13} det\begin{pmatrix}   a_{21} & a_{22}\\ a_{31} & a_{32} \end{pmatrix}$
Prendendo il terzo esempio:
- complessità_det(3x3) = 3 volte il determinante di matrici 2x2 -> n * complessità_det(2x2)
- complessità_det(2x2) = 2 volte il determinante di matrici 1x1 -> n * complessità_det(1x1)
- complessità_det(1x1)

Riavvolgendo il conto diventa: n * n-1 * ... * 1

>Calcolare il determinante di una matrice con la definizione costa **n!**

## Proprietà
TODO: PROPRIETÀ DETERMINANTE E MODULO NUMERI COMPLESSI

# Autovalori
>Data $A\in \mathbb{R}^{n*n}$, $x\in \mathbb{C}^n$ vettore diverso da zero e uno scalare $\lambda \in \mathbb{C}$ sono (rispettivamente) autovettore e autovalore di A se: $Ax=\lambda x$

**Condizione operativa**:
Soluzioni dell'equazione $det(A-\lambda I)=0$
Il membro sx è il *polinomio caratteristico* di A

## Proprietà
- $det(A) = \lambda_1 \lambda_2 ...  \lambda_n$
- Una matrice è invertibile se tutti i suoi autovalori sono NON nulli
- Se A invertibile e $\lambda$ suo autovalore => $\frac{1}{\lambda}$ autovalore di $A^{-1}$
- Se A simmetrica ($A = A^T$) => tutti gli autovalori sono reali

TODO: RAGGIO SPETTRALE

# Norma
## Norma vettoriale
Dato un vettore in $\mathbb{R}^n$ è un valore in $\mathbb{R}$ non negativo indicatore della grandezza degli elementi nel vettore (indip dal segno).

Cosa vogliamo?
- se vettore a componenti nulle -> zero
- se moltiplico il vettore per k o -k -> norma_vettore * k
- deve valere la proprietà triangolare (un lato di un triangolo minore o uguale della somma degli altri due) -> infatti la somma vettoriale equivale a pensare che due vettori formino due lati di un triangolo e il terzo sia il vettore che congiunge gli estremi degli altri due

TODO: RICHIESTE IN LINGUAGGIO MATEMATICO

Va bene qualsiasi funzione che rispetti queste 3 caratteristiche ($\|\cdot\|_{*}$):
1. **Norma $\infty$**: $\|x\|_{\infty} = max_{i=1, ..., n}{\|x_i\|}$
2. **Norma 1**: $\|x\|_1=\sum_{i=1}^{n}{|x_i|}$
3. **Norma 2 (Euclidea)**: $\|x\|_2=\sqrt{\sum_{i=1}^{n}{|x_i|^2}}$

### Proprietà
- Elevando Norma 2 al quadrato si ottiene: $\|x\|_2^2=x_1^2+x_2^2+...+x_n^2=x^Tx$ con _x_ vettore colonna (la nostra unità elementare)
- TODO: SECONDA PROPRIETÀ

## Norma matriciale
Richiediamo le stesse caratteristiche della norma vettoriale.

Vogliamo uno strumento che fissata la matrice A ci dia la grandezza degli elementi di $A\in\mathbb{R}^{n*n}$.

Idea: moltiplico A per ogni possibile vettore di $\mathbb{R}^n$, calcolo la norma, divido per la norma del vettore scelto. Tra tutti prendo il valore più grande ottenuto da questo rapporto.

Possibili norme:
- **Norma $\infty$**: sommo i valori di ogni riga, ottengo un vettore, prendo il massimo.
- **Norma 1**: sommo i valori di ogni colonna, ottengo un vettore, prendo il massimo
- **Norma 2 (Euclidea)**: norma 2 al quadrato è il raggio spettrale della matric eper la matrice trasposta $\|A\|_2=\sqrt{\rho(A*A^T)}$

TODO: finisci possibili norme