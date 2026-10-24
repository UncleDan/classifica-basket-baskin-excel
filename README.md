# Classifica Baskin Excel

Lavoro ispirato da *Europei di Calcio 2016 con Excel* di Alexsandra "Euro_2016.rar" ([http://www.wintricks.it/forum/showthread.php?t=165174](http://www.wintricks.it/forum/showthread.php?t=165174))

Il repository contiene **cinque versioni** dello stesso modello, ognuna in due file (**MODELLO** vuoto ed **ESEMPIO** compilato). Si sceglie la versione in base al numero di gironi e al tabellone previsto dal regolamento della stagione: tutte funzionano allo stesso modo, cambiano solo le dimensioni.

## Versioni disponibili

| Versione | File (`Campionato_Baskin_<versione>_MODELLO.xlsx` / `_ESEMPIO.xlsx`) | Gironi | Squadre per girone | Gare di girone | Playoff |
|---|---|---|---|---|---|
| 1 × 10 | `Campionato_Baskin_1x10_MODELLO.xlsx` / `_ESEMPIO.xlsx` | 1 (A) | 10 | 45 (9 giornate da 5 gare) | 8 squadre: 1-8, 2-7, 3-6, 4-5 |
| 10 × 10 | `Campionato_Baskin_10x10_MODELLO.xlsx` / `_ESEMPIO.xlsx` | 10 (A-J) | 10 | 450 (9 giornate da 5 gare) | 16 squadre: prime due dei gironi A-H; I e J non competitivi |
| 16 × 20 | `Campionato_Baskin_16x20_MODELLO.xlsx` / `_ESEMPIO.xlsx` | 16 (A-P) | 20 | 3040 (19 giornate da 10 gare) | Tre tabelloni alternativi: a 32, a 16 e a 8 |
| 4 × 20 | `Campionato_Baskin_4x20_MODELLO.xlsx` / `_ESEMPIO.xlsx` | 4 (A-D) | 20 | 760 (19 giornate da 10 gare) | 16 squadre: prime quattro dei gironi A-D |
| 2 × 20 | `Campionato_Baskin_2x20_MODELLO.xlsx` / `_ESEMPIO.xlsx` | 2 (A-B) | 20 | 380 (19 giornate da 10 gare) | 8 squadre: prime quattro dei gironi A e B |

In tutte le versioni il calendario è di sola andata, generato con il metodo del girone all'italiana (Berger), e le gare sono numerate in sequenza continua: prima quelle di girone, poi quelle di playoff. Usando meno squadre di quelle previste basta lasciare vuote le righe non utilizzate: classifiche e calendari si adeguano da soli.

## Generatore su misura

Il generatore si può usare anche online: l'azione GitHub `.github/workflows/pages.yml` pubblica su GitHub Pages solo `Generatore_Campionato_Baskin.html`, a ogni modifica del file oppure a mano dalla scheda *Actions*: la versione del ramo principale (`main`, oppure `master` se `main` non c'è) all'indirizzo del sito, quella del ramo `beta` (se esiste) nella sottocartella `/beta/`, così si può provare una versione nuova senza toccare quella in uso. Se il ramo principale non esiste si pubblica solo `beta` e l'indirizzo del sito rimanda a `/beta/`. La preparazione del sito è nello script `.github/workflows/build_site.sh`. Per attivarla, una sola volta: *Settings* → *Pages* → *Build and deployment* → *Source*: **GitHub Actions**. GitHub Pages accetta pubblicazioni solo dal ramo predefinito: un push sul ramo `beta` rilancia quindi l'azione sul ramo predefinito, che ricostruisce il sito leggendo l'HTML da tutti i rami, senza modificare le regole di protezione dell'ambiente `github-pages`. Per questo i file in `.github/workflows` devono essere presenti, aggiornati, anche nel ramo predefinito.

`Generatore_Campionato_Baskin.html` è una pagina unica che crea il file MODELLO con le dimensioni volute. Si apre con un doppio clic in qualsiasi browser recente (Chrome, Edge, Firefox, Safari), funziona anche offline e nessun dato lascia il computer.

* **Gironi**: un girone per riga nel formato `nome, squadre, colore, sigla` (separatore virgola, punto e virgola o tabulazione). Il nome è quello per la stampa (cella `D11`). La sigla, da 1 a 3 lettere (per esempio `O`, `E`, `ORO`), identifica il girone nei codici squadra (`ORO01`), nelle classifiche (`ORO1`), nelle barre dei calendari e nel playoff; se manca vale A, B, C… secondo la posizione, fino a 26 gironi. Ogni girone può avere un numero diverso di squadre, da 3 a 40: con un numero dispari in ogni giornata una squadra riposa. Il colore può essere un nome HTML (`green`, `red`, `navy`, `teal`…), un codice `#RRGGBB`, oppure `gold`, `silver`, `bronze`, `platinum`, e si può lasciare vuoto (`Ovest, 8, , O`); dal colore vengono ricavate la tinta scura (barre e linguette) e quella chiara (righe).
* **Andata e ritorno** (casella, non spuntata di default): ogni girone generato ha anche il girone di ritorno, con lo stesso numero di giornate; nel `RIEPILOGO` le gare sono in ordine, prima l'andata poi il ritorno. Per i gironi con le giornate copiate da un file importato vale il file.
* **Calendari unificati** (facoltativo): gironi che condividono un unico foglio calendario, come il `Calendario O-E` dell'Emilia-Romagna. Un gruppo per riga o separato da `;`, con i gironi separati da `,` oppure come intervallo (`A,B`, `A,C`, `A-D`; per esempio `A-B; C-D`; si usano le sigle, e un intervallo segue l'ordine dei gironi). Nel foglio unico, chiamato `Calendario A-B` (o `Calendario A,C` se i gironi non sono consecutivi), le giornate dei gironi si alternano (1A, 1B, 2A, 2B…) e ogni blocco mantiene il colore e il nome del proprio girone, mentre l'intestazione del foglio è in nero; le gare sono numerate nell'ordine del foglio. Classifiche, `Designazioni`, `Calendario.ics` e playoff funzionano come con un foglio per girone. Importando un file che ha già un calendario unico per più gironi (come la versione Ovest-Est) la casella si compila da sola.
* **Classifiche raggruppate**: gironi che condividono un unico foglio di classifica, con lo stesso formato dei calendari unificati (es. `A-D` oppure `A,B; C-D`). Di default il campo contiene tutti i gironi: un solo foglio `Classifica`, dopo i playoff, come prima; finché resta così segue i gironi aggiunti o tolti. I gironi non indicati hanno ciascuno il proprio foglio (es. `Classifica A`) subito dopo il loro calendario; con il campo vuoto tutti i fogli sono separati: `Calendario A`, `Classifica A`, `Calendario B`, `Classifica B`… Con l'importazione i gruppi si ricavano dai fogli del file di origine.
* **Parametri**: solo i valori, uno per riga, nello stesso ordine delle celle `D2`-`D11` del foglio `Campionato` (Campionato, Link Logo 1, Link Logo 2, Gironi, Stagione, Punti vittoria, Punti sconfitta, Punti forfait, Punteggio forfait, Nomi gironi per la stampa), così si possono copiare e incollare da Excel. Le righe 4 e 10 sono comunque ricavate dall'elenco dei gironi (sigle e nomi).
* **Playoff**: numero di squadre (0 = nessun playoff, oppure da 2 a 64; se non è una potenza di 2, per esempio 12, il tabellone si completa con dei BYE come nel tennis: le teste di serie migliori passano il primo turno senza giocare, senza data né campo), qualificate per girone e gironi interessati (sigle, es. `A,B` oppure `A-D`; vuoto = tutti). Teste di serie per posizione e poi per ordine dei gironi; al primo turno la prima incontra l'ultima, la seconda la penultima e così via (con un solo girone 1-8, 2-7, 3-6, 4-5).
* **Playoff con andata e ritorno** (casella, non spuntata di default): ogni turno prima delle finali si gioca in due gare, con le squadre che al ritorno si scambiano il campo; sotto la gara di ritorno una riga di esito mostra il totale delle due gare e la squadra che passa il turno (migliore differenza canestri). In caso di parità il foglio lo segnala e si scrive A (prima squadra dell'andata) o B nella casella a destra della riga di esito. Le finali 3°-4° e 1°-2° restano in gara unica. Vale anche per il Torneo Primavera. Nei playoff importati con lo schema del file di origine (es. Lombardia Sud) le sfide di andata e ritorno vengono riconosciute da sole (stesse squadre a campi invertiti) e hanno la stessa riga di esito.
* **Importa da file esistenti** (facoltativo): si trascinano uno o più xlsx nel riquadro, oppure si scelgono con "sfoglia"; i file aggiunti dopo si uniscono a quelli già caricati. La pagina riconosce da sola il tipo, compila le caselle (gironi con numero di squadre e colore, parametri, playoff, anagrafiche) e, con "Genera xlsx", riporta nel nuovo modello squadre e penalizzazioni, campi, calendario (squadre, data e ora, campo), risultati, tabellone dei playoff con i suoi accoppiamenti, designazioni e anagrafiche. Tipi riconosciuti:
  * **Modello a girone singolo**: il modello con un solo girone per file (squadre numerate 1, 2, 3… senza colonna del girone, foglio unico `Calendario` con data e ora in colonne separate), come i file dei gironi del Veneto;
  * **Modello classico**: il modello a 10 gironi con i nomi definiti (`Calendario A`-`J`);
  * **Emilia-Romagna classico**: il file con un unico foglio `Calendario` e gironi Ovest (O) ed Est (E);
  * **Emilia-Romagna Ovest-Est**: la versione con il foglio `Calendario O-E` e la `Coppa Primavera`;
  * **Nuovo modello**: tutte le versioni di questo repository e i file prodotti dal generatore.

  **Rileggi e Reset**: "Rileggi" rilegge i file caricati e riporta tutte le caselle ai valori letti, annullando le modifiche; "Reset" svuota tutte le caselle e toglie i file, tornando ai valori iniziali (senza Torneo Primavera).

  **Fusione di più file**: si possono caricare più xlsx insieme o aggiungerli uno alla volta, per unire in un unico campionato gironi arrivati in file separati (per esempio i gironi Silver di una regione). I gironi si accodano nell'ordine dei file e mantengono la loro sigla; se due file usano la stessa sigla, il girone del secondo prende la prima lettera libera. con squadre, campi, calendario, risultati e designazioni; i parametri si prendono dal primo file, i campi neutri si uniscono per nome (al massimo 8), arbitri e Ufficiali di Campo si uniscono per nome togliendo i doppioni, e le squadre con lo stesso nome in file diversi sono segnalate. I playoff dei singoli file non si importano: il playoff del campionato unito si imposta nella scheda Playoff. Con la casella "Calendari unificati" i gironi uniti possono stare in un solo foglio calendario.

  **Modificare i gironi importati**: le sigle dei gironi del file restano quelle originali quando sono valide (per esempio `O` ed `E` nell'Emilia-Romagna), con codici squadra come `O01`. Prima di generare si possono cambiare nome, sigla, colore e numero di squadre, spostare le righe per cambiare l'ordine dei gironi, oppure cancellare una riga per escludere quel girone: ogni riga è riconosciuta dal nome, poi dalla sigla, poi dalla posizione, quindi squadre, campi, calendario, risultati, designazioni e playoff seguono il proprio girone anche se si cambia la sigla. Quando si esce dalla casella si aggiornano le caselle Squadre e Campi (codici e girone), i gironi del playoff e i calendari unificati; le righe di un girone escluso vengono rimesse se il girone viene aggiunto di nuovo (anche con un nome o una sigla diversi da quelli del file, purché già usati prima).

  **Modificare squadre e campi importati**: nelle caselle Squadre e Campi si possono cambiare nomi, penalizzazioni, link e anche i codici. Ogni riga ricorda la squadra o il campo del file importato (riconosciuti dal nome), quindi calendario e risultati seguono la squadra e le gare seguono il campo; quando si cambia il codice di una squadra anche il suo campo di casa cambia codice, scambi compresi (per esempio A01 con A03).

  Se il punteggio forfait del file di origine non è nel formato punti-punti (per esempio `FORFAIT`, come nei vecchi file), resta com'è: la sconfitta a tavolino non è gestita e ogni sconfitta vale i punti sconfitta, come nel file di origine.

  **Giornate del file di origine** (casella spuntata di default): il calendario di ogni girone copia giornate e gare per giornata del file importato, compreso il girone di ritorno; nel `RIEPILOGO` la fase è Andata o Ritorno e le gare sono in ordine: prima tutta l'andata, poi il ritorno. Togliendo la spunta il calendario viene rigenerato come girone all'italiana di sola andata (le gare in più non trovano posto).

  **Squadre fuori classifica**: nel file prodotto una S nella colonna F (FC) del foglio `Campionato` indica una squadra fuori classifica; nel generatore si indicano nella casella **Fuori classifica**, una per riga, con il codice e/o il nome (con l'importazione la casella si riempie con quelle trovate o dedotte dal file di origine, da controllare). Le gare di una squadra fuori classifica restano nei calendari ma non contano per nessuna delle due squadre: né vittoria né sconfitta, né punti per i quozienti canestri o gli scontri diretti. In classifica le squadre fuori classifica sono sempre in fondo al girone, in ordine alfabetico, evidenziate in giallo, con "(f.c.)" e tutte le colonne a "-". Nei vecchi file viene riconosciuta da sola una squadra con risultati in calendario ma 0 gare in classifica (si legge anche la vecchia X).

  **Playoff con squadre esenti**: un tabellone di origine in cui le prime entrano direttamente al secondo turno (per esempio 12 squadre con le prime due di ogni girone ai quarti) diventa un tabellone con i BYE, e ogni gara di origine viene collegata alla gara corrispondente del nuovo tabellone.

  **Gironi da dividere**: se in un girone del file di origine ci sono gruppi di squadre che non si incontrano mai (per esempio due gironi da 5 scritti nello stesso foglio, come le Marche 2025/2026), con la casella "Dividi i gironi…" (spuntata di default) ogni gruppo diventa un girone: le squadre ricevono i codici del nuovo girone, le gare seguono le loro squadre con le stesse giornate e il calendario resta un unico foglio (la casella "Calendari unificati" si compila da sola, es. `A,B`). Le squadre senza gare restano nel primo gruppo. Si può anche dividere a mano: aggiungere il nuovo girone nella scheda Gironi e cambiare il girone delle squadre nella quarta colonna della casella Squadre; le loro gare le seguono.

  **Playoff con schemi diversi dal modello**: l'importazione del tabellone procede per livelli. 1) Se le squadre del primo turno si riconoscono come girone e posizione (anche scritte al contrario, `3N`, oppure ricavate dal vecchio `CERCA.VERT` per posizione) e i turni successivi come vincente o perdente di una gara (`=AA12`, `+37`, `-45`, `37`), si importa tutto nel tabellone del modello, che poi si aggiorna da solo; vale anche per le gare di playoff scritte in fondo al foglio del calendario. 2) Se lo schema è diverso (andata e ritorno, turni con un numero di gare non previsto, squadre scritte col codice o col nome), il playoff viene creato con le stesse sezioni e gare del file di origine e si importano squadre e risultati (per le sfide di andata e ritorno anche il totale e la squadra che passa): le squadre sono scritte gara per gara nelle colonne C ed E (codice squadra, oppure girone e posizione come `A3`) e i turni successivi non si ricavano da soli, salvo le gare collegate a vincente o perdente di una gara precedente. I nomi si riconoscono anche con piccole differenze (punti, spazi, una lettera sbagliata, nome abbreviato). 3) Se le squadre non si riconoscono affatto, si crea solo la griglia vuota delle gare trovate. 4) Se nel foglio non si trovano gare, si crea il tabellone standard (sedicesimi, ottavi, quarti o semifinali) secondo il numero di squadre indicato nel nome del foglio (es. `Playoff 8 Squadre`) o, in mancanza, delle squadre del campionato. Le squadre e i risultati che non si possono importare vengono segnalati. Se si cambia il numero di squadre del playoff nel generatore, si torna al tabellone standard del modello. Le date del playoff scritte come testo (es. `18/05/25`) vengono convertite in date vere.

  **Note nella riga del campo**: nei vecchi file a volte nella riga del campo, al posto del campo, c'è una nota (per esempio "gara rinviata al 13-11-25 a Pesaro"): viene portata nel foglio `Note` (che si attiva da solo) e compare nel `RIEPILOGO` tra parentesi.

  **Modelli vuoti**: un file senza squadre viene segnalato come modello vuoto e, se è insieme ad altri file, viene saltato.

  **Avvisi da correggere a mano**: alcune situazioni vengono solo segnalate in rosso sotto il riepilogo dell'importazione, da correggere nel file di origine prima di procedere: gare con le squadre scritte per nome invece che col codice, codici squadra che non esistono nell'elenco, gare con il risultato ma senza squadre, date scritte come testo, colonne del calendario spostate rispetto al modello, squadre del playoff non riconosciute, designazioni presenti senza i fogli Arbitri e UdC, risultati scritti come testo, calendari senza gare compilate, fogli con gare dal nome non riconosciuto (es. `Final Four`, `Playout`), più fogli calendario sommati nello stesso girone (es. una seconda fase) e gironi che in realtà sono più gironi separati (squadre che non si incontrano mai). Se un file non si può importare affatto (foglio Campionato mancante, tabelle spostate, modello vuoto) il messaggio lo spiega; con più file vengono elencati tutti i file con problemi.

  I gironi del file di origine diventano A, B, C… nell'ordine in cui compaiono e i codici squadra diventano `A01`, `A02`…; i campi che non appartengono a una squadra vanno sui campi neutri `PO1`-`PO8`. Del playoff si importano il primo tabellone (per esempio `Playoff 32` nella versione 16 × 20) e, se c'è, la seconda griglia come Torneo Primavera (la `Coppa Primavera` della versione Ovest-Est, o le gare del Torneo Primavera nel foglio `Playoff` dell'Emilia-Romagna classico), con i loro accoppiamenti. Prima di generare si possono ancora cambiare gironi, squadre, colori e playoff: i dati che non trovano posto nel nuovo modello vengono scartati e contati nel riepilogo.
* **Torneo Primavera** (facoltativo): una seconda griglia di playoff, su un foglio a parte, per le squadre non qualificate al tabellone principale. Prende le posizioni successive negli stessi gironi del playoff (per esempio playoff con le prime 4 di ogni girone, Primavera con le classificate dalla 5a all'8a) con le stesse regole di teste di serie; le gare sono numerate di seguito a quelle del playoff, compaiono in `Designazioni` e `Calendario.ics`, e in `Classifica Finale` occupano le posizioni subito dopo il tabellone principale.
* **Squadre e Campi** (facoltativi): due caselle in cui scrivere o incollare l'elenco delle squadre (`codice, nome, penalizzazione, girone`, come le colonne B-E del foglio `Campionato`) e dei campi (`codice, nome campo, link mappa`, come le colonne B-D del blocco CAMPI). Si incollano direttamente da Excel (colonne separate da tabulazione) oppure come righe CSV separate da `,` o `;` (i testi con separatori dentro vanno tra virgolette; per i campi il nome può contenere virgole se il link è l'ultimo valore). Nei file prodotti dal generatore risultati, classifiche e scontri diretti sono collegati al **codice** della squadra, non al nome: il codice (come quello dei campi) deve essere unico, mentre il nome si può cambiare in qualsiasi momento e può ripetersi in gironi diversi (per esempio la stessa società in Gold e in Platinum). Il codice può essere libero (per esempio `REG`, `BO1`): la squadra va nel primo posto libero del girone indicato in quarta colonna e nel file resta il codice scelto, anche nel blocco CAMPI e nei calendari. Importando un xlsx le due caselle si riempiono da sole e si possono correggere prima di generare.
* **Anagrafiche**: righe dei fogli `Arbitri` e `UdC`. Se il numero è più alto delle righe importate, le righe in più restano vuote, pronte da compilare, e gli elenchi a discesa di `Designazioni` le comprendono. Se il numero non viene indicato il foglio non viene creato e in `Designazioni` i nomi si scrivono a mano, senza elenco a discesa; se mancano sia gli arbitri sia gli Ufficiali di Campo non viene creato neanche il foglio `Designazioni`. Nei fogli `Arbitri` e `UdC` la colonna E contiene l'email di ciascuno (per usi futuri, es. l'invio delle designazioni; se il testo non contiene una @ compare un avviso) e le indisponibilità/note passano in colonna F; i file delle versioni precedenti si importano comunque, con le note al posto giusto.
* **Note e Provvedimenti disciplinari** (facoltativi, caselle nella scheda Anagrafiche): fogli `Note` e `Provvedimenti Disciplinari`, ognuno con il numero di gara in colonna A e una casella larga per il testo in colonna B (una riga per gara), allineate in alto e con il numero di gara centrato. Quello che si scrive compare nel `RIEPILOGO` accanto alla gara, in due colonne separate (`Note` e `Provvedimenti disciplinari`); i due fogli vengono prima del `RIEPILOGO`, che è sempre l'ultimo foglio. Importando un file che ha questi fogli, le caselle si spuntano da sole e i testi restano legati alla loro gara anche se cambia la numerazione.
* **Provvedimenti in una cartella di lavoro a parte** (casella sotto "Foglio Provvedimenti Disciplinari"): i provvedimenti non stanno nel file del calendario, così chi inserisce i risultati non li vede. Il generatore scarica due file: il calendario e `<nome del calendario> - Provvedimenti.xlsx`, con il solo foglio `Provvedimenti Disciplinari`. Il `RIEPILOGO` del calendario li riprende per numero di gara:
  * **Excel**: quando il file dei provvedimenti è aperto insieme al calendario (in qualunque cartella). Il nome cercato è in `Campionato!H4`: di default è il nome attuale del calendario seguito da " - Provvedimenti"; un nome diverso si scrive in `Campionato!H2`. Se il file manca, la colonna resta vuota senza errori e torna a riempirsi appena lo si riapre.
  * **Google Sheets**: caricare anche il file dei provvedimenti su Drive e salvarlo come Foglio Google, scriverne il link in `Campionato!H3` e, la prima volta, consentire l'accesso nel foglio `Collegamento Provvedimenti` (cella A3). In Google Sheets un file non si può cercare per nome: serve il link.
  * LibreOffice non legge questo collegamento (la colonna resta vuota).
  * Per reimportare, caricare nel generatore i due file insieme: i provvedimenti tornano legati alle loro gare.
* **RIEPILOGO**: il generatore aggiunge in fondo, come ultimo foglio (anche dopo `Note` e `Provvedimenti Disciplinari`), il foglio `RIEPILOGO`, senza formattazione e tutto a formule (si aggiorna da solo): una gara per riga con numero di gara, lettera e nome del girone, giornata, fase, squadre, data, ora, nome del campo, punti delle due squadre, **Esiti Speciali** ("Forfait Squadra A" o "Forfait Squadra B", altrimenti vuoto) e **FC** (A, B o AB se è fuori classifica la prima squadra, la seconda o entrambe, altrimenti vuoto). Prima riga con le descrizioni in grassetto; poi le gare di andata in ordine di lettera del girone e di giornata (il modello prevede solo l'andata), poi il playoff dal primo turno alle finali e, se c'è, il Torneo Primavera nello stesso ordine.
* **Modifiche a mano: ricerche per numero di gara** (default) o **riferimenti fissi** (casella sopra "Genera xlsx"). Con le ricerche ogni gara ha un numero fisso in colonna A e il foglio `Dati` (quindi le classifiche), il `RIEPILOGO`, il `Calendario.ics` e le `Designazioni` la cercano con quel numero: nei calendari si possono spostare, copiare, aggiungere o cancellare gare e tutto si aggiorna. Una gara aggiunta deve avere un numero nuovo, nell'intervallo indicato nel `MEMO` (ci sono righe di scorta per queste gare in `Dati`, `RIEPILOGO`, `Calendario.ics` e `Designazioni`); la giornata si legge dalla barra GIORNATA sopra la gara; i numeri ripetuti nello stesso foglio diventano rossi e nel `MEMO` una riga di controllo confronta le gare dei calendari con quelle contate in classifica. Un foglio calendario creato a mano non viene visto: per aggiungere gironi si rigenera il file. I riferimenti fissi danno un file più leggero e più veloce da ricalcolare (su 16 × 20 circa il 20% in meno), utile per i campionati molto grandi, ma le gare non vanno spostate né aggiunte a mano.
* **Calendario.ics**: titolo breve di ogni evento con il numero di gara, es. `G1: Squadra 1 vs Squadra 2`; il girone o il turno di playoff (es. `[Girone O]`, `[Playoff a 8 - Quarti]`) è nella descrizione, dopo nome e stagione del campionato.
* **Privacy e uso da cellulare**: tutto avviene nel browser, senza richieste in rete né dati salvati (niente cookie, localStorage o IndexedDB); resta solo il file xlsx scaricato. Le avvertenze complete sono in fondo alla pagina, con la revisione del generatore. Su schermi piccoli la pagina va su una colonna, con caselle più grandi, il pulsante "Scegli i file xlsx" al posto del trascinamento e il pulsante "Genera xlsx" sempre in basso.
* Il file prodotto si chiama come il campionato seguito dalla stagione (parametri 1 e 5, per esempio `Campionato Baskin Senior EISI Veneto 2026_2027.xlsx`), con `_` al posto dei caratteri non validi nei nomi di file come `/`; se i due parametri sono vuoti si chiama `Campionato_Baskin_<gironi>x<squadre>_MODELLO.xlsx` (oppure `Campionato_Baskin_<gironi>gironi_<squadre>squadre_MODELLO.xlsx` se i gironi hanno dimensioni diverse). Il file ha la stessa struttura delle versioni qui sopra: fogli, formule, colori, convalide, formattazione condizionale, solo intervalli di celle. Il generatore parte dalla versione 1 × 10, contenuta nella pagina stessa; il file si calcola alla prima apertura in Excel, LibreOffice o Google Sheets.

### 1 girone da 10 squadre (10 squadre)

* La versione più leggera: contiene il minimo indispensabile per avere tutti i riferimenti del modello, senza il foglio `REGOLAMENTO`.
* Ogni giornata è un concentramento unico ospitato da una squadra del girone: 5 gare consecutive sullo stesso campo.
* **Playoff a 8** con le prime otto classificate: quarti 1-8, 2-7, 3-6, 4-5 (gare 46-49), semifinali V.Q1-V.Q4 e V.Q2-V.Q3, finale 3°-4° e finale 1°-2° posto (gare 50-53). La `Classifica Finale` va dalla 1ª alla 10ª posizione.
* Nel foglio `Classifica` sono colorate le prime otto.
* Fogli: `Campionato`, `Calendario A`, `Playoff`, `Classifica`, `Classifica Finale`, `DESIGNAZIONI` (53 gare), `Arbitri` e `UdC` (30 righe), `MEMO`, `Calendario.ics`, `Dati` (nascosto).
* `Campionato`: squadre righe 14-23, campi righe 27-45 (squadre 27-36, `PO1`-`PO8` 37-44, `TBD` 45). Colonne di servizio come nella versione 10 × 10.
* L'ESEMPIO contiene apposta tutti i casi di parità: tre squadre a pari punti separate dal **quoziente canestri negli scontri diretti** (1-1 fra loro), due squadre separate dalle **vittorie negli scontri diretti** (1-0) e tre squadre con scontri diretti e quoziente negli scontri diretti identici, separate dal **quoziente canestri totale**.

### 10 gironi da 10 squadre (100 squadre)

* Gironi **A-H competitivi**, le cui prime due classificate accedono ai playoff, e gironi **I-J non competitivi**, con calendario e classifica ma fuori dalla fase finale.
* Ogni giornata è un concentramento unico ospitato da una squadra del girone: 5 gare consecutive sullo stesso campo.
* **Playoff a 16** con incroci 1A-2H, 1B-2G, 1C-2F, 1D-2E, 1E-2D, 1F-2C, 1G-2B, 1H-2A: ottavi, quarti, semifinali, finale 3°-4° e finale 1°-2° posto (gare 451-466).
* Fogli: `Campionato`, `Calendario A`-`J`, `Classifica`, `Playoff`, `Classifica Finale` (1ª-100ª posizione, con i gironi non competitivi in coda), `DESIGNAZIONI`, `Arbitri` e `UdC` (100 righe), `MEMO`, `Calendario.ics`, `Dati` (nascosto), `REGOLAMENTO`.
* `Campionato`: squadre righe 14-113, campi righe 117-225. Colonne di servizio: avversarie `Y`-`AH`, matrici `AK`-`AT`, `AW`-`BF`, `BI`-`BR`, `BU`-`CD`, vittorie SD in `CF`.
* Colori: A oro (Gold), B argento (Silver), C bronzo (Bronze), D platino (Platinum); E-J con i propri colori.

### 16 gironi da 20 squadre (320 squadre)

* Tutti i gironi sono competitivi. Ogni giornata è un concentramento ospitato da due squadre del girone, 5 gare per palazzetto (09:30, 11:00, 14:30, 16:00, 17:30).
* **Tre tabelloni alternativi già pronti**, ciascuno su un foglio a parte e con la propria classifica finale (1ª-320ª): si usa quello previsto dal regolamento della stagione.
  * `Playoff 32` (gare 3041-3072): prime due di ognuno dei 16 gironi. Trentaduesimi 1A-2I, 1B-2J, 1C-2K, 1D-2L, 1E-2M, 1F-2N, 1G-2O, 1H-2P, 1I-2A, 1J-2B, 1K-2C, 1L-2D, 1M-2E, 1N-2F, 1O-2G, 1P-2H, poi ottavi, quarti, semifinali e finali; due squadre dello stesso girone possono incontrarsi solo in finale.
  * `Playoff 16` (gare 3073-3088): prime quattro dei gironi A-D. Ottavi 1A-4B, 2C-3D, 1C-4D, 2A-3B, 1B-4A, 2D-3C, 1D-4C, 2B-3A; squadre dello stesso girone al più presto in semifinale.
  * `Playoff 8` (gare 3089-3096): prime quattro dei gironi A e B. Quarti 1A-4B, 2B-3A, 1B-4A, 2A-3B.
* Nel foglio `Classifica` sono colorate le prime due di ogni girone (qualificate al playoff a 32).
* Fogli: `Campionato`, `Calendario A`-`P`, `Playoff 32`/`16`/`8`, `Classifica`, `Classifica Finale 32`/`16`/`8`, `DESIGNAZIONI` (3096 gare), `Arbitri` e `UdC` (300 righe), `MEMO`, `Calendario.ics`, `Dati` (nascosto), `REGOLAMENTO`.
* `Campionato`: squadre righe 14-333, campi righe 337-665. Colonne di servizio: avversarie `Y`-`AR`, matrici `AU`-`BN`, `BQ`-`CJ`, `CM`-`DF`, `DI`-`EB`, vittorie SD in `ED`.
* Colori: A oro (Gold), B argento (Silver), C bronzo (Bronze), D platino (Platinum), E giallo (Yellow), F magenta, G ciano (Cyan), H arancione (Orange), I viola (Violet), J verde (Green), K rosso (Red), L blu (Blue), M verde acqua (Teal), N marrone (Brown), O lime, P grafite (Graphite). Nel file ESEMPIO la cella `D11` contiene i nomi inglesi, quindi i calendari stampano `GIRONE GOLD`, `GIRONE SILVER` e così via.

### 4 gironi da 20 squadre (80 squadre)

* Estratto della versione 16 × 20 con i soli gironi A-D e il solo **playoff a 16** (prime quattro dei gironi A-D, ottavi 1A-4B, 2C-3D, 1C-4D, 2A-3B, 1B-4A, 2D-3C, 1D-4C, 2B-3A; gare 761-776), con la sua `Classifica Finale` (1ª-80ª).
* Nel foglio `Classifica` sono colorate le prime quattro di ogni girone.
* Fogli: `Campionato`, `Calendario A`-`D`, `Playoff`, `Classifica`, `Classifica Finale`, `DESIGNAZIONI` (776 gare), `Arbitri` e `UdC` (300 righe), `MEMO`, `Calendario.ics`, `Dati` (nascosto), `REGOLAMENTO`.
* `Campionato`: squadre righe 14-93, campi righe 97-185. Colonne di servizio come nella versione 16 × 20.

### 2 gironi da 20 squadre (40 squadre)

* Estratto della versione 16 × 20 con i soli gironi A-B e il solo **playoff a 8** (prime quattro dei gironi A e B, quarti 1A-4B, 2B-3A, 1B-4A, 2A-3B; gare 381-388), con la sua `Classifica Finale` (1ª-40ª).
* Nel foglio `Classifica` sono colorate le prime quattro di ogni girone.
* Fogli: `Campionato`, `Calendario A`-`B`, `Playoff`, `Classifica`, `Classifica Finale`, `DESIGNAZIONI` (388 gare), `Arbitri` e `UdC` (300 righe), `MEMO`, `Calendario.ics`, `Dati` (nascosto), `REGOLAMENTO`.
* `Campionato`: squadre righe 14-53, campi righe 57-105. Colonne di servizio come nella versione 16 × 20.

Negli ESEMPIO delle versioni 4 × 20 e 2 × 20 squadre, risultati, playoff e designazioni coincidono con quelli dei gironi corrispondenti della versione 16 × 20.

## Caratteristiche comuni

* Il girone di una squadra dipende **solo dalla lettera in colonna E**, non dalla riga in cui la squadra si trova: spostare una squadra di girone significa cambiare quella lettera. Classifiche, spareggi e posizioni si riallineano da sole; restano da sistemare a mano il calendario (chi incontra chi) e i colori delle righe.
* Classifica secondo i criteri del regolamento **Baskin** per gironi "round robin": **3 punti classifica per ciascuna partita vinta**, **1 punto classifica per ciascuna partita persa** e **0 punti classifica per le partite perse per forfait** (identificate dal risultato 40-0 o 0-40, valore comunque parametrico); risoluzione delle parità, nell'ordine, con i criteri *Maggior numero di vittorie nelle gare tra di loro*, *Più alto quoziente canestri nelle gare tra di loro*, *Più alto quoziente canestri in tutte le gare del girone*. Come criterio residuo, per garantire sempre un ordinamento univoco, l'ordine alfabetico.
* I tre criteri di spareggio **compaiono solo quando servono davvero**: se la parità si risolve con gli scontri diretti si vede solo quella colonna, se serve il quoziente negli scontri diretti se ne vedono due, e solo arrivando al quoziente totale se ne vedono tre. Le squadre non appaiate mostrano `-` su tutte e tre.
* Eventuali **punti di penalizzazione** per squadra, sottratti automaticamente in classifica.
* Foglio **DESIGNAZIONI** con arbitri e ufficiali di campo per ogni gara: elenchi a discesa alimentati dalle anagrafiche, e formattazione condizionale che evidenzia la stessa persona designata due volte nella stessa gara. Convalide e controllo attivi su *tutte* le righe predisposte, gare di playoff comprese.
* Fogli **Arbitri** e **UdC** con conteggio automatico delle designazioni per ruolo e scala colore sul carico di lavoro.
* Esportazione **iCalendar (.ics)** di tutte le gare, con girone o turno di playoff nel titolo dell'evento.
* Parametri di campionato centralizzati in un unico punto: nome, loghi, stagione, punti vittoria/sconfitta/forfait e punteggio di forfait. I gironi si elencano **separati da virgola** (`A,B,C,D,...`), così da poter usare anche lettere non consecutive; la colonna `Girone` della tabella squadre ha un elenco a discesa con le stesse lettere.
* **Nomi dei gironi per la stampa**: nella cella `D11` si possono indicare, separati da virgola e nello stesso ordine dei gironi, i nomi da mostrare sulle intestazioni dei calendari. Esempio: con `A,B,C` in `D5` e `Silver, Gold, Platinum` in `D11`, i fogli restano `Calendario A`, `Calendario B`, `Calendario C` (e lettere e formule non cambiano), ma in stampa compaiono `GIRONE SILVER`, `GIRONE GOLD`, `GIRONE PLATINUM`, sia nel titolo di pagina sia nelle intestazioni di giornata. Se `D11` è vuota, o manca il nome di un girone, resta la lettera. Il nome vale solo per i calendari: classifiche, playoff, `Calendario.ics` e il resto del file continuano a usare la lettera.
* **Loghi**: i due link (URL pubblico di un'immagine) si scrivono in `Campionato!D3` e `D4`; compaiono tramite `IMAGE()` nelle intestazioni dei fogli calendario, playoff, classifica, classifica finale e `DESIGNAZIONI`. Le righe 1-3 hanno la stessa altezza in tutti questi fogli. Se i link sono vuoti non si vede nulla.
* Un foglio nascosto `Dati` consolida in un unico blocco le righe di servizio di tutti i calendari: tutte le formule di classifica cercano lì per nome squadra, e nessuna dipende dalla posizione nel foglio.
* Foglio `Campionato` diviso in tre blocchi, ciascuno con la propria barra di intestazione colorata sopra: **PARAMETRI** (righe 2-11), **SQUADRE** (intestazioni in riga 13, dati dalla riga 14) e **CAMPI** (campi delle squadre, campi neutri `PO1`-`PO8` per la fase a eliminazione diretta e `TBD`); le righe esatte di ogni versione sono nella tabella più sotto.
* **Nessun nome definito**: tutte le formule, le convalide e la formattazione condizionale usano solo intervalli di celle espliciti, per esempio `Campionato!$D$2` per il nome del campionato, `Campionato!$B$14:$H$113` per la tabella squadre e `Arbitri!$D$5:$D$104` per l'elenco a discesa degli arbitri. Restano soltanto le aree di stampa e le righe da ripetere in stampa, che sono impostazioni di pagina. In particolare le matrici degli scontri diretti leggono i punti classifica con `INDEX`/`MATCH` sulle sole colonne `H` e `J`: il vecchio `VLOOKUP` sull'intervallo `H`-`J` comprendeva anche la colonna `I`, che dipende a sua volta dalle matrici, e creava un riferimento circolare nascosto che poteva falsare il primo calcolo.
* No macro e no VBA
* Nessuna formula matriciale
* Layout mutuato in gran parte da "Euro_2016.rar" con adattamento all'utilizzo di font liberi
* Tutte le versioni sono pensate **anche per il caricamento su Google Sheets**, dove il file è utilizzabile così com'è e condivisibile in sola lettura per la pubblicazione di calendario e classifiche. Per questo usa alcune formule tipiche di quell'ambiente, che per l'uso offline possono richiedere adattamento.
* Sviluppato in *LibreOffice Calc* (le versioni *Microsoft Excel* sono comunque esportate da LibreOffice Calc)

Ogni versione comprende due file:

* **MODELLO** — griglia vuota con struttura, formule, formattazione, convalide e formattazione condizionale già pronte: si compilano squadre, campi, calendario e anagrafiche.
* **ESEMPIO** — lo stesso modello con tutti i risultati, i campi e le designazioni compilati, utile per vedere il comportamento di classifiche, spareggi e tabellone.

## Struttura del file

| Foglio | Contenuto |
|---|---|
| `Campionato` | Parametri, elenco squadre, elenco campi, classifica per girone e matrici degli scontri diretti |
| `Calendario A` … | Una scheda per girone, con colore identificativo su linguetta e intestazioni |
| `Playoff` (`Playoff 32`/`16`/`8` nella versione 16 × 20) | Tabellone a eliminazione diretta, finale 3°-4° e finale 1°-2° posto |
| `Classifica` | Le classifiche di girone, in blocchi colorati |
| `Classifica Finale` (una per tabellone nella versione 16 × 20) | Ordine finale di tutte le squadre (colonne `C`-`E` unite per far spazio ai loghi) |
| `DESIGNAZIONI` | Tutte le gare con arbitri e ufficiali di campo |
| `Arbitri`, `UdC` | Anagrafiche con conteggio delle designazioni per ruolo |
| `MEMO` | Note operative del file |
| `REGOLAMENTO` | In fondo: le pagine del regolamento, solo per riferimento (due immagini) |
| `Calendario.ics` | Righe pronte per l'esportazione iCalendar |
| `Dati` | **Nascosto.** Consolida, una riga per gara di girone, le colonne di servizio di tutti i calendari |

### Colonne di servizio nascoste

Servono solo alle formule e non vanno compilate a mano. Quelle del foglio `Campionato` vanno però copiate insieme alle altre quando si allarga il modello.

Nel foglio `Campionato`:

| Contenuto | 10 × 10, 1 × 10 | 16 × 20, 4 × 20, 2 × 20 |
|---|---|---|
| Coefficiente di ordinamento: concatena punti, vittorie negli scontri diretti e i due quozienti in un'unica chiave testuale | `I` | `I` |
| Chiave `<girone>#<progressivo>`, per individuare le squadre dello stesso girone | `X` | `X` |
| Nomi delle avversarie di girone, una colonna per posizione | `Y`-`AH` | `Y`-`AR` |
| Vittorie negli scontri diretti in forma numerica: serve a contare quante squadre restano appaiate e quindi a decidere quali criteri di spareggio mostrare | `CF` | `ED` |

Nei fogli calendario e playoff:

| Colonna | Contenuto |
|---|---|
| `M`-`AB` | Scomposizione di ogni risultato (squadra, vinta, persa, forfait, punti fatti e subiti, vincente e perdente). Il foglio `Dati` le raccoglie tutte e le classifiche leggono da lì |
| `AC` | Etichetta del turno (`[Girone A]`, `[Ottavi]`, `[Playoff a 32 - Ottavi]`, `[Finale 1-2]` …), ricavata con formule e usata dal foglio `Calendario.ics` |

Solo nei fogli calendario, celle `M3`, `N3` e `O3` (etichette in riga 2): lettera del girone, sua posizione nell'elenco `D5` e nome per la stampa letto da `D11` (la lettera stessa se il nome manca). `A3` e le intestazioni di giornata leggono `O3`.

### Note pratiche

* I MODELLO e gli ESEMPIO delle versioni 4 × 20 e 2 × 20 sono distribuiti **senza valori in cache**; gli ESEMPIO 1 × 10, 10 × 10 e 16 × 20 contengono i valori già calcolati. In ogni caso Excel, LibreOffice Calc e Google Sheets ricalcolano tutto all'apertura: nella versione 16 × 20 (320 squadre, 3096 gare) il primo calcolo può richiedere alcuni secondi.
* I fogli operativi hanno area di stampa, righe di intestazione ripetute e adattamento in larghezza a una pagina. `Calendario.ics` stampa solo l'intestazione, perché serve al copia-incolla e non alla carta.
* Il nome squadra si scrive come `Nome-Città PR`: nei calendari e nel tabellone compare solo la parte prima del trattino. Se il trattino manca viene usato il nome per intero, quindi la convenzione è consigliata ma non obbligatoria.
* I codici campo `PO1`-`PO8` identificano i campi neutri della fase a eliminazione diretta; `TBD` è il segnaposto per un campo non ancora definito, evidenziato in verde.

Limitazioni:

* I quozienti canestri sono confrontati alla quarta cifra decimale nella chiave di ordinamento e mostrati alla terza: due squadre che si equivalgono oltre quella soglia vengono ordinate alfabeticamente.
* Gli scontri diretti sono calcolati solo fra squadre dello stesso girone; il modello non gestisce classifiche avulse fra gironi diversi.
* Le matrici degli scontri diretti sono dimensionate per **10 squadre per girone** nella versione 10 × 10 e per **20** nelle altre: superando quel numero in uno stesso girone, la squadra in più non compare fra le colonne di confronto. La classifica generale resta corretta, ma quel singolo scontro diretto non viene conteggiato negli spareggi. Come allargarle è spiegato più sotto.
* Cambiare la lettera in colonna E sposta la squadra di girone in tutte le classifiche, ma **non** riscrive il calendario né i colori: quelli restano a carico di chi compila.
* I formati numerici sono impostati come formato cella e non tramite la funzione `TEXT`, per evitare che il separatore decimale cambi il risultato passando fra versioni con lingue diverse.
* Alcune funzioni sono native di Google Sheets e vanno adattate per l'uso offline: in particolare `IMAGE()`, usata per i due loghi di intestazione, non esiste in *LibreOffice Calc* e nelle versioni di *Microsoft Excel* precedenti a 365 — in quel caso le celle dei loghi vanno lasciate vuote o sostituite con immagini inserite a mano.

## Ampliare il modello

Tutte le colonne citate qui sotto stanno nel foglio `Campionato`, a destra della tabella classifica. Le colonne di servizio della chiave di girone e delle avversarie sono nascoste (per vederle si selezionano le colonne ai lati e poi *Mostra*); le quattro matrici degli scontri diretti sono invece visibili, basta scorrere verso destra.

### Più squadre in un girone

Il confronto negli scontri diretti usa una colonna per ogni possibile avversaria di girone:

| Blocco | 10 × 10, 1 × 10: etichetta | 10 × 10, 1 × 10: dati | 16 × 20, 4 × 20, 2 × 20: etichetta | 16 × 20, 4 × 20, 2 × 20: dati |
|---|---|---|---|---|
| Avversarie del girone | `X` (chiave) | `Y`-`AH` | `X` (chiave) | `Y`-`AR` |
| Vittorie scontri diretti | `AJ` | `AK`-`AT` | `AT` | `AU`-`BN` |
| Sconfitte e forfait scontri diretti | `AV` | `AW`-`BF` | `BP` | `BQ`-`CJ` |
| Punti fatti scontri diretti | `BH` | `BI`-`BR` | `CL` | `CM`-`DF` |
| Punti subiti scontri diretti | `BT` | `BU`-`CD` | `DH` | `DI`-`EB` |

Fuori dai blocchi, ma legata a essi, c'è la colonna nascosta delle *Vittorie SD* (`CF` oppure `ED`), che somma il blocco delle vittorie negli scontri diretti: non va allargata, ma il suo intervallo va verificato dopo l'operazione.

Per aggiungere una squadra per girone, per ognuno dei cinque blocchi:

1. **Inserire** una colonna *dentro* il blocco, per esempio prima dell'ultima. Inserendola all'interno e non in coda, i riferimenti `SUM(...)` e `COUNT(...)` che leggono il blocco si allargano da soli.
2. Copiare in tutta la colonna nuova la formula della colonna a fianco, dalla riga 14 fino all'ultima riga della tabella squadre.
3. Nel blocco delle avversarie correggere il numero nella formula: ogni colonna cerca `$E14&"#1"`, `$E14&"#2"` e così via, quindi la nuova colonna deve avere il progressivo che le compete e l'ultima va rinumerata. Nei quattro blocchi delle matrici non c'è nulla da rinumerare: ogni cella punta già alla colonna corrispondente del blocco avversarie.
4. Aggiornare l'intestazione in riga 13 (`1^`, `2^`, ... ) per coerenza visiva.
5. Controllare che la colonna delle *Vittorie SD* sommi ancora tutto il blocco delle vittorie negli scontri diretti: se la colonna è stata inserita all'interno del blocco l'intervallo si è allargato da solo, altrimenti va corretto a mano.

Se invece si aggiunge la colonna **in coda** al blocco, vanno corretti a mano gli intervalli nelle formule che li sommano: colonna `I` (coefficiente di ordinamento), `U` (record scontri diretti), `V` (quoziente scontri diretti) e `W` (quoziente totale), tutte nella tabella classifica.

### Più squadre o più gironi

1. Inserire le righe necessarie **dentro** la tabella squadre (non dopo l'ultima), così gli intervalli si estendono da soli, e copiarvi le formule delle colonne `G`-`X`, dei blocchi delle matrici e della colonna delle *Vittorie SD*.
2. Verificare che gli intervalli della tabella squadre usati nelle formule degli altri fogli (per esempio `Campionato!$B$14:$H$…` nei calendari, `Campionato!$G$14:$W$…` in `Classifica` e `Classifica Finale`, `Campionato!$B$…:$D$…` dei campi) coprano tutte le righe: inserendo le righe *dentro* la tabella si estendono da soli.
3. Per un girone in più: duplicare un foglio `Calendario`, rinominarlo con la lettera nuova, assegnargli un colore, e aggiungere le sue righe in coda al foglio nascosto `Dati` con i riferimenti al nuovo foglio. Estendere poi l'intervallo `Dati!$A$2:$N$…` in tutte le formule che lo usano.
4. Aggiungere il blocco corrispondente nel foglio `Classifica`.
5. I tabelloni restano quelli predisposti: per cambiarli va rifatto il foglio playoff, dove gli accoppiamenti del primo turno sono scritti come codici posizione (`A1`, `B4`, ...) nelle colonne `C` ed `E`.

## Da fare

L'elenco delle cose da correggere a mano nei file delle stagioni passate e delle funzioni ancora da fare è in [`TODO.md`](TODO.md).

## Licenza

Il progetto è aperto: si può usare, copiare, modificare e ridistribuire, anche a scopo commerciale, **a condizione di citare l'autore**.

* **Codice** (`Generatore_Campionato_Baskin.html`, script e workflow): licenza [MIT](LICENSE).
* **Modelli Excel e testi** (`Campionato_Baskin_*.xlsx`, `README.md`, `TODO.md`): licenza [Creative Commons Attribuzione 4.0 (CC BY 4.0)](LICENSE-CC-BY-4.0.md).
* Citazione suggerita: *Basato su "Generatore Campionato Baskin" di Daniele Lolli (UncleDan), https://github.com/UncleDan/classifica-basket-baskin-excel* (vedi anche [`CITATION.cff`](CITATION.cff)).
* I file prodotti con i propri dati appartengono a chi li crea; la riga di citazione nel foglio `MEMO` è gradita ma si può togliere.

## Marchi e loghi

* Generatore e modelli **non contengono loghi**: le immagini compaiono solo se si scrive un link in `Campionato!D3` e `D4`.
* Nomi e loghi **Baskin** ed **EISI** (Ente Italiano Sport Inclusivi), come quelli di società, enti, federazioni e sponsor, appartengono ai rispettivi titolari e **non sono coperti dalle licenze del progetto**: vanno usati solo se se ne ha il diritto o l'autorizzazione (per Baskin ed EISI, secondo le indicazioni di EISI) e nel rispetto delle loro linee guida grafiche.
* I loghi sono **collegati e non incorporati (hotlink)**: Excel o Google Sheets scaricano l'immagine dal sito che la ospita a ogni apertura del file. Quel sito può quindi registrare gli accessi, e se l'immagine viene spostata, cambiata o protetta il logo sparisce o cambia. Meglio usare link a immagini pubblicate dal titolare o con il suo consenso, su un sito stabile.
* Questo è un progetto personale, **non un prodotto ufficiale di EISI** né di altri enti; il riferimento a Baskin ed EISI serve solo a indicare la disciplina e l'ente per cui i modelli sono pensati.

Adattamento al **Basket**/**Baskin** di:

## Daniele Lolli (aka UncleDan)

Per segnalazioni o richieste di implementazione (tempo permettendo):

[https://github.com/UncleDan/classifica-basket-baskin-excel/issues](https://github.com/UncleDan/classifica-basket-baskin-excel/issues)
