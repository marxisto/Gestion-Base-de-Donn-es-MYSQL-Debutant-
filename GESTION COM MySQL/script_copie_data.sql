/*----------------------------------------------------------------------------
  -------- Script de copie des données csv dans les différentes tables -------
  ----------------------------------------------------------------------------*/ 

-- Définir la base de données ou le schéma à utiliser 
use `ICOMMERCE`; 

-- Emplacement secure_file
SHOW VARIABLES LIKE "secure_file_priv";

/*----------------------------------------------------------------------------
  ------------------ Table N°1 : icommerce.TB_TYPE_CLIENT --------------------
  ----------------------------------------------------------------------------*/
  
-- Sélection des données présentes dans la table icommerce.TB_TYPE_CLIENT
SELECT * FROM TB_TYPE_CLIENT;

-- Suppression des données présentes dans la table TB_TYPE_CLIENT
SET FOREIGN_KEY_CHECKS = 0 ;
TRUNCATE TB_TYPE_CLIENT ;
SET FOREIGN_KEY_CHECKS = 1 ;

-- Création d'une table temporaire
CREATE TABLE TB_TYPE_CLIENT_TEMP AS SELECT * FROM TB_TYPE_CLIENT LIMIT 0;
SELECT * from TB_TYPE_CLIENT_TEMP;
-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_TYPE_CLIENT_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_TYPE_CLIENT.csv dans la table  TB_TYPE_CLIENT_TEMP
LOAD DATA INFILE 'C:\Users\USER\Desktop\formationmysql-main\formationmysql-main\Section 6\TB_TYPE_CLIENT.csv' 	
INTO TABLE TB_TYPE_CLIENT_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY ''
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_TYPE_CLIENT
INSERT INTO TB_TYPE_CLIENT 
SELECT A.CD_TYPE_CLIENT,  A.LB_TYPE_CLIENT
FROM TB_TYPE_CLIENT_TEMP A
LEFT OUTER JOIN TB_TYPE_CLIENT B 
	ON A.CD_TYPE_CLIENT = B.CD_TYPE_CLIENT
WHERE B.CD_TYPE_CLIENT IS NULL;


-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_TYPE_CLIENT_TEMP;



