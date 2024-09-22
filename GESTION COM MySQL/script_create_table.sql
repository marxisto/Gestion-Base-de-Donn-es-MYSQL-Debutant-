/*----------------------------------------------------------------------------
  ----------------- Script de création des différentes tables ----------------
  ----------------------------------------------------------------------------*/

-- Définir la base de données ou le schéma à utiliser 
use `ICOMMERCE`;

-- 	Afficher la liste des tables
SHOW TABLES;

-- Afficher le moteur de stockage des données 
SELECT @@default_storage_engine;

-- Changer le moteur de stockage des données 
SET default_storage_engine=INNODB;  

/*----------------------------------------------------------------------------
  --------------------- Table N°1 : icommerce.TB_CLIENT ----------------------
  ----------------------------------------------------------------------------*/

-- DROP TABLE IF EXISTS `TB_CLIENT` CASCADE;
CREATE TABLE `TB_CLIENT` 
(
`ID_CLIENT` 	   VARCHAR(50) NOT NULL,
`NOM_CLIENT` 	   VARCHAR(100) NOT NULL,
`PREN_CLIENT` 	   VARCHAR(100) NOT NULL,
`REGION_CLIENT`    VARCHAR(100) NOT NULL,
CONSTRAINT `TB_CLIENT_PKEY` PRIMARY KEY(`ID_CLIENT`)
);


/*----------------------------------------------------------------------------
  --------------------- Table N°2 : icommerce.TB_PRODUIT ---------------------
  ----------------------------------------------------------------------------*/

-- DROP TABLE IF EXISTS `TB_PRODUIT` CASCADE ;
CREATE TABLE `TB_PRODUIT`
(
`CD_PRODUIT` 		 VARCHAR(50) NOT NULL,
`NOM_PRODUIT`		 VARCHAR(255) NOT NULL,
`PRIX_ACHAT_PRODUIT` DECIMAL(10,6) NOT NULL,
`PRIX_VENTE_PRODUIT` DECIMAL(10,5) NOT NULL,
CONSTRAINT `TB_PRODUIT_PKEY` PRIMARY KEY(`CD_PRODUIT`)										
);


/*----------------------------------------------------------------------------
  ---------------------- Table N°3 : icommerce.TB_VENTE ----------------------
  ----------------------------------------------------------------------------*/

-- DROP TABLE IF EXISTS `TB_VENTE` ;
CREATE TABLE `TB_VENTE`
(
`ID_VENTE` 	VARCHAR(50) NOT NULL,
`DT_VENTE` 	DATE NOT NULL,
`ID_CLIENT` VARCHAR(50) NOT NULL,
CONSTRAINT `TB_VENTE_PKEY` PRIMARY KEY(`ID_VENTE`), 											
CONSTRAINT `TB_VENTE_FKEY` FOREIGN KEY (`ID_CLIENT`) 
	REFERENCES `TB_CLIENT`(`ID_CLIENT`)
);


/*----------------------------------------------------------------------------
  ------------------ Table N°4 : icommerce.TB_DETAIL_VENTE -------------------
  ----------------------------------------------------------------------------*/

-- DROP TABLE IF EXISTS `TB_DETAIL_VENTE` ;
CREATE TABLE `TB_DETAIL_VENTE`
(
`ID_VENTE`    VARCHAR(50) NOT NULL,
`CD_PRODUIT`  VARCHAR(50) NOT NULL,	
`QTE_VENTE`   INTEGER NOT NULL,
`PRIX_VENTE`  DECIMAL(10,6) NOT NULL,
`PRIX_ACHAT`  DECIMAL(10,6) NOT NULL,
CONSTRAINT `TB_DETAIL_VENTE_PKEY` PRIMARY KEY(`ID_VENTE`,`CD_PRODUIT`), 											
CONSTRAINT `TB_VENTE_DETAIL_VTE_FKEY` FOREIGN KEY (`ID_VENTE`) 
	REFERENCES `TB_VENTE`(`ID_VENTE`), 
CONSTRAINT `TB_VENTE_DETAIL_PRODUIT_FKEY` FOREIGN KEY (`CD_PRODUIT`) 
	REFERENCES `TB_PRODUIT`(`CD_PRODUIT`)
);