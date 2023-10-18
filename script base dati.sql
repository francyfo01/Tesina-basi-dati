----------------------------------------------------------Creazione tabelle Entità----------------------------------------------------------

CREATE TABLE dipendente(
	matricola		int,
	nome			varchar(40) NOT NULL,
	cognome		varchar(40)	NOT NULL,
	data_assunzione	date 		NOT NULL,
	cod_fiscale		varchar(20)	NOT NULL,
	constraint		dipendente_pk	PRIMARY KEY(matricola)
);

CREATE TABLE progetto(
	codprogetto		int,
	titolo		varchar(40)	NOT NULL,
	descrizione		varchar(100),
	materiale		varchar(40) NOT NULL,
	data_richiesta	date		NOT NULL,
	scadenza		date		NOT NULL,
	budget		int		NOT NULL,
	committente 	int		NOT NULL,
	constraint		progetto_pk	PRIMARY KEY(codprogetto)
);


CREATE TABLE committente(
	codcommittente	int,
	ragione_sociale	varchar(40) 	NULL,
	p_iva			varchar(12)		default 0,
	cod_fiscale		varchar(17)		default 0,
	nome			varchar(40)		NOT NULL,
	cognome		varchar(40)		NOT NULL,
	indirizzo		varchar(40)		NOT NULL,
	città			varchar(40)		NOT NULL,
	email			varchar(40)		NULL,
	cellulare		int			NOT NULL,
	constraint		committente_pk	PRIMARY KEY(codcommittente)
);


CREATE TABLE versione(
	codversione			int,
	num_componenti		int	NOT NULL,
	progetto			int	NOT NULL,
	stampante			int,
	constraint		versione_pk	PRIMARY KEY(codversione)
);

CREATE TABLE file_3d(
	file_3d	varchar(40),
	versione	int,
	constraint	file_3d_pk	PRIMARY KEY(file_3d, versione)
);


CREATE TABLE file_di_stampa(
	file_di_stampa	varchar(40),
	durata_stimata	varchar(20)		NOT NULL,
	versione		int,
	constraint	file_stamp_pk	PRIMARY KEY(versione, file_di_stampa)
);

CREATE TABLE stampante(
	codstampante	int,
	data_acquisto	date			NOT NULL,
	produttore		varchar(40)		NOT NULL,
	indirizzo_IP	character(16)	NOT NULL,
	modello		varchar(40)		NOT NULL,                                                      
	ctrl_pla		int			default 0,
	ctrl_petg		int			default 0,
	ctrl_abs		int			default 0,
	ctrl_tpu		int			default 0,
	constraint		stampante_pk	PRIMARY KEY(codstampante)
);

CREATE TABLE oggetto(
	codoggetto		int,
	impiego		varchar(40)		NULL,
	peso			int			default 0,
	dimensioni		varchar(40)		NULL,                                               
	costo			int			NOT NULL,
	inizio_stampa	date,
	fine_stampa 	date,
	stato_avanzamento	varchar(5)		NULL,
	stampante		int   		UNIQUE,
	constraint		oggetto_pk		PRIMARY KEY(codoggetto)
);


----------------------------------------------------------Creazione tabelle Associazioni----------------------------------------------------------


CREATE TABLE realizzazione(
	sviluppatore	int,
	progetto		int,
	data_inizio		date	NULL,
	data_fine		date	NULL,
	constraint	realizzazione_pk	PRIMARY KEY(sviluppatore, progetto)
);


CREATE TABLE gestione(
	versione	int,
	tecnico	int,
	stampante	int		UNIQUE,
	constraint	gestione_pk	PRIMARY KEY(tecnico, stampante)
);


----------------------------------------------------------Creazione chiavi Esterne----------------------------------------------------------

ALTER TABLE progetto ADD constraint forkey_progetto_committente
	foreign key(committente) references committente(codcommittente) on delete cascade;

ALTER TABLE realizzazione ADD constraint fk_realiz_dip                     
	foreign key(sviluppatore) references dipendente(matricola) on delete cascade;

ALTER TABLE realizzazione ADD constraint forkey_realizzazione_progetto
	foreign key(progetto) references progetto(codprogetto) on delete cascade;

ALTER TABLE versione ADD constraint forkey_versione_progetto
	foreign key(progetto) references progetto(codprogetto) on delete cascade;

ALTER TABLE gestione ADD constraint forkey_gestione_versioni
	foreign key(versione) references versione(codversione) on delete cascade;

ALTER TABLE gestione ADD constraint forkey_gestione_dipendenti
	foreign key(tecnico) references dipendente(matricola) on delete cascade;

ALTER TABLE gestione ADD constraint forkey_gestione_stampanti
	foreign key(stampante) references stampante(codstampante) on delete cascade;

ALTER TABLE oggetto ADD constraint forkey_oggetto_stampanti
	foreign key(stampante) references stampante(codstampante) on delete cascade;

