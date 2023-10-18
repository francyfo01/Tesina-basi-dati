Procedure

-------------------------------------------------------------------------------

create or replace PROCEDURE insert_committente IS
	CURSOR cursore IS SELECT * FROM committente;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO committente VALUES(seq_committente.NEXTVAL,'privato','','CHSRCM84H58Z129M','Ralula_Manuela','Chris','Trav_pironti_7','Pompei','ralluk-manuella84@libero.it','3457261128');             
	INSERT INTO committente VALUES(seq_committente.NEXTVAL,'BioTech_inc','IT193846737','','D_Agostino','D_Aniello','Via_crapolla_186','Pompei','agodaniello89@gmail.com','3384116580');            
	INSERT INTO committente VALUES(seq_committente.NEXTVAL,'Geam_sas','IT432209932','','Sabato','Fontana','Via_giovanni_della_rocca_216','Boscoreale','sabafont@gmail.com','3925241122');               
	INSERT INTO committente VALUES(seq_committente.NEXTVAL,'privato','','SSSFTN66T4IG813U','Sessa','Fortunata','Via_statale_145','Scafati','tinastreghetta@hotmail.com','3319591211');
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella committente');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '     || conta ||
					' codcommittente '  || record.codcommittente ||
					' ragione_sociale ' || record.ragione_sociale ||
					' p_iva '           || record.p_iva ||
					' cod_fiscale '     || record.cod_fiscale ||
					' nome '            || record.nome ||
					' cognome '         || record.cognome ||
					' indirizzo '	  || record.indirizzo ||
					' città '	 	  || record.città ||
					' email ' 		  || record.email ||
					' cellulare ' 	  || record.cellulare );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------

create or replace PROCEDURE insert_dipendente IS
	CURSOR cursore IS SELECT * FROM dipendente;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO dipendente VALUES(05510001,'Anna','Barra',DATE '2020-05-01','BRRNNA57P62F839K');
	INSERT INTO dipendente VALUES(03210001,'Alfonso','Cesarano',DATE '2020-04-13','CSRLNS65M17C129F');
	INSERT INTO dipendente VALUES(03210002,'Carmine','Cascone',DATE '2021-02-23','CSCCMN63P06G813A');
	INSERT INTO dipendente VALUES(05510002,'Giovanni','Fiasco',DATE '2020-04-09','FSCGNN83H23F839P');
	INSERT INTO dipendente VALUES(05510003,'Luisa','Arena',DATE '2021-10-21','RNALSU82E50F839T');
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella dipendente');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '     || conta ||
					' matricola '  	  || record.matricola ||
					' nome '		  || record.nome ||
					' cognome '         || record.cognome ||
					' data_assunzione ' || record.data_assunzione ||
					' cod_fiscale '     || record.cod_fiscale );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------

