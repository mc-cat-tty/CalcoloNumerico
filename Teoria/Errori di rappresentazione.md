# IEEE754

## Standard
$\pm (1.a_1a_2a_3...a_t) * \beta^p*$

| | PRECISIONE SEMPLICE | PRECISIONE DOPPIA |
|-|-|-|
| Numero bit | 32 | 64 |
| Segno | 1 | 1 |
| t-1 (1 bit guadagnato dalla notazione normalizzata) | 23 | 52 |
| l (numero bit exp) | 8 | 11 |
| bias | 127 | 1023 |
| U | 127 | 1023 |
| L | -126 | -1022 |

Memorizzo: | s | p+bias | a1 a2 ... at |

## Numeri non rappresentabili
Se ho un esponente superiore al massimo rappresentabile o inferiore al minimo rappresentabile, memorizzo $\pm inf$

Se l'esponente è nell'intervallo rappresentabile, ma la mantissa richiede più bit di quelli disponibili ho due strade:
- **troncamento**
- **arrotondamento**: nel caso binario è semplice -> se il MSB della stringa che sto troncando è zero non faccio nulla, altrimenti aumento di 1 (in aritmetica binaria) la mantissa

## Intervalli di apprissimazione
Con il troncamento ho una "compressione" dei reali verso l'estremo sinistro

Con l'arrotonamento ho una compressione circa centrata sul punto medio tra lower_int_part(N) e upper_int_part(N)

Solitamente l'estremo sinistro è incluso, mentre l'estremo destro è escluso

# Errore di approssimazione
Ogni volta che rappresento un numero floating point in maniera approssimata con una precisione finita commetto un errore (se N  non appartiene a $F(\beta, t, L, U)$)

Quanto vale questo errore?

## Errore assoluto
Informazione "parziale" sull'errore commesso, assume valore quando rapportato al valore rispetto al quale si commette l'errore.

>$E_a = |\alpha - \alpha^{*}|$
 Dove $\alpha^*$ è il numero nella rappresentazione, mentre $\alpha$ è il numero che SI VUOLE rappresentare


## Errore relativo
L'errore assoluto non dà informazione sulla bontà del risultato numerico

> $E_r = \frac{E_a}{|\alpha|}$


## Teorema dell'errore di rappresentazione dei numeri reali
> Dato $\alpha$ numero reale e $fl(\alpha)$ la sua rappresentazione in virgola mobile in base $\beta$ con precisione $t$ (cifre della mantissa) l'errore commesso soddisfa:
> $\frac{|fl(\alpha) - \alpha|}{|\alpha|} \leq k\beta^{1-t}$
> Dove k è scelto tra $1$ (se approssimo per **troncamento**) e$\frac{1}{2}$ (se approssimo per **arrotondamento**)

- Membro destro -> $u = \beta^{1-t}$ è la **precisione di macchina**
- Membro sinistro -> $\epsilon = \frac{|fl(\alpha) - \alpha|}{\alpha}$ ->  $fl(\alpha)= |\alpha| * (1 + \epsilon)$ con $\epsilon$ maggiorato da $u$

$u$ è il più piccolo numero tale che la somma o la sottrazione con un altro numero, questa operazione non sortisce effetti, con k scelto correttamente. Prova su MatLab con k=1/2

Attenzione: prova `sin(pi)` su MatLab -> risulta `1.2246e-16`, ovvero $\epsilon$ perché `pi` non è esattamente pigreco e il seno viene calcolato numericamente.

L'insieme dei numeri floating point $F(\beta, t, L, U)$ non è un insieme chiuso. Ho infiniti numeri non rappresentabili, Finiti numeri rappresentabili.

La precisione di macchina è comunque un upper bound (worst case), perchè l'errore è maggiorato (minore o uguale)

# Approssimazione delle operazioni
## Errore di rappresentazione del risultato delle operazioni
Come prima:
>Dati $x, y \in F(\beta, t, L, U)$
>$\frac{|(y \cdot x) - fl(y \cdot x)|}{|x \cdot y|} \le k \beta^{1-t}$
>Dove $\cdot$ è una qualsiasi delle quattro operazioni, il membro di destra è la precisione di macchina con k scelto.


Quando svolgo operazioni in floating point mi serve avere lo stesso esponente tra i due operandi prima di eseguire l'operazione aritmetica, ricordandoci poi di riportare il risultato in forma normalizzata.

>In aritmetca finita si infrange il teorema di unicità dell'elemento neutro. Ho situazioni in cui $x+y = y$ con $y \neq 0$ se y sufficientemente piccolo

## Non validità della proprietà associativa della somma
Volendo calcolare la somma $x+y+z$ posso scegliere tra due strade:
- $fl(fl(x+y) + z)$
- $fl(x + fl(y + z))$

Questi due procedimenti sono quindi "algoritmi" differenti per computare la stessa quantità. Dipende quando si commette l'errore di approssimazione (necessariamente due perchè 2 operazioni totali).

Si può pensare che l'errore di rappresentazione venga introdotto nel momento in cui il risultato di un'operazione è memorizzato ("appoggiato") in memoria.

