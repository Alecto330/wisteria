drop table if exists Risposta;
drop table if exists Domanda;
drop table if exists SiCandida;
drop table if exists Posizione;
drop table if exists Localita;
drop table if exists Esperienza;
drop table if exists CV;
drop table if exists Utente;

create table Utente (
	username varchar (30) primary key,
	pw varchar (100) not null,
	email varchar (50) not null unique,
	ruolo varchar(15) not null
);


create table CV (
	cf varchar (16) primary key,
	nome varchar (50) not null,
	cognome varchar(50) not null,
	DataDiNascita date not null,
	Residenza varchar (50),
	TitoloDiStudio varchar (50),
	curriculum varbinary(max),
	fotoProfilo image,
	telefono varchar(14),
	FK_Utente varchar (30),
	foreign key (FK_Utente) references Utente (username)
	on delete cascade
	on update cascade
);


create table Esperienza (
	id int primary key identity (1, 1),
	titolo varchar (50) not null,
	esperienza varchar (1000) not null,
	FK_CV varchar (16),
	foreign key (FK_CV) references CV (cf)
	on delete cascade
	on update cascade
);

create table Localita (
	provincia varchar (25) primary key,
	regione varchar (25) not null,
);

create table Posizione (
	id int primary key identity (1, 1),
	titolo varchar (50) not null,
	descrizione varchar (3000) not null,
	settore varchar (50) not null,
	FK_Localita varchar (25),
	foreign key (FK_Localita) references Localita (provincia)
	on delete cascade
	on update cascade
);


create table SiCandida (
	FK_Posizione int,
	FK_Utente varchar (30),
	punteggio tinyint constraint punteggio check (punteggio >= 0 and punteggio <=10),
	data datetime,
	primary key (FK_Posizione, FK_Utente),
	foreign key (FK_Posizione) references Posizione (id)
	on delete cascade
	on update cascade,
	foreign key (FK_Utente) references Utente (username)
	on delete cascade
	on update cascade
);


create table Domanda (
	id int primary key identity (1, 1),
	domanda varchar (500) not null unique,
	argomento varchar(30)not null,
	FK_Posizione int,
	foreign key (FK_Posizione) references Posizione (id)
	on delete cascade
	on update cascade
);


create table Risposta (
	id int primary key identity (1, 1),
	risposta varchar (500),
	VoF bit,
	FK_Domanda int,
	foreign key (FK_Domanda) references Domanda (id)
	on delete cascade
	on update cascade
);


insert into Utente values
('Amm01', '$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku', 'admin@veritas.com', 'user.Admin'),
('Amm02', 'Amm02pw?', 'amm02email@veritas.com', 'Amministratore'),
('Can01', '$2a$10$j2mex2WKgAzkr9a2yniN4ePQN2gZPzGFXEH72bt5uAhf93kYhc7ku', 'user@veritas.com', 'user.Candidate'),
('Can02', 'Can02pw!', 'can02email@veritas.com', 'Candidato'),
('Can03', 'Can03pw!', 'can03email@veritas.com', 'Candidato'),
('Can04', 'Can04pw!', 'can04email@veritas.com', 'Candidato'),
('Can05', 'Can05pw!', 'can05email@veritas.com', 'Candidato');

select *
from Utente;

insert into CV (cf, nome, cognome, DataDiNascita, Residenza, TitoloDiStudio, FK_Utente) values
('LVNNTR99E16G942Y', 'Anterio', 'Lavanda', '19990516', 'Potenza', 'Master in biochimica', 'Can01'),
('TTRNVR02T49L424Y', 'Nevrei', 'Ettern', '20021209', 'Trieste', 'Laurea in Ingegneria Informatica', 'Can02'),
('NKEHMT05C24L219N', 'Helmut', 'Neik', '20050324', 'Torino', 'Diploma in Informatica', 'Can03'),
('TTMLRE92P30F205X', 'Eulero', 'Ottomano', '19920930', 'Milano', 'Laurea in Economia', 'Can04'),
('VRTMKL87E05C933R', 'Mikael', 'Verte', '19970505', 'Como', 'Diploma di Liceo Linguistico', 'Can05');


select *
from CV;

