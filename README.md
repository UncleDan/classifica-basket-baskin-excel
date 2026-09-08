# Classifica Baskin Excel — 100 squadre, 10 gironi

Lavoro ispirato da *Europei di Calcio 2016 con Excel* di Alexsandra "Euro_2016.rar" ([http://www.wintricks.it/forum/showthread.php?t=165174](http://www.wintricks.it/forum/showthread.php?t=165174))

Caratteristiche:

* Struttura fino a **100 squadre** distribuite su un massimo di **10 gironi** (A-J) da 10 squadre ciascuno; usando meno squadre basta lasciare vuote le righe non utilizzate e classifiche e calendari si adeguano da soli.
* Il girone di una squadra dipende **solo dalla lettera in colonna E**, non dalla riga in cui la squadra si trova: spostare una squadra di girone significa cambiare quella lettera. Classifiche, spareggi e posizioni si riallineano da sole; restano da sistemare a mano il calendario (chi incontra chi) e i colori delle righe.
* **Gironi A-H competitivi**, le cui prime due classificate accedono ai playoff, e **gironi I-J non competitivi**, che hanno calendario e classifica ma restano fuori dalla fase finale. Il tabellone resta quindi a 16 squadre.
* Un foglio nascosto `Dati` consolida in un unico blocco le righe di servizio dei dieci calendari: tutte le formule di classifica cercano lì per nome squadra, e nessuna dipende dalla posizione nel foglio.
* Un **foglio calendario per girone** (`Calendario A` ... `Calendario J`), ciascuno con un colore identificativo riportato su linguetta, intestazioni di giornata e righe di classifica. Calendario di sola andata: 9 giornate da 5 gare, 45 gare per girone, 450 in totale.
* Classifica secondo i criteri del regolamento **Baskin** per gironi "round robin": **3 punti classifica per ciascuna partita vinta**, **1 punto classifica per ciascuna partita persa** e **0 punti classifica per le partite perse per forfait** (identificate dal risultato 40-0 o 0-40, valore comunque parametrico); risoluzione delle parità, nell'ordine, con i criteri *Maggior numero di vittorie nelle gare tra di loro*, *Più alto quoziente canestri nelle gare tra di loro*, *Più alto quoziente canestri in tutte le gare del girone*. Come criterio residuo, per garantire sempre un ordinamento univoco, l'ordine alfabetico.
* Eventuali **punti di penalizzazione** per squadra, sottratti automaticamente in classifica.
* **Playoff** a 16 squadre con incroci 1A-2H, 1B-2G, 1C-2F, 1D-2E, 1E-2D, 1F-2C, 1G-2B, 1H-2A: ottavi, quarti, semifinali, finale 3°-4° e finale 1°-2° posto. Gli accoppiamenti dei turni successivi si aggiornano da soli inserendo i risultati del turno precedente. Fase a eliminazione diretta su campi neutri, non appartenenti ad alcuna squadra.
* **Classifica finale** dalla 1ª alla 100ª posizione, costruita a partire dall'esito dei playoff e dalle classifiche di girone, con i gironi non competitivi in coda.
* Foglio **DESIGNAZIONI** con arbitri e ufficiali di campo per ogni gara: elenchi a discesa alimentati dalle anagrafiche, e formattazione condizionale che evidenzia la stessa persona designata due volte nella stessa gara. Convalide e controllo attivi su *tutte* le righe predisposte, gare di playoff comprese.
* Fogli **Arbitri** e **UdC** con conteggio automatico delle designazioni per ruolo e scala colore sul carico di lavoro.
* Esportazione **iCalendar (.ics)** di tutte le gare, con girone o turno di playoff nel titolo dell'evento.
* Parametri di campionato centralizzati in un unico punto: nome, loghi, stagione, punti vittoria/sconfitta/forfait e punteggio di forfait.
* Foglio `Campionato` diviso in tre blocchi, ciascuno con la propria barra di intestazione colorata sopra: **PARAMETRI** (righe 2-10), **SQUADRE** (intestazioni in riga 13, dati 14-113) e **CAMPI** (intestazioni in riga 116, dati 117-225).
* No macro e no VBA
* Nessuna formula matriciale
* Layout mutuato in gran parte da "Euro_2016.rar" con adattamento all'utilizzo di font liberi
* Questa versione è pensata **anche per il caricamento su Google Sheets**, dove il file è utilizzabile così com'è e condivisibile in sola lettura per la pubblicazione di calendario e classifiche. Per questo usa alcune formule tipiche di quell'ambiente, che per l'uso offline possono richiedere adattamento.
* Sviluppato in *LibreOffice Calc* (le versioni *Microsoft Excel* sono comunque esportate da LibreOffice Calc)

Il progetto comprende due file:

* **MODELLO** — griglia vuota con struttura, formule, formattazione, convalide e formattazione condizionale già pronte: si compilano squadre, campi, calendario e anagrafiche.
* **ESEMPIO** — lo stesso modello con tutti i risultati, i campi e le designazioni compilati, utile per vedere il comportamento di classifiche, spareggi e tabellone.

Limitazioni:

* I quozienti canestri sono confrontati alla quarta cifra decimale nella chiave di ordinamento e mostrati alla terza: due squadre che si equivalgono oltre quella soglia vengono ordinate alfabeticamente.
* Gli scontri diretti sono calcolati solo fra squadre dello stesso girone; il modello non gestisce classifiche avulse fra gironi diversi.
* Le matrici degli scontri diretti sono dimensionate per **10 squadre per girone**: portandone undici o più in uno stesso girone, l'undicesima non compare fra le colonne di confronto. La classifica generale resta corretta, ma quel singolo scontro diretto non viene conteggiato negli spareggi. Come allargarle è spiegato più sotto.
* Cambiare la lettera in colonna E sposta la squadra di girone in tutte le classifiche, ma **non** riscrive il calendario né i colori: quelli restano a carico di chi compila.
* I formati numerici sono impostati come formato cella e non tramite la funzione `TEXT`, per evitare che il separatore decimale cambi il risultato passando fra versioni con lingue diverse.
* Alcune funzioni sono native di Google Sheets e vanno adattate per l'uso offline: in particolare `IMAGE()`, usata per i due loghi di intestazione, non esiste in *LibreOffice Calc* e nelle versioni di *Microsoft Excel* precedenti a 365 — in quel caso le celle dei loghi vanno lasciate vuote o sostituite con immagini inserite a mano.

## Ampliare il modello

Tutte le colonne citate qui sotto stanno nel foglio `Campionato`, a destra della tabella classifica. Le colonne di servizio `X` (chiave di girone) e `Y`-`AH` (elenco delle avversarie di girone) sono nascoste: per vederle si selezionano le colonne `W` e `AI`, poi *Mostra*. Le quattro matrici degli scontri diretti sono invece visibili, basta scorrere verso destra.

### Più di 10 squadre in un girone

Il confronto negli scontri diretti usa una colonna per ogni possibile avversaria di girone. Le colonne sono queste:

| Blocco | Etichetta | Colonne dati |
|---|---|---|
| Avversarie del girone | `X` (chiave) | `Y`-`AH` |
| Vittorie scontri diretti | `AJ` | `AK`-`AT` |
| Sconfitte e forfait scontri diretti | `AV` | `AW`-`BF` |
| Punti fatti scontri diretti | `BH` | `BI`-`BR` |
| Punti subiti scontri diretti | `BT` | `BU`-`CD` |

Per passare da 10 a 11 squadre per girone, per ognuno dei cinque blocchi:

1. **Inserire** una colonna *dentro* il blocco, per esempio prima dell'ultima (`AH`, `AT`, `BF`, `BR`, `CD`). Inserendola all'interno e non in coda, i riferimenti `SUM(...)` e `COUNT(...)` che leggono il blocco si allargano da soli.
2. Copiare in tutta la colonna nuova la formula della colonna a fianco, dalla riga 14 fino all'ultima riga della tabella squadre.
3. Nel blocco delle avversarie (`Y`-`AH`) correggere il numero nella formula: ogni colonna cerca `$E14&"#1"`, `$E14&"#2"` e così via, quindi la nuova colonna deve avere il progressivo che le compete e l'ultima va rinumerata. Nei quattro blocchi delle matrici non c'è nulla da rinumerare: ogni cella punta già alla colonna corrispondente del blocco avversarie.
4. Aggiornare l'intestazione in riga 13 (`1^`, `2^`, ... ) per coerenza visiva.

Se invece si aggiunge la colonna **in coda** al blocco, vanno corretti a mano gli intervalli nelle formule che li sommano: colonna `I` (coefficiente di ordinamento), `U` (record scontri diretti), `V` (quoziente scontri diretti) e `W` (quoziente totale), tutte nella tabella classifica.

### Più di 100 squadre o più di 10 gironi

1. Inserire le righe necessarie **dentro** la tabella squadre (righe 14-113, non dopo l'ultima), così gli intervalli si estendono da soli, e copiarvi le formule delle colonne `G`-`X` e dei blocchi delle matrici.
2. Verificare i nomi definiti `areaNomiSquadre`, `areaCercaPuntiClassificaSquadra`, `areaCercaDatiPerPosizioneSquadre` e `areaCoefficienteSquadre`, che devono coprire tutte le righe squadra.
3. Per un girone in più: duplicare un foglio `Calendario`, rinominarlo con la lettera nuova, assegnargli un colore, e aggiungere le sue righe in coda al foglio nascosto `Dati` con i riferimenti al nuovo foglio. Estendere poi l'intervallo `Dati!$A$2:$N$451` in tutte le formule che lo usano.
4. Aggiungere il blocco corrispondente nel foglio `Classifica`.
5. I playoff restano a 16 squadre dai gironi `A`-`H`: per cambiare anche quelli va rifatto il foglio `Playoff`, dove gli accoppiamenti degli ottavi sono scritti come codici posizione (`A1`, `H2`, ...) nelle colonne `C` ed `E`.

Addattamento al **Basket**/**Baskin** di:
## Daniele Lolli (aka UncleDan)

Per segnalazioni o richieste di implementazione (tempo permettendo):

[https://github.com/UncleDan/classifica-basket-baskin-excel/issues](https://github.com/UncleDan/classifica-basket-baskin-excel/issues)
