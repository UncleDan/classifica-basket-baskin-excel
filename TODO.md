# TODO

Elenco delle cose da correggere a mano nei file delle stagioni passate prima di importarli nel generatore, e delle funzioni del generatore ancora da fare. Stato verificato con il generatore Release 1.14 (aggiornato alla 1.21) sui file 2023/2024, 2024/2025 e 2025/2026.

## 1. Da correggere a mano nei file di origine (prima di importare)

Il generatore segnala questi casi in rosso sotto il riepilogo dell'importazione. Vanno corretti nel file xlsx di origine, poi si reimporta (pulsante **Rileggi**).

### Stagione 2025/2026

- [ ] **EMILIA-ROMAGNA**: 61 designazioni senza i fogli Arbitri e UdC. Indicare il numero di arbitri e Ufficiali di Campo nel generatore (o aggiungere i due fogli al file), altrimenti le designazioni vanno perse.
- [ ] **LAZIO - Girone Unico**: tutte le 12 gare hanno le squadre scritte per nome invece che col codice. Inserire i codici squadra (colonne C ed E del calendario).
- [ ] **PIEMONTE/VALLE D'AOSTA - Girone ROSSO**: 6 gare della seconda fase con squadre scritte per nome e non presenti nell'elenco (Concentrici Novara, Baskin Avigliana, Rainbow Asti). Vedi anche il punto 3.2 sulla seconda fase.
- [ ] **UMBRIA - Girone Unico**: gara 3 con le squadre scritte per nome invece che col codice.

### Stagione 2024/2025

- [ ] **EMILIA-ROMAGNA**: gara 31 con il risultato (99-29) ma senza codici squadra: la formula del campo è finita al posto della squadra. Ripristinare i codici.
- [ ] **EMILIA-ROMAGNA**: 42 designazioni senza i fogli Arbitri e UdC (come sopra).
- [ ] **PUGLIA - Girone Unico**: tutte le 20 gare hanno le squadre scritte con nomi abbreviati ("Andria", "Trani"…). Inserire i codici squadra.

### Stagione 2023/2024

- [ ] **CAMPANIA**: il calendario ha una colonna in più (data in H, risultato in K-M invece che in J-L). Riportare le colonne nella posizione del modello, altrimenti nessuna gara viene letta.
- [ ] **LOMBARDIA NORD - Girone 1** (20 gare), **Girone 2** (21 gare) e **Promozione** (4 gare): squadre scritte per nome in maiuscolo invece che col codice. Inserire i codici.
- [ ] **TOSCANA**: 5 gare con le squadre scritte per nome; nella gara 3 i codici 7 e 8 non esistono nell'elenco di 6 squadre. Inserire i codici corretti.
- [ ] **PIEMONTE-LIGURIA-VALLE D'AOSTA - Girone D**: gara PIE061 con la data scritta come testo ("16 Mar 0224", anno sbagliato). Scrivere una data vera.

### Playoff importati solo in parte (Release 1.18)

Dalla Release 1.18 i tabelloni con schemi diversi dal modello si importano per livelli (tutto, solo squadre e risultati, griglia vuota, tabellone standard). Restano da completare a mano nel nuovo file:

- [ ] **PIEMONTE/VALLE D'AOSTA - Girone ROSSO 2025/2026**: gara 95 con una squadra non presente nell'elenco (Concentrici Novara).
- [ ] **VENETO Girone Est 2024/2025**: tabellone con squadre di altri gironi e dati incoerenti (la stessa squadra gioca tutte le gare): 2 gare da compilare a mano.
- [ ] **FVG Girone A 2023/2024 e Girone 1 seconda fase**: semifinali con squadre di altri gironi, da compilare a mano.
- [ ] **PUGLIA - Girone A & Playoff 2023/2024**: verificare le squadre del girone B riconosciute dal nome.
- [x] **Andata e ritorno nel playoff** (Lombardia Sud): dalla Release 1.19 per ogni sfida il totale delle due gare e la squadra che passa (differenza canestri; in parità si indica a mano).

### File da non importare

- [ ] Modelli vuoti, senza squadre: Lazio "SECONDA" (2025/2026), Sicilia e FVG Girone B seconda fase (2024/2025), "Modello Campionato Baskin 20 Squadre (senza dati esempio)" (2023/2024).
- [ ] **FVG - Girone A Seconda Fase 2024/2025**: bozza vecchia del girone PRIME (stesse squadre, 1 solo risultato). Usare il file PRIME.

## 2. Da verificare

Squadre riconosciute in automatico come **fuori classifica** (risultati in calendario ma 0 gare nella classifica di origine). Se una squadra non è davvero fuori classifica, toglierla dalla casella **Fuori classifica** del generatore.

