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

* **Gironi**: un girone per riga nel formato `nome, squadre, colore` (separatore virgola, punto e virgola o tabulazione). Il nome è quello per la stampa (cella `D11`); le lettere A, B, C… sono assegnate in ordine, fino a 26 gironi. Ogni girone può avere un numero diverso di squadre, da 3 a 40: con un numero dispari in ogni giornata una squadra riposa. Il colore può essere un nome HTML (`green`, `red`, `navy`, `teal`…), un codice `#RRGGBB`, oppure `gold`, `silver`, `bronze`, `platinum`; dal colore vengono ricavate la tinta scura (barre e linguette) e quella chiara (righe).
* **Parametri**: solo i valori, uno per riga, nello stesso ordine delle celle `D2`-`D11` del foglio `Campionato` (Campionato, Link Logo 1, Link Logo 2, Gironi, Stagione, Punti vittoria, Punti sconfitta, Punti forfait, Punteggio forfait, Nomi gironi per la stampa), così si possono copiare e incollare da Excel. Le righe 4 e 10 sono comunque ricavate dall'elenco dei gironi.
* **Playoff**: numero di squadre (0 = nessun playoff, 2, 4, 8, 16, 32, 64), qualificate per girone e gironi interessati (es. `A,B` oppure `A-D`; vuoto = tutti). Teste di serie per posizione e poi per lettera del girone; al primo turno la prima incontra l'ultima, la seconda la penultima e così via (con un solo girone 1-8, 2-7, 3-6, 4-5).
* **Importa da un file esistente** (facoltativo): si sceglie un xlsx e la pagina riconosce da sola il tipo, compila le caselle (gironi con numero di squadre e colore, parametri, playoff, anagrafiche) e, con "Genera xlsx", riporta nel nuovo modello squadre e penalizzazioni, campi, calendario (squadre, data e ora, campo), risultati, tabellone dei playoff con i suoi accoppiamenti, designazioni e anagrafiche. Tipi riconosciuti:
  * **Modello classico**: il modello a 10 gironi con i nomi definiti (`Calendario A`-`J`);
  * **Emilia-Romagna classico**: il file con un unico foglio `Calendario` e gironi Ovest (O) ed Est (E);
  * **Emilia-Romagna Ovest-Est**: la versione con il foglio `Calendario O-E` e la `Coppa Primavera`;
  * **Nuovo modello**: tutte le versioni di questo repository e i file prodotti dal generatore.

  I gironi del file di origine diventano A, B, C… nell'ordine in cui compaiono e i codici squadra diventano `A01`, `A02`…; i campi che non appartengono a una squadra vanno sui campi neutri `PO1`-`PO8`. Del playoff si importano il primo tabellone (per esempio `Playoff 32` nella versione 16 × 20) e, se c'è, la seconda griglia come Torneo Primavera (la `Coppa Primavera` della versione Ovest-Est, o le gare del Torneo Primavera nel foglio `Playoff` dell'Emilia-Romagna classico), con i loro accoppiamenti. Prima di generare si possono ancora cambiare gironi, squadre, colori e playoff: i dati che non trovano posto nel nuovo modello vengono scartati e contati nel riepilogo.
* **Torneo Primavera** (facoltativo): una seconda griglia di playoff, su un foglio a parte, per le squadre non qualificate al tabellone principale. Prende le posizioni successive negli stessi gironi del playoff (per esempio playoff con le prime 4 di ogni girone, Primavera con le classificate dalla 5a all'8a) con le stesse regole di teste di serie; le gare sono numerate di seguito a quelle del playoff, compaiono in `DESIGNAZIONI` e `Calendario.ics`, e in `Classifica Finale` occupano le posizioni subito dopo il tabellone principale.
* **Squadre e Campi** (facoltativi): due caselle in cui scrivere o incollare l'elenco delle squadre (`codice, nome, penalizzazione, girone`, come le colonne B-E del foglio `Campionato`) e dei campi (`codice, nome campo, link mappa`, come le colonne B-D del blocco CAMPI). Si incollano direttamente da Excel (colonne separate da tabulazione) oppure come righe CSV separate da `,` o `;` (i testi con separatori dentro vanno tra virgolette; per i campi il nome può contenere virgole se il link è l'ultimo valore). Una squadra con un codice che non esiste nel nuovo modello va nel primo posto libero del suo girone. Importando un xlsx le due caselle si riempiono da sole e si possono correggere prima di generare.
* **Anagrafiche**: righe dei fogli `Arbitri` e `UdC`. Se il numero non viene indicato il foglio non viene creato e in `DESIGNAZIONI` i nomi si scrivono a mano, senza elenco a discesa.
* Il file prodotto si chiama `Campionato_Baskin_<gironi>x<squadre>_MODELLO.xlsx` (oppure `Campionato_Baskin_<gironi>gironi_<squadre>squadre_MODELLO.xlsx` se i gironi hanno dimensioni diverse) e ha la stessa struttura delle versioni qui sopra: fogli, formule, colori, convalide, formattazione condizionale, solo intervalli di celle. Il generatore parte dalla versione 1 × 10, contenuta nella pagina stessa; il file si calcola alla prima apertura in Excel, LibreOffice o Google Sheets.

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

Addattamento al **Basket**/**Baskin** di:
## Daniele Lolli (aka UncleDan)

Per segnalazioni o richieste di implementazione (tempo permettendo):

[https://github.com/UncleDan/classifica-basket-baskin-excel/issues](https://github.com/UncleDan/classifica-basket-baskin-excel/issues)
