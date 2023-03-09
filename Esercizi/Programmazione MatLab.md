L'estensione dei file Matlab hanno estensione **.m**
Useremo l'editor interno.

# Macro vs function
> Un file function è simile ad uno script ma con l'intestazione: `function [variabili di uscita] = nomefunzione(var ingresso)`. Le parentesi quadre sono necessarie solo se si ritorna più di un valore. Sono vuote nel caso in cui non si ritorni nulla. Le variabili di ingresso sono una lista di variabili, senza tipo, che assumono significato posizionalmente.

>Uno script è una serie di comandi e invocazioni di funzioni. I file macro (script) operano sulle variabili contenute in memoria (non esistono variabili locali). Possono maneggiare tutte le variabili presenti nel workspace. Solitamente la prima istruzione è `clear`

Attenzione: salva output funzioni in var globale

# Strutture condizionali
## If
```Matlab
if cond1
	istruzioni1
elseif cond2
	istruzioni2
else
	istruzioni3
end
```

Attenzione: no parentesi o virgole
Nota: il diverso è `~=`

TODO: tonde attorno alla condizione?

## Switch
```Matlab
switch espressione
	case realizzazione1
		istruzioni1
	case realizzazione2
		istruzioni2
	otherwise
		istruzioni
end
```

# Cicli
## For
```Matlab
for indice = vettore
	istruzioni
end
```

Con `break` si forza l'uscita di un ciclo

## While
```Matlab
while condizione
	istruzioni
end
```

# Operatori logici
- `&` and logico
- `|` or logico
- `~` not logico