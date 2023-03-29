Un sistema in forma matriciale si scrive:
$Ax = b$
In cui _A_ è una matrice quadrata nxn, mentre _x_ e _b_ sono vettori colonna. _A_ e _b_ sono determinati (contengono valori numerici), mentre x contiene delle incognite.

La soluzione è quindi $x=A^{-1}b$ con il **metodo dell'inversa**
#Ricorda: moltiplica in modo coerente con l'ordine dei fattori.

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

#Attenzione: vogliamo che $L^{-1}$ rimanga triangolare inferiore

## Algoritmo di eliminazione gaussiana
Regola di aggiornamento: $a_{ij}^{k+1} = $ TODO: completas

Consiglio di ottimizzazione: posso memorizzare i moltiplicatori e la matrice triangolare in un'unica matrice, dato che sotto la diagonale ho solo zeri e i moltiplicatori si trovano proprio in questa posizione.

TODO: matrice $L_k$ con 1 sulla diag principale, 0 sul triangolo superiore, coefficienti (con segno opposto) nella k-esima sottocolonna (da $-m_{k+1,k}$ fino a $-m_{n,k}$), nelle restanti sottocolonne solo zeri.

Nota: il prodotto di due matrici triangolari superiori restituisce un'altra matrice triangolare superiore

#### Determinante di una matrice con diagonale unitaria
$det(L_k)$ con $L_k$ non singolare (con determinante diverso da 0, vedi dimostrazione sotto) e con diagonale unitaria. -> data la non singolarità possiamo invertirla

Dimostrazione per induzione:
- caso base (n=2): $det\begin{pmatrix} 1 & 0 \\ l_{21} & 1 \end{pmatrix} = 1 - 0 = 1$
- passo induttivo
	- supponiamo vero per n=k: $det\begin{pmatrix} 1 & 0 & \dots & 0 \\ l_{21} & 1 & \dots & 0 \\ \vdots & \vdots & \ddots & 0 \\ l_{k1} & l_{k2} & \dots & 1 \end{pmatrix} = 1$
	- dimostriamo che vale per n=k+1: $det\begin{pmatrix} 1 & 0 & \dots & \dots & 0 \\ l_{21} & 1 & \dots & \dots & 0 \\ \vdots & \vdots & \ddots & \dots & 0 \\ l_{k1} & l_{k2} & \dots & 1 & 0 \\ l_{k+1,1} & l_{k+1,2} & \dots & \dots & 1 \end{pmatrix} = 1$
		- Scegliamo la colonna k+1 e applichiamo lo sviluppo di Laplace
		- Otteniamo 0 per ogni riga, tranne l'ultima, che sarebbe $1*det(M'_{k+1,k+1})$ con $M'_{k+1,k+1}$ sottomatrice ottenuta rimuovendo la k+1 esima riga e colonna

Quindi la matrice $L_k$ è invetibile, dato che il suo determinante è diverso da 0