insert into Esperienza (titolo, esperienza, FK_CV) values
('Sviluppatore Software', 'Progettazione e sviluppo di applicazioni web per clienti aziendali, con focus su soluzioni scalabili e ottimizzazione delle performance. Collaborazione con team multidisciplinari per garantire una Utente experience eccellente.', 'TTRNVR02T49L424Y'),
('Analista di Sistemi', 'Analisi delle esigenze aziendali e traduzione in requisiti tecnici per il miglioramento dei processi. Implementazione di sistemi ICT e monitoraggio delle prestazioni per massimizzare l efficienza operativa.', 'NKEHMT05C24L219N'),
('Sales Account', 'Gestione di un portafoglio clienti, sviluppo di strategie di vendita e mantenimento di relazioni durature. Raggiungimento e superamento degli obiettivi di vendita attraverso presentazioni persuasive e analisi di mercato.', 'TTRNVR02T49L424Y'),
('Project Manager IT', 'Coordinamento di progetti software dalla pianificazione all implementazione. Gestione del team e delle risorse, monitoraggio delle scadenze e dei budget per garantire la consegna puntuale dei risultati.', 'VRTMKL87E05C933R'),
('Specialista in Sicurezza Informatica', 'Valutazione e implementazione di misure di sicurezza per proteggere i sistemi informatici aziendali. Monitoraggio delle vulnerabilità e formazione del personale sulle best practices di cybersecurity.', 'LVNNTR99E16G942Y'),
('Responsabile Marketing Digitale', 'Sviluppo e attuazione di campagne di marketing digitale per promuovere prodotti e servizi ICT. Analisi dei dati e ottimizzazione delle strategie per migliorare la visibilità online e aumentare le conversioni.', 'LVNNTR99E16G942Y'),
('Consulente IT', 'Fornitura di consulenze strategiche per l implementazione di soluzioni tecnologiche su misura. Collaborazione con le aziende per identificare opportunità di innovazione e ottimizzazione dei processi, garantendo un ritorno sull investimento significativo.', 'TTMLRE92P30F205X');


select *
from Esperienza;

