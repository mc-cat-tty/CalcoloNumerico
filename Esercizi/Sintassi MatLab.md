MatLab - Matrix Laboratory

Tutto viene visto come una matrice, anche uno scalare (matrice 1x1)

Toolbox: libreria/modulo

Due modalità di utilizzo:
- interattiva
- su file

Potenzialità:
- calcolo matriciali
- risoluzione equazioni
- calcolo simbolico
- diagrammi, superfici

# Struttura finestra
- Command window: immissione comandi. Offre documentazione e help inline.
- Workspace: contiene le variabili dell'ambiente di lavoro, come ans, che contiene risultati intermedi non memorizzati su variabili
- Current Folder

# Tipi di dato
Tutto è memorizzato come matrice. I numeri vengono salvati di default come double (64 bit)

# Comandi generali
- `doc cos` -> richiede documentazione
- `clear` pulisce il workspace dalle variabili 
- `who` variabili presenti in memoria

## Bestpractices
Metti il `;` per non avere a schermo il risultato di un'operazione

L'assegnazione avviene con `=`

Si usano le parentesi tonde per cambiare la priorità delle operazioni.

I messaggi di errore sono chiari, usali. Gli spazi sono ignorati dal parser.

## Variabili predefinite
- `Inf` - Infinito
- `eps` - precisione di macchina
- `NaN` - Not a Number
- `i` e `j` - unità immaginarie
- `pi` - pigreco

## Matrici e vettori
### Vettore riga
`v = [1 2 3 4]`
`v = [1, 2, 3, 4]`

### Vettore colonna
`v = [1; 2; 3; 4]`
`v = [1 2 3 4]'` con l'operatore di **trasposizione** (matrice con dimensioni invertite -> righe e colonne scambiate)

Le concatenazioni devono essere **consistenti**

### Matrice
`m = [1 2 3; 4 5 6]`
Matrice 2x3

Notazione semplificata rispetto a `m = [[1,2,3];[4,5,6]]`

### Intervalli
Per la generazione di intervalli equispaziati si usa l'operatore `:`

```Matlab
START:INC:END
```

Se l'incremento è omesso viene considerato 1

```Matlab
linspace(START, END, N)
```
Divide un intervallo in un numero di punti prefissato, al posto di usare un incremento specificato.

N di default vale 100

## Operazioni sulle matrici
Si accede alle matrici con l'operatore parentesi tonda

### Accesso
- `v(i)` per i vettori
- `m(i, j)` per le matrici bidimensionali. Le matrici sono comunque memorizzate in modo contiguo in memoria. Posso accedervi con `m(i)`. La memorizzazione avviene per righe (riga 1, riga 2, ..., riga n). *Columnwise*
- Matrix slicing
	- `m(R,:)` tutta la riga R
	- `m(:, C)` tutta la colonna C
	- `m(LISTA_RIGHE, LISTA_COLONNE)` in generale

### Memorizzazione
Posso sostituire degli elementi con l'assegnazione:
- `m(LISTA_RIGHE, LISTA_COLONNE) = VAL` -> tutte le celle selezionate a sinistra vengono riempite con VAL
- `m(LISTA_RIGHE, LISTA_COLONNE) = SUBMATRIX`

L'operatore `[]` è usato per concatenare elementi compatibili

## Funzioni utili lavorando con le matrici
- `eye(n)` - matrice identica nxn (matrice diagonale con 1 sulla diagonale principale e 0 altrove)
- `zeros(m, n)` - matrice mxn con tutti 0
- `ones(m, n)` - matrice mxn con tutti 1
- `rand(m, n)` - matrice mxn con elementi random tra 0 e 1. Attenzione: passando 1 parametro si ottiene una matrice quadrata di quella dimensione
- `size(x)` - dimensione dell'array x -> Il risultato è una matrice 1x2, composta come `[RIGHE, COLONNE]`. Posso ovviare a questo problema con `size(m, 1)` ottengo il numero di righe e `size(m, 2)` ottengo il numero di colonne
- `length(v)` - la più grande della dimensione della matrice. Se è un vettore corrisponde al numero di elementi.

## Tips 4 fast code
Dato che non esiste dichiarazione, crea matrice (piena di 0 o 1) prima di riempirla: inizializza prima di usare la matrice.

In più per l'accesso è devastante dato che il caricamento in cache non aiuta per nulla se la matrice è memorizzata in ram in locazioni "sparse".

Lavorare per colonne (memorizzate contiguamente) è più efficiente che lavorare per righe.

## Funzioni estrazione da matrice
- `diag(M)` - entrae la diagonale principale dalla matrice M
- `diag(v)` - crea una matrice quadrata con il vettore v sulla diagonale principale

- `tril(M, i)` - tirangular lower -> estrae dalla matrice M la matrice triangolare inferiore, il resto viene riempito di zeri
- `triu(M, i)` -triangular upper -> estrae dalla matrice M la matrice triangolare superiore, il resto viene riempito di zeri.

`i` è l'i-esima diagonale (dove 0 è quella principale, verso l'alto +1 e verso il basso -1)

## Operazioni tra matrici
### Somma e differenza
`M1 + M2` e `M1 - M2` sono **operazioni puntuali** --> operano tra matrici della *stessa dimensione* e generano una matrice risultato die quella dimensione.

### Moltiplicazione
`M1 .* M2` **prodotto puntuale** --> moltiplico le matrici elemento per elemento. Devono avere la *stessa dimensione*

`M1 * M2` **prodotto matriciale** --> numero di colonne di M1 deve essere uguale a numero di righe di M2

### Elevamento a potenza
Come nella moltiplicazione si divide in:
- `v^2` => `v*v`
- `v.^2` => `v .* v`

# Determinante, rango, inversa
- `det(M)`
- `rank(M)`
- `inv(M)` -> matrice che moltiplicata per M restituisce la matrice identità (1 sulla diagonale principale, 0 altrove)

# Stringhe
Contenute in apici simgoli `s = 'prova'`
Selezione caratteri: `s(idx)`
Concatenzaione: `[s, 'c']`

# Display
`disp(ELE)` -> display ELE a schermo