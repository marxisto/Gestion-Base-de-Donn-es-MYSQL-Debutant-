-- Définir la base de données ou le schéma à utiliser 
use icommerce; 

/*-------------------------------------------------------------------------------------------------------------------------
  -------------------------------- Création d'une table temporaire et insertion des données -------------------------------
  -------------------------------------------------------------------------------------------------------------------------*/
/* Création d'une table temporaire TB_PRODUIT_TEMP à partir de la table TB_PRODUIT */
CREATE TABLE TB_PRODUIT_TEMP AS SELECT * FROM  TB_PRODUIT;

/* Affichage des données de la table TB_PRODUIT_TEMP */
SELECT * FROM TB_PRODUIT_TEMP;


/* Insertion des données dans la table TB_PRODUIT_TEMP : 
Cette requête est à exécuter après chaque suppression complète des données présentes dans la table TB_PRODUIT_TEMP
*/
INSERT INTO TB_PRODUIT_TEMP
SELECT * FROM  TB_PRODUIT;



/*-------------------------------------------------------------------------------------------------------------------------
  ------------------------------------ Quelques requêtes SQL de suppression de données ------------------------------------
  -------------------------------------------------------------------------------------------------------------------------*/

/* Suppression des données présentes dans la table TB_PRODUIT_TEMP*/
-- 1ère solution
TRUNCATE TABLE TB_PRODUIT_TEMP;

-- 2ème solution 
DELETE FROM TB_PRODUIT_TEMP;


/* Suppression des données présentes dans la table TB_PRODUIT_TEMP
dont le prix d'achat est supérieur à 100*/
DELETE 
FROM TB_PRODUIT_TEMP
WHERE PRIX_ACHAT_PRODUIT >100;


/* Suppression des données présentes dans la table TB_PRODUIT_TEMP
dont le code produit est présent dans la table  TB_PRODUIT*/

-- 1ère solution
DELETE 
FROM TB_PRODUIT_TEMP a
WHERE EXISTS (SELECT * 
			  FROM TB_PRODUIT b 
			  WHERE a.CD_PRODUIT = b.CD_PRODUIT) ;

-- 2ème solution
DELETE 
FROM TB_PRODUIT_TEMP
WHERE CD_PRODUIT IN (SELECT CD_PRODUIT
			  		   FROM TB_PRODUIT);
			  
/* Suppression de la table TB_PRODUIT_TEMP*/
DROP TABLE IF EXISTS TB_PRODUIT_TEMP;