insert into Localita values
('Chieti', 'Abruzzo'),
('L''Aquila', 'Abruzzo'),
('Pescara', 'Abruzzo'),
('Teramo', 'Abruzzo'),
('Potenza', 'Basilicata'),
('Matera', 'Basilicata'),
('Catanzaro', 'Calabria'),
('Cosenza', 'Calabria'),
('Crotone', 'Calabria'),
('Reggio Calabria', 'Calabria'),
('Vibo Valentia', 'Calabria'),
('Avellino', 'Campania'),
('Benevento', 'Campania'),
('Caserta', 'Campania'),
('Napoli', 'Campania'),
('Salerno', 'Campania'),
('Bologna', 'Emilia-Romagna'),
('Ferrara', 'Emilia-Romagna'),
('Forlì-Cesena', 'Emilia-Romagna'),
('Modena', 'Emilia-Romagna'),
('Parma', 'Emilia-Romagna'),
('Piacenza', 'Emilia-Romagna'),
('Ravenna', 'Emilia-Romagna'),
('Reggio Emilia', 'Emilia-Romagna'),
('Rimini', 'Emilia-Romagna'),
('Gorizia', 'Friuli-Venezia Giulia'),
('Pordenone', 'Friuli-Venezia Giulia'),
('Trieste', 'Friuli-Venezia Giulia'),
('Udine', 'Friuli-Venezia Giulia'),
('Frosinone', 'Lazio'),
('Latina', 'Lazio'),
('Rieti', 'Lazio'),
('Roma', 'Lazio'),
('Viterbo', 'Lazio'),
('Genova', 'Liguria'),
('Imperia', 'Liguria'),
('La Spezia', 'Liguria'),
('Savona', 'Liguria'),
('Bergamo', 'Lombardia'),
('Brescia', 'Lombardia'),
('Como', 'Lombardia'),
('Cremona', 'Lombardia'),
('Lecco', 'Lombardia'),
('Lodi', 'Lombardia'),
('Mantova', 'Lombardia'),
('Milano', 'Lombardia'),
('Monza e Brianza', 'Lombardia'),
('Pavia', 'Lombardia'),
('Sondrio', 'Lombardia'),
('Varese', 'Lombardia'),
('Ancona', 'Marche'),
('Ascoli Piceno', 'Marche'),
('Fermo', 'Marche'),
('Macerata', 'Marche'),
('Pesaro e Urbino', 'Marche'),
('Campobasso', 'Molise'),
('Isernia', 'Molise'),
('Alessandria', 'Piemonte'),
('Asti', 'Piemonte'),
('Biella', 'Piemonte'),
('Cuneo', 'Piemonte'),
('Novara', 'Piemonte'),
('Torino', 'Piemonte'),
('Verbano-Cusio-Ossola', 'Piemonte'),
('Vercelli', 'Piemonte'),
('Bari', 'Puglia'),
('Barletta-Andria-Trani', 'Puglia'),
('Brindisi', 'Puglia'),
('Foggia', 'Puglia'),
('Lecce', 'Puglia'),
('Taranto', 'Puglia'),
('Cagliari', 'Sardegna'),
('Nuoro', 'Sardegna'),
('Oristano', 'Sardegna'),
('Sassari', 'Sardegna'),
('Sud Sardegna', 'Sardegna'),
('Agrigento', 'Sicilia'),
('Caltanissetta', 'Sicilia'),
('Catania', 'Sicilia'),
('Enna', 'Sicilia'),
('Messina', 'Sicilia'),
('Palermo', 'Sicilia'),
('Ragusa', 'Sicilia'),
('Siracusa', 'Sicilia'),
('Trapani', 'Sicilia'),
('Arezzo', 'Toscana'),
('Firenze', 'Toscana'),
('Grosseto', 'Toscana'),
('Livorno', 'Toscana'),
('Lucca', 'Toscana'),
('Massa-Carrara', 'Toscana'),
('Pisa', 'Toscana'),
('Pistoia', 'Toscana'),
('Prato', 'Toscana'),
('Siena', 'Toscana'),
('Bolzano', 'Trentino-Alto Adige'),
('Trento', 'Trentino-Alto Adige'),
('Perugia ', 'Umbria'),
('Terni', 'Umbria'),
('Aosta ', 'Valle d''Aosta'),
('Belluno ', 'Veneto'),
('Padova ', 'Veneto'),
('Rovigo ', 'Veneto'),
('Treviso ', 'Veneto'),
('Venezia ', 'Veneto'),
('Verona ', 'Veneto'),
('Vicenza ', 'Veneto');
 
 select *
from Localita;

insert into Posizione (titolo, descrizione, settore, FK_Localita) values
('Sviluppatore Full Stack', 'Siamo alla ricerca di un Sviluppatore Full Stack appassionato per unirsi al nostro team. Il candidato ideale avrà esperienza nella creazione di applicazioni web e competenze in linguaggi come JavaScript, Python e SQL. Collaborerai con designer e analisti per sviluppare soluzioni innovative e Utente-friendly.', 'Web developer', 'Alessandria'),
('Specialista in Sicurezza Informatica', 'Cerchiamo un Specialista in Sicurezza Informatica per proteggere i nostri sistemi e dati. Il ruolo prevede l analisi delle vulnerabilità, la gestione delle minacce e la formazione del personale. È richiesta una solida esperienza in cybersecurity e una certificazione pertinente.', 'Cybersecurity', 'Lodi'),
('Sales Manager ICT', 'Stiamo cercando un Sales Manager ICT motivato per guidare il nostro team di vendita. Il candidato ideale avrà una comprovata esperienza nel settore IT, ottime capacità di negoziazione e un forte approccio orientato ai risultati. Dovrai sviluppare strategie di vendita e costruire relazioni durature con i clienti.', 'Vendite', 'Milano'),
('Project Manager IT', 'Unisciti a noi come Project Manager IT! Il candidato gestirà progetti di sviluppo software, coordinando team e risorse per garantire la consegna puntuale e il rispetto del budget. È richiesta esperienza nella gestione di progetti complessi e abilità di leadership.', 'Amministrazione', 'Milano'),
('Analista di Dati', 'Siamo alla ricerca di un Analista di Dati per supportare le nostre decisioni strategiche. Il candidato ideale avrà esperienza con strumenti di analisi come SQL e Excel, e sarà in grado di tradurre dati complessi in insights utili per il business.', 'Data analist', 'Torino'),
('Consulente Tecnico', 'Cerchiamo un Consulente Tecnico esperto per fornire soluzioni personalizzate ai nostri clienti. Il ruolo richiede competenze in progettazione di sistemi, gestione di progetti e supporto post-implementazione. È fondamentale una forte attitudine al problem solving e ottime capacità comunicative.', 'Consulenza', 'Bergamo');