- [ ] Lombardia Sud 2024/2025 e 2025/2026: Piacebaskin Lupa (corretto).
- [ ] Toscana 2024/2025: Asd Costone Siena.
- [ ] Lombardia Sud 2023/2024: Sanse Gialla (SAS).
- [ ] Piemonte/Valle d'Aosta Girone Rosso 2025/2026: Oltre il Punteggio Gattico, Oleggio Baskin Red, Azzurra Warriors, Baskin Ciuff Briga, Basking Team Gattico, SBK Aosta (giocano solo nella seconda fase: vedi 3.2).

## 3. Ancora da fare nel generatore

- [ ] **3.1 Più gironi nello stesso file senza colonna girone**: Marche 2024/2025 (2 gironi da 4) e Piemonte seconda fase 2023/2024 (4 gironi da 4-3-3-3). Oggi diventano un girone unico con una sola classifica. Proposta: separarli in automatico in base a chi gioca contro chi, oppure far scegliere il girone di ogni squadra.
- [ ] **3.2 Fasi**: seconda fase nello stesso file (foglio "Calendario SECONDA FASE" del Piemonte Rosso 2025/2026, oggi sommata al girone) o in file separati (FVG 2023/2024 e 2024/2025, Veneto 2023/2024). Serve il concetto di fase, che distingua prima e seconda fase in classifiche e riepilogo.
- [ ] **3.3 Final Four tra più file** (Veneto Ovest 2024/2025): il foglio "Final Four" non viene riconosciuto, le squadre sono scritte a mano e vengono anche dal file Veneto Est. I dati di origine sono incoerenti: in finale 1°-2° c'è una squadra che ha perso la semifinale.
- [ ] **3.4 Nome del girone**: oggi viene preso dalla cella del girone, spesso generica ("UNICO", "A", "DOPPIO", "ANDATA / RITORNO", "EST" nel Veneto seconda fase A). Proposta: ricavarlo dal nome del file (Gold Est, Girone B…).
- [x] **3.5 Note scritte nella riga del campo** (Marche 2025/2026, es. "gara rinviata al 13-11-25 a Pesaro"): portarle nel foglio Note invece di perderle. Fatto nella Release 1.15.
- [x] **3.6 Modelli vuoti**: messaggio chiaro ("file senza squadre, niente da importare") invece dell'errore generico. Fatto nella Release 1.15: un modello vuoto insieme ad altri file viene saltato.
- [ ] **3.7 Torneo di Tortona** (2024/2025): formato diverso (foglio "Tournament", due tornei "Veterans - Games" e "Newbies - Games" con gironi). Decidere se supportarlo.
- [ ] **3.8 Lombardia Nord 2026/2027**: tutte le tabelle del foglio Campionato sono spostate di una colonna a destra; oggi non si importa. In più il file ha calendari incompleti per i gironi da 12 squadre, numerazione delle gare sovrapposta, riferimenti a fogli cancellati e il playoff del modello a 10 gironi.
- [x] **3.9 Andata e ritorno per i campionati nuovi**: con l'importazione le giornate (compreso il ritorno) si copiano dal file di origine; per un campionato creato da zero il generatore fa solo il girone di sola andata. Fatto nella Release 1.15: casella "Andata e ritorno", non spuntata di default.
- [ ] **3.10 Gare con una sola squadra**: oggi non contano per nessuno (Piemonte Rosso 2025/2026, Toscana 2023/2024). Da confermare.
- [x] **3.11 Fuori classifica**: casella dedicata nel generatore (una squadra per riga), S in colonna FC del foglio Campionato, squadre in fondo alla classifica in ordine alfabetico, in giallo e con i valori a "-"; nel RIEPILOGO colonne Esiti Speciali e FC (A, B, AB). Fatto nella Release 1.17.
- [x] **3.12 Import dei playoff con schemi particolari** (3N, +37/-45, codici squadra, nomi, andata e ritorno, gare nel calendario): fatto nella Release 1.18.
- [x] **3.13 Playoff con andata e ritorno** (differenza canestri, parità decisa a mano, finali in gara unica): fatto nella Release 1.19.
- [x] **3.14 Classifiche raggruppate** come i calendari (default tutte in un foglio, vuoto = una per girone accanto al calendario): fatto nella Release 1.20.

## 4. Altro

- [ ] **File 16 × 20 del repository**: il turno a 32 squadre è chiamato "Trentaduesimi" invece di "Sedicesimi" (il generatore usa già i nomi corretti).
- [ ] **File xlsx del repository** (1×10, 2×20, 4×20, 10×10, 16×20): non hanno ancora le novità del generatore (risultati per codice squadra, foglio RIEPILOGO, sigle dei gironi fino a 3 lettere, squadre fuori classifica, sconfitta a tavolino disattivabile, playoff con BYE). Si possono rigenerare dal generatore o aggiornare a parte.
