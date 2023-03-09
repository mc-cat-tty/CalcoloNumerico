# Derivate numeriche
Analiticamente devo cercare il limite del rapporto incrementale. Il denominatore $h$ che tende a zero non è rappresentabile numericamente.

Prendiamo per esempio $f(x) = sin(x)$ -> $f'(x)=cos(x)$
Vogliamo ridurre progressivamente $h$ fino a $10^{-16}$

Vedi: [[Derivata numerica]]

Plottando l'errore relativo rispetto al rapporto incrementale otteniamo che l'errore è minimo al centro, con h piccoli, otteniamo un errore sempre più vicino all'unità.

L'errore assoluto è maggiorato da $\frac{M}{2}h+2\frac{\delta}{h}$ -> Se h tende a zero, questa quantità tende a $\infty$

TODO: analisi dell'errore