select *
from Posizione;

insert into SiCandida (FK_Posizione, FK_Utente, punteggio, data) values
('1', 'Can01', 4, '19990516'),
('2', 'Can03', 7,'19990516'),
('2', 'Can02', 8, '19990516'),
('2', 'Can01', 10, '19990516'),
('3', 'Can04', 1, '19990516'),
('1', 'Can02', 6, '19990516');

select *
from SiCandida;

insert into Domanda (domanda, argomento, FK_Posizione) values
('Quale linguaggio di programmazione è comunemente usato per lo sviluppo front-end?', 'Front-end', 1),
('Quale framework è popolare per lo sviluppo back-end in Node.js?', 'Back-end', 1),
('Qual è la principale funzione di un firewall?', 'Sicurezza di rete', 2),
('Che cos#è il phishing?', 'Sicurezza di rete', 2),
('Qual è l#obiettivo principale di un Sales Manager?', 'Vendite', 3),
('Quale KPI è fondamentale per un Sales Manager?', 'Vendite', 3),
('Qual è la metodologia più comune per la gestione dei progetti IT?', 'Managment', 4),
('Qual è un documento chiave in un progetto IT?', 'Managment', 4),
('Quale strumento è spesso usato per l#analisi dei dati?', 'Analisi dati', 5),
('Che cosa rappresenta un "dataset"?', 'Analisi dati', 5),
('Qual è il ruolo principale di un consulente tecnico?', 'Consulenza', 6),
('Quale competenza è fondamentale per un consulente tecnico?', 'Consulenza', 6);

select *
from Domanda;

insert into Risposta (risposta, VoF, FK_Domanda) values
('Python', 0, 1),
('JavaScript ', 1, 1),
('Java', 0, 1),
('C++', 0, 1),
('Flask', 0, 2),
('Express.js', 1, 2),
('Django', 0, 2),
('Ruby on Rails', 0, 2),
('Aumentare la velocità della rete', 0, 3),
('Bloccare accessi non autorizzati', 1, 3),
('Eseguire backup dei dati', 0, 3),
('Ottimizzare le prestazioni del server', 0, 3),
('Un tipo di attacco DDoS', 0, 4),
('Una tecnica di ingegneria sociale per rubare informazioni', 1, 4),
('Un virus informatico', 0, 4),
('Un metodo di crittografia', 0, 4),
('Sviluppare software', 0, 5),
('Aumentare le vendite e i profitti', 1, 5),
('Gestire la sicurezza informatica', 0, 5),
('Progettare reti', 0, 5),
('Tasso di crescita delle vendite', 1, 6),
('Tempo di risposta ai ticket', 0, 6),
('Numero di bug nel software', 0, 6),
('Percentuale di uptime del server', 0, 6),
('Waterfall ', 1, 7),
('Agile', 0, 7),
('Lean', 0, 7),
('Six Sigma', 0, 7),
('Business Case', 1, 8),
('User Manual', 0, 8),
('Code Review', 0, 8),
('Test Plan', 0, 8),
('Photoshop', 0, 9),
('Excel', 1, 9),
('PowerPoint', 0, 9),
('Notepad', 0, 9),
('Un programma di software', 0, 10),
('Un insieme di dati strutturati', 1, 10),
('Un linguaggio di programmazione', 0, 10),
('Un algoritmo', 0, 10),
('Fornire supporto tecnico ai clienti', 1, 11),
('Sviluppare codice', 0, 11),
('Gestire risorse umane', 0, 11),
('Creare campagne di marketing', 0, 11),
('Conoscenza di linguaggi di programmazione', 0, 12),
('Capacità di comunicazione efficace', 1, 12),
('Esperienza nella gestione di progetti', 0, 12),
('Competenze artistiche', 0, 12);

select *
from Risposta;