create or replace PROCEDURE insert_stampante IS
	CURSOR cursore IS SELECT * FROM stampante;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO stampante VALUES(seq_stampante.NEXTVAL,DATE '2019-01-15','Artillery','192.192.100.1','Hornet',1,1,0,0);
	INSERT INTO stampante VALUES(seq_stampante.NEXTVAL,DATE '2019-02-11','AnyCubic','192.192.101.1','i3_Mega',1,0,1,0);
	INSERT INTO stampante VALUES(seq_stampante.NEXTVAL,DATE '2019-03-17','Creality','192.192.103.0','Ender_3',1,1,0,1);
	INSERT INTO stampante VALUES(seq_stampante.NEXTVAL,DATE '2020-02-14','GeeeTech','192.192.105.1','Prusa_i3_Pro',1,1,1,0);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella stampante');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '    || conta ||
					' codstampante '   || record.codstampante ||
					' data_acquisto ' || record.data_acquisto ||
					' produttore '     || record.produttore ||
					' indirizzo_IP '   || record.indirizzo_IP ||
					' modello '        || record.modello ||
					' ctrl_PLA '       || record.ctrl_PLA ||
					' ctrl_PETG '	 || record.ctrl_PETG ||
					' ctrl_ABS '	 || record.ctrl_ABS ||
					' ctrl_TPU ' 	 || record.ctrl_TPU );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE insert_progetto IS
	CURSOR cursore IS SELECT * FROM progetto;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO progetto VALUES(seq_progetto.NEXTVAL,'coprivaso','stampa_di_coprivasi_stampati_in_3d_per_riutilizzare_le_bottiglie_di_plastica','PETG',DATE '2020-09-11',DATE '2020-10-11',50,1000);
	INSERT INTO progetto VALUES(seq_progetto.NEXTVAL,'staffa_armadio','stampa_di_una_staffa_reggi_cappotti','ABS',DATE '2020-10-12',DATE '2020-11-12',175,1010);              
	INSERT INTO progetto VALUES(seq_progetto.NEXTVAL,'fermaporte','stampa_di_un_fermaporta_per_un_ufficio','ABS',DATE '2020-10-18',DATE '2020-11-18',35,1020);
	INSERT INTO progetto VALUES(seq_progetto.NEXTVAL,'spada_zelda','stampa_di_una_spada_dal_videogioco_the_legend_of_zelda','PLA',DATE '2021-10-06',DATE '2020-11-06',80,1030);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella progetto');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '    || conta ||
					' codprogetto '    || record.codprogetto ||
					' titolo '         || record.titolo ||
					' descrizione '    || record.descrizione ||
					' materiale '      || record.materiale ||
					' data_richiesta ' || record.data_richiesta ||
					' scadenza '       || record.scadenza ||
					' budget '	       || record.budget ||
					' committente '    || record.committente );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------

create or replace PROCEDURE insert_versione IS
	CURSOR cursore IS SELECT * FROM versione;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,1,2000,11000);
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,1,2010,11010);                                              
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,1,2010,11020);
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,1,2020,11020);
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,2,2030,11030);
	INSERT INTO versione VALUES(seq_versione.NEXTVAL,2,2030,11030);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella versione');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '    || conta ||
					' codversione '    || record.codversione ||
					' num_componenti ' || record.num_componenti||
					' progetto '       || record.progetto ||
					' stampante '      || record.stampante );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE insert_file_3d IS
	CURSOR cursore IS SELECT * FROM file_3d;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO file_3d VALUES('coprivaso_v1.stl',3000);
	INSERT INTO file_3d VALUES('coprivaso_v2-stl',3010);
	INSERT INTO file_3d VALUES('staffa_armadio_v1.stl',3020);
	INSERT INTO file_3d VALUES('fermaporta_v1.stl',3030);
	INSERT INTO file_3d VALUES('spada_zelda_lama_v1.stl',3040);
	INSERT INTO file_3d VALUES('spada_zelda_elsa_v1.stl',3040);
	INSERT INTO file_3d VALUES('spada_zelda_lama_v2.stl',3050);
	INSERT INTO file_3d VALUES('spada_zelda_elsa_v2.stl',3050);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella file_3d');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. ' || conta ||
					' file_3d '     || record.file_3d ||
					' versione '    || record.versione );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------

create or replace PROCEDURE insert_file_di_stampa IS
	CURSOR cursore IS SELECT * FROM file_di_stampa ;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO file_di_stampa VALUES('coprivaso_v1.GCODE','03:30:22',3000);
	INSERT INTO file_di_stampa VALUES('coprivaso_v2.GCODE','03:50:46',3010);
	INSERT INTO file_di_stampa VALUES('staffa_armadio_v1.GCODE','07:10:10',3020);
	INSERT INTO file_di_stampa VALUES('fermaporta_v1.GCODE','02:15:54',3030);
	INSERT INTO file_di_stampa VALUES('spada_zelda_lama_v1.GCODE','09:34:42',3040);
	INSERT INTO file_di_stampa VALUES('spada_zelda_elsa_v1.GCODE','05:44:41',3040);
	INSERT INTO file_di_stampa VALUES('spada_zelda_lama_v2.GCODE','08:56:07',3050);
	INSERT INTO file_di_stampa VALUES('spada_zelda_elsa_v2.GCODE','06:02:18',3050);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella file_di_stampa ');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '    || conta ||
					' file_di_stampa ' || record.file_di_stampa ||
					' durata_stimata ' || record.durata_stimata ||
					' versione '    || record.versione );
	END LOOP;
	CLOSE cursore;
