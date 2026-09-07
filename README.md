# Classifica Baskin Excel — 64 squadre, 8 gironi

Lavoro ispirato da *Europei di Calcio 2016 con Excel* di Alexsandra "Euro_2016.rar" ([http://www.wintricks.it/forum/showthread.php?t=165174](http://www.wintricks.it/forum/showthread.php?t=165174))

Caratteristiche:

* Struttura fino a **64 squadre** distribuite su un massimo di **8 gironi** (A-H) da 8 squadre ciascuno, in blocchi di righe fissi (girone A = righe 12-19, B = 20-27, ... H = 68-75); usando meno squadre o meno gironi basta lasciare vuote le righe non utilizzate e classifiche e calendari si adeguano da soli.
* Un **foglio calendario per girone** (`Calendario A` ... `Calendario H`), ciascuno con un colore identificativo riportato su linguetta, intestazioni di giornata e righe di classifica. Calendario di sola andata: 7 giornate da 4 gare, 28 gare per girone, 224 in totale.
* Classifica secondo i criteri del regolamento **Baskin** per gironi "round robin": **3 punti classifica per ciascuna partita vinta**, **1 punto classifica per ciascuna partita persa** e **0 punti classifica per le partite perse per forfait** (identificate dal risultato 40-0 o 0-40, valore comunque parametrico); risoluzione delle parità, nell'ordine, con i criteri *Maggior numero di vittorie nelle gare tra di loro*, *Più alto quoziente canestri nelle gare tra di loro*, *Più alto quoziente canestri in tutte le gare del girone*. Come criterio residuo, per garantire sempre un ordinamento univoco, l'ordine alfabetico.
* Eventuali **punti di penalizzazione** per squadra, sottratti automaticamente in classifica.
* **Playoff** a 16 squadre con incroci 1A-2H, 1B-2G, 1C-2F, 1D-2E, 1E-2D, 1F-2C, 1G-2B, 1H-2A: ottavi, quarti, semifinali, finale 3°-4° e finale 1°-2° posto. Gli accoppiamenti dei turni successivi si aggiornano da soli inserendo i risultati del turno precedente. Fase a eliminazione diretta su campi neutri, non appartenenti ad alcuna squadra.
* **Classifica finale** dalla 1ª alla 64ª posizione, costruita a partire dall'esito dei playoff e dalle classifiche di girone.
* Foglio **DESIGNAZIONI** con arbitri e ufficiali di campo per ogni gara: elenchi a discesa alimentati dalle anagrafiche, e formattazione condizionale che evidenzia la stessa persona designata due volte nella stessa gara. Convalide e controllo attivi su *tutte* le righe predisposte, gare di playoff comprese.
* Fogli **Arbitri** e **UdC** con conteggio automatico delle designazioni per ruolo e scala colore sul carico di lavoro.
* Esportazione **iCalendar (.ics)** di tutte le gare, con girone o turno di playoff nel titolo dell'evento.
* Parametri di campionato centralizzati in un unico punto: nome, loghi, stagione, punti vittoria/sconfitta/forfait e punteggio di forfait.
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
* La composizione dei gironi è legata al blocco di righe: spostare una squadra da un girone all'altro significa spostarne la riga, non cambiare la lettera in colonna E.
* I formati numerici sono impostati come formato cella e non tramite la funzione `TEXT`, per evitare che il separatore decimale cambi il risultato passando fra versioni con lingue diverse.
* Alcune funzioni sono native di Google Sheets e vanno adattate per l'uso offline: in particolare `IMAGE()`, usata per i due loghi di intestazione, non esiste in *LibreOffice Calc* e nelle versioni di *Microsoft Excel* precedenti a 365 — in quel caso le celle dei loghi vanno lasciate vuote o sostituite con immagini inserite a mano.

Addattamento al **Basket**/**Baskin** di:
## Daniele Lolli (aka UncleDan)

Per segnalazioni o richieste di implementazione (tempo permettendo):

[https://github.com/UncleDan/classifica-basket-baskin-excel/issues](https://github.com/UncleDan/classifica-basket-baskin-excel/issues)
