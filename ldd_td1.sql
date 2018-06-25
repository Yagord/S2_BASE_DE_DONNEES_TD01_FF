/*
DROP TABLE AGENCE CASCADE CONSTRAINTS;
DROP TABLE BONLOCATION CASCADE CONSTRAINTS;
DROP TABLE VEHICULE CASCADE CONSTRAINTS;
DROP TABLE CLIENT CASCADE CONSTRAINTS;
DROP TABLE CLASSE CASCADE CONSTRAINTS;
DROP TABLE PREFERE CASCADE CONSTRAINTS;
*/
CREATE TABLE AGENCE
   (
    CodeAgence CHAR(5),
    VilleAgence VARCHAR2(50),   
    CONSTRAINT PK_AGENCE PRIMARY KEY (CodeAgence)  
   ) ;
   
CREATE TABLE BONLOCATION
   (
    NumBonLocation NUMBER(10),
    NumClient NUMBER(10)  NOT NULL,
    NumVehicule VARCHAR2(50)  NOT NULL,
    DateDebut DATE ,
    DateFin DATE,
    Km NUMBER(10),   
    CONSTRAINT PK_BONDELOCATION PRIMARY KEY (NumBonLocation)  
   ) ;

CREATE TABLE VEHICULE
   (
    NumVehicule VARCHAR2(20)  NOT NULL,
    CodeAgence CHAR(5),
    CodeClasse CHAR(5)  NOT NULL,
    Km NUMBER(10),   
    CONSTRAINT PK_VEHICULE PRIMARY KEY (NumVehicule)  
   ) ;

CREATE TABLE CLIENT
   (
    NumClient NUMBER(32)  NOT NULL,
    NomClient VARCHAR2(50)  NOT NULL,
    VilleClient VARCHAR2(50),   
    CONSTRAINT PK_CLIENT PRIMARY KEY (NumClient)  
   ) ;

CREATE TABLE CLASSE
   (
    CodeClasse CHAR(5)  NOT NULL,
    NomClasse VARCHAR2(50),
    PrixKm NUMBER(10,2),   
    CONSTRAINT PK_CLASSE PRIMARY KEY (CodeClasse)  
   ) ;

CREATE TABLE PREFERE
   (
    NumClient NUMBER(32)  NOT NULL,
    CodeClasse CHAR(5)  NOT NULL,
    Note NUMBER(10) ,   
    CONSTRAINT PK_PREFERE PRIMARY KEY (NumClient, CodeClasse)  
   ) ;

ALTER TABLE VEHICULE ADD (
     CONSTRAINT FK_VEHICULE_VILLE
          FOREIGN KEY (CodeAgence)
               REFERENCES Agence (CodeAgence))   ;

ALTER TABLE VEHICULE ADD (
     CONSTRAINT FK_VEHICULE_CLASSE
          FOREIGN KEY (CodeClasse)
               REFERENCES CLASSE (CodeClasse))   ;

ALTER TABLE BONLOCATION ADD (
     CONSTRAINT FK_BONLOCATION_CLIENT
          FOREIGN KEY (NumClient)
               REFERENCES CLIENT (NumClient))   ;

ALTER TABLE BONLOCATION ADD (
     CONSTRAINT FK_BONLOCATION_VEHICULE
          FOREIGN KEY (NumVehicule)
               REFERENCES VEHICULE (NumVehicule))   ;

ALTER TABLE PREFERE ADD (
     CONSTRAINT FK_PREFERE_CLIENT
          FOREIGN KEY (NumClient)
               REFERENCES CLIENT (NumClient))   ;

ALTER TABLE PREFERE ADD (
     CONSTRAINT FK_PREFERE_CLASSE
          FOREIGN KEY (CodeClasse)
               REFERENCES CLASSE (CodeClasse))   ;
			   
insert into agence values ('AG01','DIJON');
insert into agence values ('AG02','PARIS');
insert into agence values ('AG03','LYON');
insert into agence values ('AG04','BORDEAUX');
insert into agence values ('AG05','NANTES');
insert into agence values ('AG06','MARSEILLE');

insert into classe values ('CL001','CITADINE',5.00);
insert into classe values ('CL002','BERLINE',7.00);
insert into classe values ('CL003','BERLINE DE LUXE',10.00);
insert into classe values ('CL004','SPORTIVE',8.00);
insert into classe values ('CL005','UTILITAIRE LEGER',2.00);
insert into classe values ('CL006','UTILITAIRE LOURD',3.00);

