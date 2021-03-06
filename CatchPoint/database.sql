drop table if exists statUsers, participe, preferences, moyenFaisabiliteParcours, parcours, users; 


create table if not exists users(
	idUser int not null AUTO_INCREMENT,
	username varchar(40) not null,
	email varchar(100) not null,
	mdpHashe varchar(100) not null,
	nom varchar(40) DEFAULT '',
	prenom varchar(40) DEFAULT '',
	age int DEFAULT 0,
	roles varchar(40) DEFAULT 'ROLE_CLIENT',

	primary key(idUser),
	UNIQUE KEY `unique_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists parcours(
	idParcours int not null AUTO_INCREMENT,
	idUser int not null,
	nomParcours varchar(40) not null,
	longueurParcours varchar(40) not null,
	typeParcours varchar(40) not null,
	createAd time,
	description varchar(1000) not null,
	note int(5) DEFAULT 0,
	localisation varchar(100) not null,
	mode varchar(20) not null,
	nbPoint int(10) not null,
	fichierAssocie varchar(500) not null,

	CONSTRAINT fk_parcours_users FOREIGN KEY (idUser) REFERENCES users (idUser),
	primary key(idParcours)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists statUsers(
	idUser int not null,
	nbParcoursTermines int(5) DEFAULT 0,
	tempsPasseSurParcours time,
	nbTotalPointTrouve int(5) DEFAULT 0,
	nbCoursesCrees int(5) DEFAULT 0,

	CONSTRAINT fk_statUsers_users FOREIGN KEY (idUser) REFERENCES users (idUser),
	primary key(idUser)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists preferences(
	idPreference int not null AUTO_INCREMENT,
	idUser int not null,
	preference varchar(50) not null,

	CONSTRAINT fk_preferences_users FOREIGN KEY (idUser) REFERENCES users (idUser),
	primary key(idPreference)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists moyenFaisabiliteParcours(
	idFaisabilite int not null AUTO_INCREMENT,
	idParcours int not null,
	moyenDeDeplacement varchar(20) not null,

	CONSTRAINT fk_moyenFaisabiliteParcours_users FOREIGN KEY (idParcours) REFERENCES parcours (idParcours),
	primary key(idFaisabilite)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


create table if not exists participe(
	idParticipe int not null AUTO_INCREMENT,
	idUser int not null,
	idParcours int not null,
	etatParticipation varchar(50) not null,
	tempsMis time,
	fichierParticipation varchar(50) not null,


	CONSTRAINT fk_participe_users FOREIGN KEY (idUser) REFERENCES users (idUser),
	CONSTRAINT fk_participe_parcours FOREIGN KEY (idParcours) REFERENCES parcours (idParcours),
	primary key(idParticipe)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
