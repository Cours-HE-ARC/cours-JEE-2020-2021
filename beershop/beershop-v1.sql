CREATE database beershop;
USE beershop;

DROP TABLE IF EXISTS panier_bieres;
DROP TABLE IF EXISTS evaluation;
DROP TABLE IF EXISTS biere;
DROP TABLE IF EXISTS panier;


CREATE TABLE biere (
  id int(11) NOT NULL auto_increment,
  nom char(35) NOT NULL default '',
  prix float(5,2) NOT NULL default '0.00',
  fabricant char(35) NOT NULL default '',
  stock int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;

CREATE TABLE panier (
	id int(11) NOT NULL auto_increment,
	date_creation DATE NOT NULL,
	PRIMARY KEY  (id)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;

CREATE TABLE panier_bieres (
	biere_id 	INT,
	panier_id INT,
    PRIMARY KEY (biere_id,panier_id),
    FOREIGN KEY (biere_id) REFERENCES biere(id),
    FOREIGN KEY (panier_id) REFERENCES panier (id)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;

CREATE TABLE evaluation (
	id int(11) NOT NULL auto_increment,
    biere_id INT,
    date_evaluation DATE NOT NULL,
    commentaire VARCHAR(1024),
    note int(3) UNSIGNED,
    PRIMARY KEY (id),
    FOREIGN KEY (biere_id) REFERENCES biere(id)
) ENGINE=InnoDB AUTO_INCREMENT=4080 DEFAULT CHARSET=utf8;


INSERT INTO biere VALUES (1,'1664 Gold',2.35,'Kronenbourg',200),
(2,'Abbaye de St Bon Chien',4.05,'BFM',125),
(3,'Biere du foudre blanche',6.00,'Bière du Foudre',100),
(4,'La Torpille',3.50,'BFM',120),
(5,'La marmotte brunette',4.05,'La Marmotte',25),
(6,'Warteck Lager',2.95,'Warteck',565),
(7,'Fleur d''abeilles',5.15,'A. Egger AG',80),
(8,'Cardinal angel',2.05,'Cardinal',500),
(9,'Boxer brunette',4.05,'Brasserie Boxer',25),
(10,'Appenzeller weizen',4.00,'Appenzeller Bier',125),
(11,'Ambree double-malt',3.35,'Les Brasseurs',90),
(12,'Biere du foudre rousse',2.75,'Bière du Foudre',55),
(13,'Blonde pur malt',4.15,'Les Brasseurs',225),
(14,'La Dragonne',5.20,'BFM',105),
(15,'Saint éloi',3.00,'Les Faiseurs de Bière',305),
(16,'Feldschlösschen dunkle perle',1.95,'Feldschlösschen',1525),
(17,'Feldschlösschen lager bier',1.25,'Feldschlösschen',400),
(18,'Cardinal anker',2.55,'Cardinal',250),
(19,'Cardinal spéciale',2.05,'Cardinal',233),
(20,'La mandragore',4.05,'BFM',125);
