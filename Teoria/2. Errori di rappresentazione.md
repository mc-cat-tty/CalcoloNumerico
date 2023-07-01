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

# Condizionamento e stabilità
>Il **condizionamento** è una proprietà del problema che stiamo affrontando (riguarda il problema, ma non l'algoritmo). -> rapporto tra errore commesso sul risultato e incertezza di un risultato.

>La **stabilità** è una caratteristica dell'algoritmo, non riguarda il problema.

## Problema della somma x+y+z
Esempio: lavoriamo sulla somma di tre numeri -> Ho due algoritmi possibili

### Algoritmo (x + y) + z
Vorremmo $\alpha = x+y+z$
La soluzione numerica è $\alpha^{*} = fl(fl(fl(x) + fl(y)) + fl(z))$
Ho 5 approssimazione a valore float: 3 sui valori e 2 sulle operazioni


Dato che $fl(s) = s(1+\epsilon)$ con $|\epsilon| < u$ -> **perturbazione** minore della precisione di macchina

Sviluppando $\alpha^{*}=((x(1+ \epsilon_x)+y(1+\epsilon_y))(1+\epsilon_1) + z(1+\epsilon_z))(1+\epsilon_2)=...$

Al numeratore (errore relativo rimangono tutti termini moltiplicati per un qualche $\epsilon$ (perturbazione)) => tutti i termini hanno almeno 1 epsilon (da 1 a 3 volte)

Trascuriamo i termini di secondo ordine

$Er=\frac{\alpha^*-\alpha}{\alpha}\approx\frac{x\epsilon_x+y\epsilon_y+x\epsilon_1+y\epsilon_1+z\epsilon_z+x\epsilon_2+y\epsilon_2+z\epsilon_2}{x+y+z}=\frac{x}{x+y+z}\epsilon_x+\frac{y}{x+y+z}\epsilon_y+\frac{z}{x+y+z}\epsilon_z+\frac{x+y}{x+y+z}\epsilon_1+\epsilon_2$ Errore assoluto

I primi tre operandi sono **errore inerente** (condizionamento del problema), mentre gli utlimi due sono **errore algoritmico** (stabilità dell'algoritmo).
Nel quarto operando si vede come la somma di x+y al numeratore è dovuta al fatto che si è svolto prima x+y e poi +z.

Sommando prima i numeri piccoli e poi i numeri più grandi minimizzo l'errore -> problema non presente analiticamente

Macroindicatori ci permetteranno in futuro di sitmare l'errore.

## Condizionamento
>Un problema **ben condizionato** = a piccole perturbazioni sui dati corrispondono altrettanto piccole perturbazione sul risultato. Es: se parto da una perturbazione grande al più quanto u (precizione di macchina), la perturbazione del risultato non deve superare u.

>Un problema è **mal condizionato** quando a piccole perturbazioni sui dati corrispondono grandi perturbazioni sul risultato.

### Calcolo delle radici di un'equazione di secondo grado
Data $x^2-4x+c=0$
Scegliamo la soluzione $x_1 = x \pm \sqrt{4-c}$

Con $c=4$ -> $\alpha=2$
Con $c^*=4-10^{-6}$ -> $\alpha^{*}=2*10^{-4}$

Variazione sul dato: $\frac{c-c^*}{c} = \frac{1}{4}10^{-6}$
Variazione sul risultato: $\frac{\alpha-\alpha^*}{\alpha} = \frac{1}{2}10^{-3}$

Piccola variaizone dei dati porta ad una variazione più grande sul risultato

## Stabilità
>Un algoritmo è **stabile** se l'insieme delle operazioni elementari con cui è costituito fanno sì che gli errori introdotti dalle operazioni aritmetiche sono contenuti sulla soluzioen

### Calcolo souzione equazione lineare
Prendiamo $7\alpha=21$

Calcolare $\alpha$ come 21/7 vs calcolare $\alpha$ moltiplicando a destra e a sinistra dell'uguale per $t=\frac{1}{7}$

Il primo algoritmo è migliore perchè più stsabile e più veloce

# Valutazione degli algoritmo
I criteri usati per valutare un algoritmo numerico sono:
- **complessità computazionale** = numero di operazioni necessarie per portare a termine l'algorimo
- **stabilità** = capacità di NON amplificare gli errori dovuti alle operazioni di macchina (si migliora con buone pratiche sommando, per esempio, prima i numeri più piccoli e poi i grandi)

## Calcolo del punto medio
Questi due criteri possono andare in antitesi tra loro

Formula classica $m=\frac{a+b}{2}$
Formula stabile $m=a+\frac{b-a}{2}$

Con a=0.983 e b=0.986:
- algo1 -> $m^*=0.98$ -> oltre a non essere il punto medio non è neanche nell'intervallo.
- algo2 -> $m^*=0.984$ -> complessità più alta (male) ma stabilità migliore (top)