ALTER TABLE file_3d ADD constraint forkey_file_3d_versione
	foreign key(versione) references versione(codversione) on delete cascade;

ALTER TABLE file_di_stampa ADD constraint forkey_file_di_stampa_versione
	foreign key(versione) references versione(codversione) on delete cascade;


----------------------------------------------------------Sequenze----------------------------------------------------------

CREATE SEQUENCE seq_committente 
			INCREMENT BY 10
			START WITH 1000
			MAXVALUE 2000
			NOCACHE
			NOCYCLE;

CREATE SEQUENCE seq_progetto
			INCREMENT BY 10 
			START WITH 2000
			MAXVALUE 3000
			NOCACHE
			NOCYCLE;

CREATE SEQUENCE seq_versione
			INCREMENT BY 10
			START WITH 3000
			MAXVALUE 10000
			NOCACHE
			NOCYCLE;

CREATE SEQUENCE seq_stampante
			INCREMENT BY 10
			START WITH 11000
			MAXVALUE 12000
			NOCACHE
			NOCYCLE;

CREATE SEQUENCE seq_oggetto
			INCREMENT BY 10 
			START WITH 12000
			MAXVALUE 20000
			NOCACHE
			NOCYCLE;


----------------------------------------------------------Procedure----------------------------------------------------------

set serverout on;
LEGGERE L'ALTRO FILE

----------------------------------------------------------Viste----------------------------------------------------------

LEGGERE L'ALTRO FILE

----------------------------------------------------------Trigger----------------------------------------------------------

CREATE TRIGGER max_committenti
AFTER INSERT ON committente
DECLARE
	count_committenti NUMBER;
	overflow_num_committenti EXCEPTION;
BEGIN
	SELECT COUNT (*) INTO count_committenti
	FROM committente;
	IF(count_committenti > 100)
		THEN RAISE overflow_num_committenti;
	END IF;
	--inserimento corretto--
	DBMS_OUTPUT.PUT_LINE('Inserimento corretto');
	EXCEPTION WHEN overflow_num_committenti
		THEN DBMS_OUTPUT.PUT_LINE('Inserimento rifiutato: non si possono inserire più di 100 committenti');
		raise_application_error(-20510,'Limite inserimento committenti raggiunto.');
END;

	
(trigger di controllo che verifica se i committenti siano massimo 100)


----------------------------------------------------------Script di debug----------------------------------------------------------
ALTER TABLE versione		DROP CONSTRAINT	forkey_versione_progetto;
ALTER TABLE progetto		DROP CONSTRAINT 	forkey_progetto_committente;
ALTER TABLE oggetto		DROP CONSTRAINT	forkey_oggetto_stampanti;
ALTER TABLE realizzazione	DROP CONSTRAINT	fk_realiz_dip;  
ALTER TABLE realizzazione	DROP CONSTRAINT	forkey_realizzazione_progetto;
ALTER TABLE gestione		DROP CONSTRAINT	forkey_gestione_versioni;
ALTER TABLE gestione		DROP CONSTRAINT	forkey_gestione_dipendenti;
ALTER TABLE gestione		DROP CONSTRAINT	forkey_gestione_stampanti;
ALTER TABLE file_3d		DROP CONSTRAINT	forkey_file_3d_versione;
ALTER TABLE file_di_stampa	DROP CONSTRAINT	forkey_file_di_stampa_versione;
DROP TABLE	committente;
DROP TABLE	progetto;
DROP TABLE	versione;
DROP TABLE	oggetto;
DROP TABLE	stampante;
DROP TABLE	dipendente;
DROP TABLE	realizzazione;
DROP TABLE	gestione;
DROP TABLE	file_3d;
DROP TABLE	file_di_stampa;
DROP VIEW	dipendenti_sviluppatori;
DROP VIEW	dipendenti_tecnici;
DROP VIEW	committenti_privati;
DROP VIEW	committenti_pubblici;
DROP VIEW   exp_req;
DROP VIEW	count_version;
DROP VIEW	version_printed;
DROP VIEW	dev_project;
DROP VIEW	tec_print;
DROP VIEW	data_control;
DROP VIEW	data_control_diff;
DROP VIEW   time_to_stamp;
DROP SEQUENCE	seq_committente;
DROP SEQUENCE	seq_versione;
DROP SEQUENCE	seq_progetto;
DROP SEQUENCE	seq_oggetto;
DROP SEQUENCE	seq_stampante;
DROP PROCEDURE    insert_committente;
DROP PROCEDURE	insert_dipendente;
DROP PROCEDURE	insert_file_3d;
DROP PROCEDURE	insert_file_di_stampa;
DROP PROCEDURE	insert_gestione;
DROP PROCEDURE	insert_oggetto;
DROP PROCEDURE	insert_progetto;
DROP PROCEDURE	insert_realizzazione;
DROP PROCEDURE	insert_stampante;
DROP PROCEDURE	insert_versione;
DROP PROCEDURE	insert_init_val;