insert into vehicule values ('1626 VS 21','AG01','CL001',20000);
insert into vehicule values ('3245 WWF 21','AG01','CL002',40000);
insert into vehicule values ('3278 KL 75','AG02','CL006',120000);
insert into vehicule values ('4356 RU 75','AG02','CL003',60500);
insert into vehicule values ('4578 RT 21','AG01','CL006',100000);
insert into vehicule values ('5675 ZT 75','AG04','CL001',34000);
insert into vehicule values ('6799 VF 69','AG03','CL002',23000);
insert into vehicule values ('7865 RT 75','AG02','CL003',50000);
insert into vehicule values ('8776 WZ 13','AG06','CL006',23000);
insert into vehicule values ('8967 WS 69','AG03','CL003',12000);
insert into vehicule values ('9023 RS 69','AG03','CL004',34000);
insert into vehicule values ('0987 VD 62','AG04','CL004',60000);
insert into vehicule values ('1243 WD 75','AG01','CL005',75000);

insert into client values (1,'BERNARD','DIJON');
insert into client values (2,'DUPOND','DIJON');
insert into client values (3,'BAILLEKAR','LYON');
insert into client values (4,'MARTIN','LYON');
insert into client values (5,'SCOTT','MARSEILLE');
insert into client values (6,'SMITH','PARIS');
insert into client values (7,'JAMES','PARIS');
insert into client values (8,'DUPOND','PARIS');
insert into client values (9,'HARDY','LILLE');
insert into client values (10,'DUPOND','LILLE');
insert into client values (11,'DURANT','LILLE');

insert into bonlocation values (1,1,'0987 VD 62',TO_DATE('11/03/2014','DD/MM/YYYY'),TO_DATE('15/05/2014','DD/MM/YYYY'),800);
insert into bonlocation values (2,2,'0987 VD 62',TO_DATE('16/03/2014','DD/MM/YYYY'),TO_DATE('17/05/2014','DD/MM/YYYY'),150);
insert into bonlocation values (3,2,'1243 WD 75',TO_DATE('13/09/2014','DD/MM/YYYY'),TO_DATE('15/09/2014','DD/MM/YYYY'),340);
insert into bonlocation values (4,3,'1243 WD 75',TO_DATE('16/09/2014','DD/MM/YYYY'),null,null);
insert into bonlocation values (5,4,'1243 WD 75',TO_DATE('13/09/2014','DD/MM/YYYY'),null,null);
insert into bonlocation values (12,5,'1243 WD 75',TO_DATE('18/09/2014','DD/MM/YYYY'),null,null);
insert into bonlocation values (10,4,'1626 VS 21',TO_DATE('01/04/2014','DD/MM/YYYY'),TO_DATE('04/04/2014','DD/MM/YYYY'),500);
insert into bonlocation values (6,7,'3245 WWF 21',TO_DATE('12/07/2014','DD/MM/YYYY'),TO_DATE('15/07/2014','DD/MM/YYYY'),450);
insert into bonlocation values (7,8,'3245 WWF 21',TO_DATE('16/02/2014','DD/MM/YYYY'),TO_DATE('25/02/2014','DD/MM/YYYY'),1600);
insert into bonlocation values (8,1,'5675 ZT 75',TO_DATE('12/12/2014','DD/MM/YYYY'),TO_DATE('14/12/2014','DD/MM/YYYY'),234);
insert into bonlocation values (9,2,'5675 ZT 75',TO_DATE('15/12/2014','DD/MM/YYYY'),TO_DATE('24/12/2014','DD/MM/YYYY'),2000);
insert into bonlocation values (11,5,'7865 RT 75',TO_DATE('01/05/2014','DD/MM/YYYY'),TO_DATE('02/05/2014','DD/MM/YYYY'),350);

