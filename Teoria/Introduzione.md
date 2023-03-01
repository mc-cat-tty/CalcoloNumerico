http://www.oasis.unimore.it/site/home.html
OASIS - Optimizazion Algorithms and Software for Inverse Problems

Analisi numerica/calcolo numerico = risolvere problemi matematici mediante un calcolatore
Risoluzione **analitica** = risoluzione esatta, matematica, come con carta e penna, di un problema matematico (es: equazione)

Quando la soluzione analitica non è disponibile, si opta per una **soluzione numerica** = soluzione approssimata di cui spesso si desidera conoscere l'errore commesso.

Da questa distinzione nascono due brache della matematica: **calculus** vs **computation**

La soluzione analitica è solitamente una funzione, ovvero un risultato astratto
La soluzione numerica è calcolabile -> numero reale



# Algoritmi numerici
> Gli **algoritmi numerici** sono algoritmi che, a partire da dati in ingresso, produce un insieme di risultati, mediante passi finiti

Vedi: autovettori e autovalori nel page-ranking di un motore di ricerca

## Analisi numerica
Coinvolge:
1. analisi del problema
2. modellazione
3. analisi del problema matematico in forma analitica o numerica
4. sviluppo dell'algoritmo numerico

# Premessa
Risultati finali e intermedi (parziali) devono essere memorizzati in un computer. I numeri reali possono essere rappresentati con floating point.

## Richiami sui numeri 
Un numero è un'entità astratta, la sua rappresentazione dal sistema scelto. Storicamente la base 10. Se si cambia l'insieme di simboli si può usare la notazione posizionale per costruire il numero in una base diversa.

## Insiemi numerici
- N - Naturali (interi positivi)
- Z - Interi relativi: interi positivi + interi negativi
- Q - Razionali
- I - Irrazionali
- R - Reali: razionali + irrazionali
- C - Complessi: reali + immaginari

## Rappresentazione posizionale
Sommatoria di tutte le cifre della stringa (appartenenti all'insieme dei simboli), pesata con base elevata alla posizione (con prima posizione zero): $\sum_{p=0}^{N}{c_{p} * \beta^{p}}$

$sign * mantissa * \beta^{exp}$

La forma normalizzata prevede uno zero, seguito da una stringa di cifre decimali la prima delle quali è diversa da zero.

## Cambio base

### Divisioni successive
>Metodo per la conversione di un numero intero tra due basi

Ho $(N)_{\beta1}$ che voglio trasformare in $(M)_{\beta2}$. Divido N per $\beta2$ finchè non ottengo zero. Considero i resti in ordine inverso (dall'ultimo al primo).

### Moltiplicazioni successive
>Metodo per la conversione di un numero decimale tra due basi

Moltiplico N per $\beta2$, riportando la parte intera del risultato e considerandola nell'ordine in cui sono stati calcolati.

Mi fermo quando raggiungo 1.0, perchè per il passaggio successivo (da lì per sempre) moltiplicherei zero.

### Conversione tra basi
Estraggo la parte decimale con: `|N| - lower_integer_part(|N|)``

## Rappresentazione fixed point
Rappresentaizone a virgola fissa: permette di rappresentare un numero intero positivo.

I numeri negativi possono essere rappresentati facendo il **complemento a due**.
Pensala come l'operazione tale per cui la somma tra N e -N fa zero. Aggiungere 1 serve a "fare uscire" nella somma tra N e -N il bit più significativo. Prova con 7 e -7.

## Underflow intero e reale
L'underflow intero avviene se cerco di memorizzare un numero troppo negativo.
L'overflow intero avviene se cerco di memorizzare un numero troppo positivo.

Date una rappresentazione su $t+1$ cifre binarie, ho underflow se cerco di memorizzare $N < -2^{t}$. Ho overflow se cerco di memorizzre un numero maggiore di $2^{t}-1$

L'intervallo di rappresentazione è $[-2^{t}, 2^{t}-1]$. Non è simmetrico a causa dallo zero, nè negativo nè positivo.

## Rappresentazione floating point
Letteralmente *a virgola mobile*: $\alpha = \pm m * \beta^{e}$


L'insieme dei numeri floating point è: $F(\beta, t, L, U)$
- insieme discreto e finito di numeri reali
- t è il numero di cifre adibito alla rappresentazione della mantissa
- L - lower exp
- U - upper exp

Il numero sarà rappresentato come: $\pm (0.c_1 c_2 ... c_t) * \beta^{r}$

In base binaria ($\beta = 2$) la prima cifra ha senso che sia 1, per guadagnare un bit -> t cifre esplicite, t+1 cifre totali, di cui 1 implicita (ovvero $c_1$, con ultima cifra $c_{t+1}$)

## Casi limite underflow e overflow
Con i numeri reali (floating point):
- molto vicini a zero (in valore assoluto) -> memorizzo zero
- sopra il massimo numero rappresentabile (in negativo o in positivo) -> memorizzo `+inf` o `-inf`

Con i numeri naturali rinizio in modo circolare.