END;

-------------------------------------------------------------------------------
create or replace PROCEDURE insert_gestione IS
	CURSOR cursore IS SELECT * FROM gestione;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO gestione VALUES(3010,3210001,11000);
	INSERT INTO gestione VALUES(3020,3210001,11010);
	INSERT INTO gestione VALUES(3030,3210002,11020);
	INSERT INTO gestione VALUES(3050,3210002,11030);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella gestione');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. ' || conta ||
					' versione '    || record.versione ||
					' tecnico '     || record.tecnico ||
					' stampante '   || record.stampante );
	END LOOP;
	CLOSE cursore;
END;
-------------------------------------------------------------------------------
create or replace PROCEDURE insert_realizzazione IS
	CURSOR cursore IS SELECT * FROM realizzazione;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO realizzazione VALUES(5510001,'2000',DATE '2020-09-11',DATE '2020-10-04');
	INSERT INTO realizzazione VALUES(5510002,'2010',DATE '2020-10-13',DATE '2020-10-20');
	INSERT INTO realizzazione VALUES(5510003,'2020',DATE '2020-10-25',DATE '2020-12-24');
	INSERT INTO realizzazione VALUES(5510001,'2030',DATE '2021-10-06','');
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella realizzazione');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '  || conta ||
					' progetto '     || record.progetto ||
					' sviluppatore ' || record.sviluppatore ||
					' data_inizio '  || record.data_inizio ||
					' data_fine '    || record.data_fine );
	END LOOP;
	CLOSE cursore;
END;

-------------------------------------------------------------------------------
create or replace PROCEDURE insert_oggetto IS
	CURSOR cursore IS SELECT * FROM oggetto;
	record cursore%ROWTYPE;
	conta number:=0;
BEGIN
	INSERT INTO oggetto VALUES(seq_oggetto.NEXTVAL,'domotica',23,'20x15x5',45,TIMESTAMP '2020-10-05 08:20:00',TIMESTAMP '2020-10-05 12:30:00','',11010);
	INSERT INTO oggetto VALUES(seq_oggetto.NEXTVAL,'utility',64,'34x72x38',150,TIMESTAMP '2020-10-20 14:25:00',TIMESTAMP '2020-10-20 21:40:00','',11020);
	INSERT INTO oggetto VALUES(seq_oggetto.NEXTVAL,'utility',31,'5x10x3',25,TIMESTAMP '2020-10-26 09:15:00','','',11030);
	INSERT INTO oggetto VALUES(seq_oggetto.NEXTVAL,'svago',49,'29x12x10',65,TIMESTAMP '2020-11-25 10:00:04','','',11000);
	OPEN cursore;
	DBMS_OUTPUT.PUT_LINE('Tabella oggetto');
	LOOP
		conta := conta + 1;
		FETCH cursore INTO record;
		EXIT WHEN cursore%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE('Record n. '       || conta ||
					' codoggetto '        || record.codoggetto ||
					' impiego '           || record.impiego ||
					' peso '              || record.peso ||
					' dimensioni '        || record.dimensioni ||
					' costo '             || record.costo ||
					' inizio_stampa '     || record.inizio_stampa ||
					' fine_stampa '	    || record.fine_stampa ||
					' stato_avanzamento ' || record.stato_avanzamento ||
					' stampante ' 	    || record.stampante );
	END LOOP;
	CLOSE cursore;
END;

-------------------------------------------------------------------------------
create or replace PROCEDURE insert_init_val IS	
BEGIN
	insert_committente;
	insert_dipendente;
	insert_stampante;
	insert_progetto;
	insert_versione;
	insert_file_3d;
	insert_file_di_stampa;
	insert_gestione;
	insert_realizzazione;
	insert_oggetto;	
END;