insert into prefere values (1,'CL001',1);
insert into prefere values (2,'CL001',2);
insert into prefere values (3,'CL001',1);
insert into prefere values (4,'CL001',5);
insert into prefere values (5,'CL001',4);
insert into prefere values (1,'CL002',2);
insert into prefere values (2,'CL002',10);
insert into prefere values (3,'CL002',10);
insert into prefere values (4,'CL002',4);
insert into prefere values (5,'CL002',3);
insert into prefere values (1,'CL003',10);
insert into prefere values (2,'CL003',1);
insert into prefere values (3,'CL003',5);
insert into prefere values (4,'CL003',3);
insert into prefere values (5,'CL003',1);
insert into prefere values (1,'CL004',5);
insert into prefere values (2,'CL004',2);
insert into prefere values (3,'CL004',3);
insert into prefere values (4,'CL004',2);
insert into prefere values (5,'CL004',10);
insert into prefere values (1,'CL005',6);
insert into prefere values (2,'CL005',3);
insert into prefere values (3,'CL005',2);
insert into prefere values (4,'CL005',1);
insert into prefere values (5,'CL005',9);
insert into prefere values (1,'CL006',3);
insert into prefere values (2,'CL006',4);
insert into prefere values (3,'CL006',4);
insert into prefere values (4,'CL006',10);
insert into prefere values (5,'CL006',8);

/*Partie 3*/

/*1*/
CREATE SEQUENCE SequenceEtudiant START WITH 12 INCREMENT BY 1;
/*INSERT INTO Client VALUES (SequenceEtudiant.CURRVAL, 'nothing', 'nothing');*/
INSERT INTO Client VALUES (SequenceEtudiant.NEXTVAL, 'nothing', 'nothing');
INSERT INTO Client VALUES (SequenceEtudiant.NEXTVAL, 'nothing', 'nothing');

/*2*/
CREATE TABLE Enploye AS (
SELECT *
FROM IQ_BD_SVENSON.ENPLOYE);

/*3*/
ALTER TABLE Enploye
RENAME TO Employe;

/*4*/
ALTER TABLE Employe
RENAME COLUMN NumEnploye TO NumEmploye;
ALTER TABLE Employe
RENAME COLUMN NomEnploye TO NomEmploye;
ALTER TABLE Employe
RENAME COLUMN PrenomEnploye TO PrenomEmploye;

/*5*/
ALTER TABLE Employe
ADD CONSTRAINT pk_Employe PRIMARY KEY(NumEmploye);
ALTER TABLE Employe
ADD CONSTRAINT fk_Employe FOREIGN KEY (codeAgence) REFERENCES Agence(codeAgence);

/*6*/
ALTER TABLE Employe
ADD Fonction varchar2(45)
DEFAULT ('agent d accuei');

UPDATE Employe
SET Fonction = 'PDG'
WHERE NumEmploye = 101;

/*Partie 4*/
/*1*/
DESCRIBE Employe;

/*2*/
UPDATE Employe
SET Salaire = Salaire*1.1
WHERE NumEmploye = 101;

/*3*/
SELECT *
FROM Agence;

/*4*/
SELECT *
FROM Client
WHERE UPPER (VilleClient) = 'DIJON';

/*5*/
SELECT *
FROM Client
WHERE NomClient LIKE 'B%';

/*6*/
SELECT NomEmploye AS Nom, PrenomEmploye AS Prenom, VilleAgence AS Ville
FROM Employe INNER JOIN Agence ON (Employe.CODEAGENCE = Agence.CODEAGENCE)
ORDER BY Nom, Prenom, Ville;

/*7*/
SELECT COUNT(NumClient) AS NombreDeClient
FROM Client;

/*8*/
SELECT Vehicule.numVehicule
FROM Vehicule
WHERE numVehicule NOT IN(
  SELECT Vehicule.numVehicule
  FROM Vehicule INNER JOIN Bonlocation ON Vehicule.numVehicule = Bonlocation.numVehicule);
  
/*9*/
SELECT Agence.codeAgence
FROM Agence
WHERE Agence.codeAgence NOT IN (
  SELECT Agence.codeAgence
  FROM Agence INNER JOIN Vehicule ON Agence.codeAgence = Vehicule.codeAgence);
  
/*10*/
SELECT numEmploye, nomEmploye, prenomEmploye
FROM Employe
WHERE Salaire > (
  SELECT AVG(Salaire)
  FROM Employe
  WHERE Fonction = 'agent d accuei'
  GROUP BY Fonction);

/*11*/
SELECT numEmploye, nomEmploye, prenomEmploye
FROM Employe
WHERE Salaire = &salairePlafond;