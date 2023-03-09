Obiettivo: avere un sistema **ben condizionato**

# Sistemi lineari
Data una matrice $A \in \mathbb{R}^{n*n}$ e un vettore colonna di termini noti $b \in \mathbb{R}^n$
Vogliamo che $Ax=b$

In forma esplicita abbiamo il sistema come lo scrivevamo in analisi. La forma matriciale è più adatta ad essere risulta da MatLab.

Nulla vieta che il sistema non sia quadrato -> rettangolare se $A\in\mathbb{R}^{n*m}$

I sistemi perfettamente *determinati* sono rappresentati da *matrici quadrate*
I sistemi *sottodeterminati* non sono risolvibili in modo "classico" (A n\*m con n < m)-> approssimaizone dati
I sistemi *sovradeterminati* (A n\*m con n > m) -> ho più equazioni del numero di incognite

# Esempio
Questo sistema è mal condizionato
$\begin{equation}\begin{cases}x_1+2x_2=3\\0.499x_1+1.001x_2=1.5\end{cases}\end{equation}$

Provare a pertubare i coefficienti della seconda equazione di $10^{-3}$ oppure a perturbare il termine noto della seconda equzione dello stesso vaore.
Si ottiene una perturbazione della soluzione dell'ordine 10 (3 volte superiore)

Vedi: matrice di Hilbert -> matrice simmetrica

Una matrice è invertibile (non singolare) se ha tutte le righe (e le colonne) lin indipi -> rango massimo

Graficamente: due rette linearmente idpendenti sono due retti quasi coincidenti (inclinazione molto simile) -> quindi la perturbazione $\Delta b_1$ e  $\Delta b_2$ provocano uno spostamento "in avanti" molto grande rispetto al valore esatto
![[vettore_grafico.png]]

TODO: aggiungi e prova codice matlab con perturbazione

Partiamo da $Ax=b$ perturbato con $\Delta b$ -> $A\tilde{x}=b+\Delta b$
Sostitudendo b nella seconda equazione con $Ax$: $\tilde{x}-x=A^{-1}\Delta b$
Passo alla norma e applico la disuguaglianza triangolare: $\|\tilde{x}-x\| = \|A^{-1}\Delta b\| \leq \|A^{-1}\|\|\Delta b\|$
TODO
Infine: $\frac{\|\tilde{x}-x\|}{\|x\|} \leq k(A)\frac{\|\Delta b\|}{\|b\|}$
Dove k(a) è il numero di condizionamento. Con k(A)=1 il problema è ben condizionato, se k(A) >> 1 mal condizionato

TODO: Vedi slide 107

Il numero di condizionamento dipende dalla norma utilizzata

