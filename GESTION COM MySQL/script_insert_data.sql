/*----------------------------------------------------------------------------
  --------- Script d'insertion de données dans les différentes tables --------
  ----------------------------------------------------------------------------*/ 

-- Définir la base de données ou le schéma à utiliser 
use `ICOMMERCE`; 


/*----------------------------------------------------------------------------
  ------------------ Table N°1 : icommerce.TB_TYPE_CLIENT --------------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_TYPE_CLIENT
SELECT COUNT(1) FROM TB_TYPE_CLIENT;

-- Insertion des données dans la table TB_TYPE_CLIENT
INSERT INTO TB_TYPE_CLIENT (CD_TYPE_CLIENT, LB_TYPE_CLIENT)
VALUES 
('T004', 'Autre type');

-- Sélection des nouvelles données insérées dans la table TB_TYPE_CLIENT
SELECT * FROM TB_TYPE_CLIENT WHERE CD_TYPE_CLIENT = 'T004';


/*----------------------------------------------------------------------------
  --------------------- Table N°2 : icommerce.TB_CLIENT ----------------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_CLIENT
SELECT COUNT(1) FROM TB_CLIENT;

-- Insertion des données dans la table TB_CLIENT
INSERT INTO  TB_CLIENT(ID_CLIENT, NOM_CLIENT, PREN_CLIENT,  VILLE_CLIENT, PAYS_CLIENT, REGION_CLIENT, CD_TYPE_CLIENT)
VALUES 
('99999999', 'Clients', 'Divers', 'Cotonou', 'Bénin', 'Afrique de l''Ouest', 'T003' );

-- Sélection des nouvelles données insérées dans la table TB_CLIENT
SELECT * FROM TB_CLIENT WHERE ID_CLIENT = '99999999';


/*----------------------------------------------------------------------------
  -------------------- Table N°3 : icommerce.TB_CATEGORIE --------------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_CATEGORIE
SELECT COUNT(1) FROM TB_CATEGORIE;

-- Insertion des données dans la table TB_CATEGORIE
INSERT INTO TB_CATEGORIE
VALUES 
('C004', 'Autre catégorie');

-- Sélection des nouvelles données insérées dans la table TB_CATEGORIE
SELECT * FROM TB_CATEGORIE WHERE CD_CATEGORIE = 'C004';


/*----------------------------------------------------------------------------
  ------------------ Table N°4 : icommerce.TB_SOUS_CATEGORIE -----------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_SOUS_CATEGORIE
SELECT COUNT(1) FROM TB_SOUS_CATEGORIE;

-- Insertion des données dans la table TB_SOUS_CATEGORIE
INSERT INTO TB_SOUS_CATEGORIE
VALUES 
('SC019','Inconnu', 'C004'),
('SC020','Autre sous catégorie', 'C004');

-- Sélection des nouvelles données insérées dans la table TB_SOUS_CATEGORIE
SELECT * FROM TB_SOUS_CATEGORIE WHERE CD_SOUS_CATEGORIE IN ('SC019', 'SC020');



/*----------------------------------------------------------------------------
  --------------------- Table N°5 : icommerce.TB_PRODUIT ---------------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_PRODUIT
SELECT COUNT(1) FROM TB_PRODUIT ;

-- Insertion des données dans la table TB_PRODUIT
INSERT INTO  TB_PRODUIT (CD_PRODUIT, NOM_PRODUIT, PRIX_ACHAT_PRODUIT, PRIX_VENTE_PRODUIT, CD_SOUS_CATEGORIE)
VALUES 
('P999997', 'Autre produit', 9.99, 14.99, 'SC018');

-- Sélection des nouvelles données insérées dans la table TB_PRODUIT
SELECT * FROM TB_PRODUIT WHERE CD_PRODUIT = 'P999997';



/*----------------------------------------------------------------------------
  ---------------------- Table N°6 : icommerce.TB_VENTE ----------------------
  ----------------------------------------------------------------------------*/
-- Sélection du nombre de données présentes dans la table TB_VENTE
SELECT COUNT(1) FROM TB_VENTE;

-- Insertion des données dans la table TB_VENTE
INSERT INTO TB_VENTE(ID_VENTE, DT_VENTE, ID_CLIENT)
VALUES
('CA-2022-AB10015140-00009', CURRENT_DATE, '99999999');

-- Sélection des nouvelles données insérées dans la table TB_VENTE
SELECT * FROM TB_VENTE WHERE ID_VENTE = 'CA-2022-AB10015140-00009';


/*----------------------------------------------------------------------------
  ------------------ Table N°7 : icommerce.TB_DETAIL_VENTE -------------------
  ----------------------------------------------------------------------------*/
--- Sélection du nombre de données présentes dans la table TB_DETAIL_VENTE
SELECT COUNT(1) FROM TB_DETAIL_VENTE;

-- Insertion des données dans la table TB_DETAIL_VENTE
INSERT INTO TB_DETAIL_VENTE(ID_VENTE, CD_PRODUIT, QTE_VENTE, PRIX_VENTE, PRIX_ACHAT)
VALUES
('CA-2022-AB10015140-00009', 'P999997', 10, 14.99, 9.99);

-- Sélection des nouvelles données insérées dans la table TB_DETAIL_VENTE
SELECT * FROM TB_DETAIL_VENTE WHERE ID_VENTE = 'CA-2022-AB10015140-00009' AND CD_PRODUIT IN ('P999997') ;
