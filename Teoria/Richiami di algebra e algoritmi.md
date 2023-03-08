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