Ripasso:
- il vettore canonico $e_k$ è un vettore con tutti 0 tranne nella posizione k
- una matrice è invertibile se il suo determinante è diverso da 0
- nel prodotto matriciale/vettoriale non è commutativo (non posso invertire l'ordine dei fattori) -> no commutazioni; la proprietà associativa vale
- un vettore colonna (nx1) per un vettore riga (1xn) genera una matrice (nxn) -> guarda dimensioni esterne
- un vettore riga per uno colonna restituisce uno scalara (1x1)

#### Riscrittura Lk
TODO: vedi slide 191-192, visualizza $m^{(k)}e_k^T$ -> matrice da sottrarre all'identità

#### Inversione della k-esima matrice di trasformazione
Dimostriamo che l'inversa di $L_k$ e $I+m^{(k)}e^T_k$

**Hp**: $L_k=I-m^{(k)}e^T_k$
**Th**: $L_k^{-1}=I+m^{(k)}e^T_k$
**Dim**: TODO: slide 192

#### Prodotto delle inverse
#Ricorda: l'inversa del prodotto è il prodotto delle inverse "al contrario", ovvero con ordine invertito. Stessa cosa per la trasposta del prodotto.

$U = (L_{n-1}L_{n-2}...L_k...L_2L_1) A$
$(L_{n-1}L_{n-2}...L_k...L_2L_1)^{-1} U = A$
$L_1^{-1} L_2^{-1}...L_k^{-1}...L_2^{-1}L_1^{-1}U = A$

Con k < j+1: TODO: slide 192 e successive

#### Teorema di fattorizzazione di Gauss
Conclusione: dato $L = L_1^{-1} L_2^{-1}...L_k^{-1}...L_2^{-1}L_1^{-1}$, $A = L U$

Con la condizione che tutti gli elementi di pivot siano diversi da zero -> **condizione forte**

#### Conclusione
Il metodo di gauss per la soluzione dei sistemi lineari... TODO (sistema)

Costo:
- fattorizzazione $O(\frac{n^3}{3})$
- risoluzione $O(\frac{n^2}{2})$

Vince il cubo.

#Attenzione: la matrice L (prodotto delle inverse) è diveso dall'L che compare come fattore (vedi slide 196)

#### Osservazione
Supponendo possibile avere: $A_k=L_{k-1}L{k-2}...L_2L_1A$ senza effettuare tutti i k passaggi, abbiamo che il determinante di $A_k$, matrice triangolare supeiore, è uguale al prodotto degli elementi sulla **diagonale**

**Condizione necessaria e sufficiente** per la fattorizzazione della matrice con la rigurazione di Gauss -> la matrice è invertibile se e solo se tutti i pivot di A sono diversi da 0. In realtà basterebbero i primi n-1 minori con determinante diverso da zero, perchè l'ultimo determinante uguale a zero implica che due equazioni siano linearmente indipendenti (sistema indeterminato o impossibile) -> l'algoritmo arriva a termine, ma non dà un risultato finito

Operativamente: potrei controllare a priori che il determinante dei primi n-1 minori sia diverso da zero, al posto di bloccarmi nel bel mezzo del procedimento. Nella pratica è svantaggioso, perchè il costo di n-1 determinanti è troppo alto. 

#### Unicità della fattorizzazione
Data una fattorizzazione della matrice A, essa è unica? SÌ, a meno di una costante

Usa dimostrazione diretta: partiamo dal presupposto che esistano due coppie di matrici con le proprietà enunciate nel teorema (fattori di A) TODO

#Ricorda: principi di equivalenza delle equzioni (primo e secondo)
TODO: scrivi i principi di equivalenza delle equazioni

Partiamo da $A=L_1U_1$ e $A=L_2U_2$, moltiplico a destra e sinistra per $L_1^{-1}$ e per $U_2^{-1}$

Per arrivare a $U_1U_2^{-1}=L_1^{-1}L_2$ => l'unico modo per cui valga questa uguaglianza è che gli elementi diversi da zero stiano solo sulla diagonale, ma la diagonale è anche unitaria, quindi questi prodotti possono essere uguagliati alla matrice identità => Entrambi uguagliati all'identità:
- $U_1U_2^{-1} = I$ => $U_1=U_2$
- $L_1^{-1}L_2=I$ => $L_1=L_2$

#Vedi: gruppo (algebra) -> prodotto tra due numeri pari è un numero pari

## Classi di matrici che soddisfano le ipotesi del teorema di fattorizzazione
>Per le matrici a **diagonale dominante** (per righe o per colonne) vale la proprietà che i minori principali sono diversi da zero (implicazione), quindi sono risolvibili con l'algoritmo di Gauss.

>Una matrice è **diagonale dominante** se $\sum^n_{j=1, j\neq i}{|a_{ij}|} < |a_{ii}|$. Esempio: matrice identità o più in generale una qualsiasi matrice diagonale.

Come faccio ad ottenere una matrice di questo tipo?

### Strategia di pivoting
Scambio le righe per ottenere una matrice diagonale dominante -> devo ricordarmi di scambiare la posizione dei termini noti (vettore $b$)

Scambierò sempre una riga con una che le sta sotto (TODO: formalizza)

### Matrici di permutazione elementare
Scambio banale di righe = scambiare una riga con se stessa

>Lo scambio non banale di due righe di una matrice può essere espresso come un prodotto matriciale tra la matrice originale e una **matrice di permutazione elementare**

Una matrice di permutazione elementare $P_{ij}$ -> matrice identità in cui in posizione _ij_ e _ji_ è presente un 1, mentre in $ii$ e $jj$ è presente uno zero => riga i e j scambiate a partire da $I$

Se moltiplico a destra ottengo uno scambio di colonne

#### Proprietà
- **non singolari**: $det(P_{ij}) = -det(I) = -1$ perchè il segno viene invertito ad ogni scambio non banale di righe e colonne
- **simmetriche**: $P_{ij}=P_{ij}^T$
- **ortogonali**: $P_{ij}P_{ij}^T = P_{ij}P_{ij} = I$ perchè è come se venisse fatto un doppio scambio di riga, fino a ricondursi a $I$

Moltiplicando matrici di permutazione elementari otteniamo nuovamente una matrice di permutazione (che scambia più righe/colonnne tra loro).

### Scambio di righe nella fattorizzazione di Gauss
Supposta $A=A_1$ non invertibile, allora la prima riga avrà sicuramente almeno 1 elemento diverso da zero -> posso scambiarlo con la prima riga.

Al passaggio successivo: $A_2=L_1P_1A_1$ quindi dal teorema di binet: $det(A_2)=det(L_1)det(P_1)det(A_1)=1*-1*det(A_1)$ con $det(A_1) \neq 0$ sicuramente dal passo precedente e quindi $det(A_2) \neq 0$

Dall'ipotesi $det(A) \neq 0$ => $PA = LU$ dove P è una matrice nota
$PAx=LUx=Pb$ se si parte dal sistema $Ax = b$

Come cambia il determinante di A? Fatti $\sigma$ scambi, ho che $det(A)=(-1)^\sigma u_{11} ... u_{nn}$

TODO: vedi slide 209 -> nella produttoria ci sono le matrici di permutazione che riassumono gli scambi fatti dal passo successivo al k-esimo, perchè gli altri sono già "intrinseci" nella matrice $L_k$

### Osservazioni
Il modo in cui effettuo gli scambi di righe influisce sulla stabilità dell'algoritmo di Gauss.

Nella k-esima sottocolonna ho il coefficiente $-\frac{a_{ik}}{a_{jk}}$, dove $a_{jk}$ è il pivot. Se mantengo $a_{jk}$ il più grande possibile, otterrò un coeff piccolo, che mi riduce l'errore di approsimazione in virgola mobile. In particolare scelgo $a_{rk}^{(k)} = max_{i \in \{k, ..., n\}} |a_{ik}^{(k)}|$, così da mantenere $|m_{ik}| \leq 1$, contenendo l'errore.

TODO: vedi esempio numerico

Conclusione: con le tecniche di pivoting parziale posso aumentare la stabilità dell'algoritmo.

#Salta: pivoting totale, fattorizzazione per colonne, matrici a banda, matrici sparse: 217-225

![[fattorizza.m]]

![[fattorizza_pivoting.m]]

Nota: il _~_ ignora il valore di ritorno

# Matrici simmetriche
## Caratteristica
$a_{ij} = a_{ji}$, quindi la matrice è uguale alla sua trasposta ($A = A^T$)

Memorizzare una matrice simmetrica richiede la metà dello spazio rispetto a memorizzare l'intera matrice.

## Teorema di fattorizzazione di gauss per matrici simmetriche
Hp:
- A simmetrica
- Tutti i minori principali diversi da zero

Th: esistono L (triangolare inferiore con diagonale unitaria) e D (diagonale = solo gli elementi sulla diagonale diversi da zero) tali che $A = L D L^T$

Dim:
- $A = LU$ dal teorema di Gauss dato che ha i minori principali diversi da zero
- D è una matrice diagonale con elementi $u_{ij}$ (diagonale di U) tutti diversi da zero -> non singolare ( #TODO: scrivi matrice esplicita)
- Riscriviamo la fattorizzazoine $A=LDD^{-1}U$
- Ci chiediamo se $D^{-1}U$ è uguale a $L^T$
- Chiamiamo $R$ il prodotto $D^{-1}U$ -> $R \coloneqq D^{-1}U$
- Moltiplicando due matrici triangolari superiori tra loro si riottiene una matrice triangolare, stessa cosa per le matrici diagonali, ecc. perchè appartengono allo stesso **gruppo** ( #vedi: gruppo algebrico, teoria dei gruppi)
- Cosa contiene $D^{-1}$? $\begin{pmatrix} \frac{1}{u_{11}} & \dots & 0 \\ 0 & \frac{1}{u_22} & \dots & 0 \\ 0 & 0 & \frac{1}{u_33} & \dots & 0 \\ 0&0&0& \ddots &0 \\ 0&0&0&0& \frac{1}{u_{nn}}\end{pmatrix}$ perchè moltiplicata per $D$ deve dare l'identità
- Quindi moltiplicata per $U$ restituisce una diagonale triangolare superiore
- È vero che la diagonale è unitaria nel prodotto tra le due, perchè gli elementi di D sono estratti da U ( #todo: esplicita )
- Dato che $A$ è simmetrica vale che $A = LDR = A^T = (LDR)^T = R^T D^T L^T$
	- $LDR = R^T D L^T$
	- Moltiplico ambo i membri per $(L^T)^{-1}$: $LDR(L^T)^{-1} = R^TDL^T(L^T)^{-1}$
	- Moltiplico a sinistra per $L^{-1}$ => $DR(L^T)^{-1} = L^{-1}R^TD$
- I gruppi algebrici sono chiusi anche rispetto all'inversione: a sinistra abbiamo una triangolare superiore, a destra una triangolare inferiore, quindi i due membri devono dare entrambi matrici diagonali
- Il membro sinistro è diagonale: $DR(L^T)^{-1}$, $D$ è diagonale per definizione => $R(L^T)^{-1}$ deve essere diagonale
- Prima abbiamo dimostrato che $R$ ha diagonale unitaria (perchè prodotto di $D^{-1}$ per $U$), $L$ ha diagonale unitaria, di conseguenza anche $(L^{-1})^T$
- $R(L^{-1})^T$ è diagonale con diagonale unitaria, quindi è $I$
- L'operazione di inversione e trasposizione sono invertibili, quindi $(L^T)^{-1}=(L^{-1})^T$
- $R(L^T)^{-1} L^T = I L^T$ => $R = L^T$
- In conclusione: $A = LDL^T$

## Risoluzione con il metodo di fattorizzazione di Gauss
Ci aspettiamo un costo computazionale circa dimezzato, perchè il triangolo inferiore è uguale a quello superiore.

### Metodo di pavimentazione
_Come i parchettisti che partono da un angolo e si estendono a tutto il pavimento/matrice_

#TODO: vedi slide 228

$$\begin{pmatrix} 1 & 0 & \dots & 0 \\ l_{21} & 1 & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \\l_{n1} & l_{n2}  
& \dots & 1 \end{pmatrix} \begin{pmatrix} d_{11} & 0 & \dots & 0 \\ 0 & d_{22} & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \\0 & 0 & \dots & d_{n  
n} \end{pmatrix} \begin{pmatrix} 1 & l_{21} & \dots & l_{n1} \\ 0 & 1 & \dots & l_{n2} \\ \vdots & \vdots & \ddots & \vdots & \\0 & 0  
& \dots & 1 \end{pmatrix} $$

#### Passo 1
Calcoliamo la riga 1. Dobbiamo andare in ordine

Partiamo con 

#TODO: completa

#### Pseudocodice
```
for j = 1, ..., n
	d_{jj} = a_{jj} - \sum_{k=1}^{j-1}l_{jk}^2d_{kk}  % mi muovo sulla riga, nella sommatoria ci sono solo gli elementi calcolati fino a quel momento nella riga
	for i = j+1, ..., n
		l_{ij}
```

#TODO: finisci

#### Costo computazionale
Ad ogni passo $2(j-1)+(j-1)(n-j)$ prodotti

#TODO: slide 232 (ottimizzazione e analisi costo)

Costo: $O(\frac{n^3}{6})$ contro a $O(\frac{n^3}{3})$ del metodo di Gauss per matrici generiche

#Nota: ottimizza ulteriormente in termini di spazio memorizzando la matrice p nel triangolo superiore di l

## Soluzione di sistema simmetrico
Partiamo da $Ax = b$, che fattorizzato diventa $LDL^Tx = b$

Chiamando $z = DL^Tx$ e $y = L^Tx$

$$\begin{cases} Lz = b \\ Dy = z \\ L^Tx=y \end{cases}$$

Come in una matrioska -> devo risolvere le equazioni in ordine dalla prima all'ultima. Inizialmente conosco solo L e b, calcolo z e ho D, calcolo y e ho $L^T$, trovo x.
In ordine uso i seguenti metodi:
1. Sostituzione in avanti
2. n divisioni: $z_{ii} / D_{ii}$
3. Sostituzione all'indietro

#Nota: in Matlab una matrice simmetrica si può creare con `tril(A) + tril(A, -1)'`

![[fattorizza_simm.m]]


# Fattorizzazione di Cholesky per matrici simmetriche definite
## Vantaggi
- Algoritmo stabile
- Non dobbiamo verificare la simmetricità della matrice (?)

## Ipotesi
1. $\forall x \in \mathbb{R}^n: x^TAx \geq 0$
2. $x^TAx=0 \Leftrightarrow x=0$

#TODO: completa con slide 233/234 (idk)

Le ipotesi sono le stesse della fattorizzazione di Gauss per matrici simmetriche.

## Tesi
>Una matrice simmetrica $A$ di dimensione $n*n$ è definita positiva $\Longleftrightarrow$ esiste una matrice triangolare inferiore $\lambda$  con elementi diagonali positivi tali che $A=\lambda\lambda^T$

Ad esempio: Matlab inizia la fattorizzazione di Cholesky e, se fallisce, significa che la matrice non è simmetrica positiva, quindi arresta la fattorizzazione. Altrimenti ci si ritrova con la matrice A fattorizzata.

#Nota: è un se e solo se, quindi doppia implicazione. La useremo nella direzione $A=\lambda\lambda^T$ -> simmetrica -> fattorizzazione di Gauss

## Dimostrazione
### Dimostrazione implicazione 1: se simmetrica allora LL'
Ipotesi:
1. $A=A^T$ per la simmetria
2. Tutti i minori diversi da zero perchè definita positiva => $A=LDL^T$

Tesi:
1. Esiste $\lambda$ triangolare inferiore $n*n$
2. $\lambda$ ha diagonale > 0
3. $A=\lambda\lambda^T$

Dim:
- $\forall x \in \mathbb{R}_{-0}: x^tAx > 0$ => riscritto $\forall x \in \mathbb{R}_{-0}: x^tLDL^Tx > 0$
- Chiamiamo $y=L^Tx$ e $y^t = x^TL$ dato che $x$ supposto diverso da zero, L tirangolare inferiore quindi non zero, allora $y \neq 0$ (per avere il maggiore stretto)
- $\forall x \in \mathbb{R}_{-0}: y^TDy>0$
- Posto $D = \begin{pmatrix} d_{11} & 0 & \dots & 0 \\ 0 & d_{22} & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \\0 & 0 & \dots & d_{nn} \end{pmatrix}$ sicuramente $d_{ii} > 0$ altrimenti non varrebbe la disuguaglianza sopra
- Costruiamo $\lambda = L\Delta$ quindi $A=L\Delta\Delta^TL^T$ dove $\Delta\Delta^T = D$
- $D = \begin{pmatrix} \sqrt{d_{11}} & 0 & \dots & 0 \\ 0 & \sqrt{d_{22}} & \dots & 0 \\ \vdots & \vdots & \ddots & \vdots & \\0 & 0 & \dots & \sqrt{d_{nn}} \end{pmatrix}$
- #todo: vedi perchè D costruita così
- Concluzione: abbiamo scritto $A$ come $A = \lambda\lambda^T$

### Dimostrazione implicazione 2: se A fattorizzata LL' allora simmetrica
Dimostriamo che A è positiva:
- $A=\lambda\lambda^T$
- $x\in\mathbb{R}^n$
- $x^tAx = x^T\lambda\lambda^Tx$
- Chiamando $y=x^T\lambda$
- Per il trasposto vedi prima
- $yy^T = y_1^2 + y_2^2 + \dots + y_n^2 = \|y\|_2^2$ sicuramente $\geq 0$

Dimostriamo che A è simmetrica: $A^t = (\lambda\lambda^T)^t = \lambda\lambda^T = A$

## Algoritmo di fattorizzazione di Cholesky
$A=\lambda\lambda^T$ allora il generico elemento di $A$ vale
- $\textit{l}_{jj} = \sqrt{d_{jj}}$ sulla diagonale
- $\forall k = \{1, ..., j-1\}: \textit{l}_{jk} = l_{jk}\sqrt{d_{kk}}$ altrimenti

Costo: $O=(\frac{n^3}{6})$ -> il costo computazionale non scende rispetto a Gauss per matrici simmetriche

#TODO: pseudocodice e implementazione Matlab

## Stabilità della fattorizzazione
- se A definita positiva, gli elementi perno soddisfano già la proprietà del pivoting parziale. Ciò vuol dire che l'elemento sulla diagonale è già il più grande della sua sottocolonna. La matrice di permutazione non farebbe scambi. Più **stabile**.
- A differenza della fattorizzazione di Gauss con pivoting totale o parziale, gli elementi di questa fattorizzazione sono maggiorati da elementi indipendenti dalla matrice -> **stabilità forte**
- scopro se è simmetrica e definita positiva durante la fattorizzazione. Non sarebbe conveniente farlo prima (costa $\frac{n^2}{2}$)