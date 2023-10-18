-----------------------------------------------------------------------------------OP1-----------------------------------------------------------------------------------

CREATE VIEW exp_req(titolo,materiale,data_richiesta,nome_com,cognome_com,email_com)
AS 	SELECT P.titolo, P.materiale, P.data_richiesta, C.nome, C.cognome, C.email
	FROM progetto P JOIN committente C ON P.committente = C.codcommittente
    	WHERE sysdate < P.scadenza AND sysdate > P.data_richiesta;

--(stampa nella view i dati utili per i progetti che sono attivi, ovvero che risultano in questo momento tra la data di arrivo e quella di scadenza, in altre parole non mostra assolutamente alcuna informazione per i progetti scaduti)

-----------------------------------------------------------------------------------OP2-----------------------------------------------------------------------------------

CREATE VIEW count_version(titolo, num_versioni)
AS	SELECT P.titolo, COUNT(V.codversione)
    	FROM progetto P JOIN versione V ON P.codprogetto = V.progetto
    	GROUP BY P.titolo;

--(determina quante versioni ha ogni progetto come da direttiva)

-----------------------------------------------------------------------------------OP3-----------------------------------------------------------------------------------

CREATE VIEW version_printed(modello,indirizzo_IP,versioni_stampate,titolo_progetto) 	
AS	SELECT S.modello, S.indirizzo_IP, V.codversione, P.titolo
	FROM (versione V JOIN stampante S ON V.stampante = S.codstampante) 
            JOIN progetto P ON V.progetto = P.codprogetto;

--(come da direttiva mostra la stampante il titolo e la versione stampata)

-----------------------------------------------------------------------------------OP4-----------------------------------------------------------------------------------

CREATE VIEW dev_project(nome,cognome,cod_fiscale,titolo,budget,fine_sviluppo)
AS	SELECT D.nome, D.cognome, D.cod_fiscale, P.titolo, TO_CHAR(P.budget,'$999999.99'), R.data_fine
	FROM (realizzazione R JOIN progetto P ON R.progetto = P.codprogetto)
		JOIN dipendente D ON R.sviluppatore = D.matricola;

--(mostra i progetti a cui ogni sviluppatore ha lavorato e anche se quest'ultimo è terminato, eventualmente da sistemare con ulteriori insert)

-----------------------------------------------------------------------------------OP6-----------------------------------------------------------------------------------

CREATE VIEW tec_print(nome,cognome,cod_fiscale,modello,produttore)
AS	SELECT D.nome, D.cognome, cod_fiscale, S.modello, S.produttore
	FROM (gestione G JOIN stampante S ON G.stampante = S.codstampante) 
		JOIN dipendente D ON G.tecnico = D.matricola;

--(mostra le informazioni necessarie per quanto riguarda le interazioni dei tecnici con le stampanti)

-----------------------------------------------------------------------------------OP7-----------------------------------------------------------------------------------

CREATE VIEW data_control(titolo,arrivo_richiesta,inizio_sviluppo,fine_sviluppo)
AS	SELECT P.titolo, P.data_richiesta, R.data_inizio, R.data_fine
	FROM	progetto P JOIN realizzazione R ON P.codprogetto = R.progetto;

CREATE VIEW data_control_diff(titolo,tempo_in_attesa,tempo_in_sviluppo)
AS  SELECT DC.titolo, 24 * (DC.inizio_sviluppo - DC.arrivo_richiesta) diff_hours, 
		24 * (DC.fine_sviluppo - DC.inizio_sviluppo) diff_hours
	FROM data_control DC;

CREATE VIEW data_control(titolo,arrivo_richiesta,inizio_sviluppo,fine_sviluppo,tempo_in_attesa,tempo_in_sviluppo)
AS	SELECT P.titolo, P.data_richiesta, R.data_inizio, R.data_fine, 
		24 * (R.data_inizio - P.data_richiesta) diff_hours, 
		24 * (R.data_fine - R.data_inizio) diff_hours
	FROM	progetto P JOIN realizzazione R ON P.codprogetto = R.progetto;

--(le prime due view fanno la stessa cosa della terza ma sono divise, questa view mostra tutto cio che ci puo servire riguardo il tempo di attesa e sviluppo)

-----------------------------------------------------------------------------------OP8-----------------------------------------------------------------------------------

CREATE VIEW time_to_stamp(stampa_stimata,tempo_in_stampa,dimensioni,costo,modello,IP_stampante,file_stampato)
AS	SELECT fds.durata_stimata, 24 * (O.fine_stampa - O.inizio_stampa) diff_hours,
		O.dimensioni, O.costo, S.modello, S.indirizzo_IP, fds.file_di_stampa 
	FROM ((oggetto O JOIN stampante S ON O.stampante = S.codstampante) 
		JOIN gestione G ON O.stampante = G.stampante)
		JOIN file_di_stampa fds ON fds.versione = G.versione;

--(mi viene mostrato il cofronto tra la stampa stimata e quella reale con relativo file stampato e i dati della stampante)

-------------------------------------------------------AltreWiew------------------------------------------------------------------------------
CREATE VIEW dipendenti_sviluppatori AS
SELECT matricola, nome, cognome
FROM dipendente WHERE matricola LIKE '55%'
ORDER BY matricola;

CREATE VIEW dipendenti_tecnici AS
SELECT matricola, nome, cognome 
FROM dipendente WHERE matricola LIKE '32%'
ORDER BY matricola;

CREATE VIEW committenti_pubblici AS
SELECT codcommittente, nome, cognome, indirizzo, città, email, cellulare, ragione_sociale, p_iva
FROM committente WHERE cod_fiscale is NULL
ORDER BY nome;

CREATE VIEW committenti_privati AS
SELECT codcommittente, nome, cognome, indirizzo, città, email, cellulare, ragione_sociale, cod_fiscale
FROM committente WHERE p_iva is NULL
ORDER BY nome;



--(Queste view individuano rispettivamente i dipendenti con l'incarico di sviluppatori e quelli con l'incarico di tecnici; nonchè i committenti publici e quelli privati)