/*----------------------------------------------------------------------------
  --------------------- Table N°2 : icommerce.TB_CLIENT ----------------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_CLIENT
SELECT * FROM TB_CLIENT;

-- Suppression des données présentes dans la table TB_CLIENT
SET FOREIGN_KEY_CHECKS = 0 ;
TRUNCATE TB_CLIENT ;
SET FOREIGN_KEY_CHECKS = 1 ;

-- Création d'une table temporaire
CREATE TABLE TB_CLIENT_TEMP AS SELECT * FROM TB_CLIENT LIMIT 0;
select *  from TB_CLIENT_TEMP;
-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_CLIENT_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_CLIENT.csv dans la table  TB_CLIENT_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_CLIENT.csv' 	
INTO TABLE TB_CLIENT_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_CLIENT
INSERT INTO TB_CLIENT
SELECT A.`ID_CLIENT`, A.`NOM_CLIENT`, A.`PREN_CLIENT`, A.`CD_POSTAL_CLIENT`, A.`VILLE_CLIENT`, A.`PAYS_CLIENT`, A.`REGION_CLIENT`, A.`CD_TYPE_CLIENT`
FROM TB_CLIENT_TEMP A
LEFT OUTER JOIN TB_CLIENT B 
	ON A.ID_CLIENT = B.ID_CLIENT
WHERE B.ID_CLIENT IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_CLIENT_TEMP;


/*----------------------------------------------------------------------------
  -------------------- Table N°3 : icommerce.TB_CATEGORIE --------------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_CATEGORIE
SELECT * FROM TB_CATEGORIE;

-- Suppression des données présentes dans la table TB_CATEGORIE
SET FOREIGN_KEY_CHECKS = 0 ;
TRUNCATE TB_CATEGORIE ;
SET FOREIGN_KEY_CHECKS = 1 ;

-- Création d'une table temporaire
CREATE TABLE TB_CATEGORIE_TEMP AS SELECT * FROM TB_CATEGORIE LIMIT 0;

-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_CATEGORIE_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_CATEGORIE.csv dans la table  TB_CATEGORIE_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_CATEGORIE.csv' 	
INTO TABLE TB_CATEGORIE_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_CATEGORIE
INSERT INTO TB_CATEGORIE
SELECT A.`CD_CATEGORIE`, A.`LB_CATEGORIE`
FROM TB_CATEGORIE_TEMP A
LEFT OUTER JOIN TB_CATEGORIE B 
	ON A.CD_CATEGORIE = B.CD_CATEGORIE
WHERE B.CD_CATEGORIE IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_CATEGORIE_TEMP;

/*----------------------------------------------------------------------------
  ------------------ Table N°4 : icommerce.TB_SOUS_CATEGORIE -----------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_SOUS_CATEGORIE
SELECT * FROM TB_SOUS_CATEGORIE;

-- Suppression des données présentes dans la table TB_SOUS_CATEGORIE
SET FOREIGN_KEY_CHECKS = 0 ;
TRUNCATE TB_SOUS_CATEGORIE ;
SET FOREIGN_KEY_CHECKS = 1 ;
-- Création d'une table temporaire
CREATE TABLE TB_SOUS_CATEGORIE_TEMP AS SELECT * FROM TB_SOUS_CATEGORIE LIMIT 0;

-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_SOUS_CATEGORIE_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_SOUS_CATEGORIE.csv dans la table  TB_SOUS_CATEGORIE_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_SOUS_CATEGORIE.csv' 	
INTO TABLE TB_SOUS_CATEGORIE_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_SOUS_CATEGORIE
INSERT INTO TB_SOUS_CATEGORIE
SELECT A.`CD_SOUS_CATEGORIE`, A.`LB_SOUS_CATEGORIE`, A.`CD_CATEGORIE`
FROM TB_SOUS_CATEGORIE_TEMP A
LEFT OUTER JOIN TB_SOUS_CATEGORIE B 
	ON A.CD_SOUS_CATEGORIE = B.CD_SOUS_CATEGORIE
WHERE B.CD_SOUS_CATEGORIE IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_SOUS_CATEGORIE_TEMP;


/*----------------------------------------------------------------------------
  --------------------- Table N°5 : icommerce.TB_PRODUIT ---------------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_PRODUIT
SELECT * FROM TB_PRODUIT;

-- Suppression des données présentes dans la table TB_PRODUIT
TRUNCATE TB_PRODUIT ;

-- Création d'une table temporaire
CREATE TABLE TB_PRODUIT_TEMP AS SELECT * FROM TB_PRODUIT LIMIT 0;

-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_PRODUIT_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_PRODUIT.csv dans la table  TB_PRODUIT_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_PRODUIT.csv' 	
INTO TABLE TB_PRODUIT_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_PRODUIT
INSERT INTO TB_PRODUIT
SELECT A.`CD_PRODUIT`, A.`NOM_PRODUIT`, A.`PRIX_ACHAT_PRODUIT`, A.`PRIX_VENTE_PRODUIT`, A.`CD_SOUS_CATEGORIE`
FROM TB_PRODUIT_TEMP A
LEFT OUTER JOIN TB_PRODUIT B 
	ON A.CD_PRODUIT = B.CD_PRODUIT
WHERE B.CD_PRODUIT IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_PRODUIT_TEMP;


/*----------------------------------------------------------------------------
  ---------------------- Table N°6 : icommerce.TB_VENTE ----------------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_VENTE
SELECT * FROM TB_VENTE;

-- Suppression des données présentes dans la table TB_VENTE
TRUNCATE TB_VENTE ;

-- Création d'une table temporaire
CREATE TABLE TB_VENTE_TEMP AS SELECT * FROM TB_VENTE LIMIT 0;

-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_VENTE_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_VENTE.csv dans la table  TB_VENTE_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_VENTE.csv' 	
INTO TABLE TB_VENTE_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_VENTE
INSERT INTO TB_VENTE
SELECT A.`ID_VENTE`, A.`DT_VENTE`, A.`ID_CLIENT`
FROM TB_VENTE_TEMP A
LEFT OUTER JOIN TB_VENTE B 
	ON A.ID_VENTE = B.ID_VENTE
WHERE B.ID_VENTE IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_VENTE_TEMP;



/*----------------------------------------------------------------------------
  ------------------ Table N°7 : icommerce.TB_DETAIL_VENTE -------------------
  ----------------------------------------------------------------------------*/
-- Sélection des données présentes dans la table icommerce.TB_DETAIL_VENTE
SELECT * FROM TB_DETAIL_VENTE;

-- Suppression des données présentes dans la table TB_DETAIL_VENTE
TRUNCATE TB_DETAIL_VENTE ;

-- Création d'une table temporaire
CREATE TABLE TB_DETAIL_VENTE_TEMP AS SELECT * FROM TB_DETAIL_VENTE LIMIT 0;

-- Ajout de la colonne BL_EXPORT
ALTER TABLE TB_DETAIL_VENTE_TEMP ADD COLUMN BL_EXPORT INTEGER;

-- Copie des données présentes dans le fichier TB_DETAIL_VENTE.csv dans la table  TB_DETAIL_VENTE_TEMP
LOAD DATA INFILE 'C:/Script SQL - Formation MySQL/Section 6/TB_DETAIL_VENTE.csv' 	
INTO TABLE TB_DETAIL_VENTE_TEMP FIELDS TERMINATED BY '|' ENCLOSED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 ROWS;

-- Insertion des données dans la table TB_DETAIL_VENTE
INSERT INTO TB_DETAIL_VENTE
SELECT A.`ID_VENTE`, A.`CD_PRODUIT`, A.`QTE_VENTE`, A.`PRIX_VENTE`, A.`PRIX_ACHAT`
FROM TB_DETAIL_VENTE_TEMP A
LEFT OUTER JOIN TB_DETAIL_VENTE B 
	ON A.ID_VENTE = B.ID_VENTE AND A.CD_PRODUIT = B.CD_PRODUIT
WHERE B.ID_VENTE IS NULL AND B.CD_PRODUIT IS NULL;

-- Suppression de la table temporaire 
DROP TABLE IF EXISTS TB_DETAIL_VENTE_TEMP;
