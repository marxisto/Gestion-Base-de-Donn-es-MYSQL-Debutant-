/*----------------------------------------------------------------------------
  ---------------------- Script de création des indexes  ---------------------
  ----------------------------------------------------------------------------*/

-- Définir la base de données ou le schéma à utiliser 
use `ICOMMERCE`;


/*----------------------------------------------------------------------------
  ------------------ Table N°1 : icommerce.TB_TYPE_CLIENT --------------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_LB_TYPE_CLIENT` ON `TB_TYPE_CLIENT`; 
CREATE INDEX `IDX_LB_TYPE_CLIENT`
ON `TB_TYPE_CLIENT` (`LB_TYPE_CLIENT`);


/*----------------------------------------------------------------------------
  --------------------- Table N°2 : icommerce.TB_CLIENT ----------------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_NOM_PREN_CLIENT` ON `TB_CLIENT`;
CREATE UNIQUE INDEX `IDX_NOM_PREN_CLIENT`
ON `TB_CLIENT` (`NOM_CLIENT`, `PREN_CLIENT`);

-- DROP INDEX `IDX_CD_POSTAL_CLIENT` ON `TB_CLIENT` ;
CREATE INDEX `IDX_CD_POSTAL_CLIENT`
ON `TB_CLIENT` (`CD_POSTAL_CLIENT`);

-- DROP INDEX `IDX_VILLE_CLIENT` ON `TB_CLIENT`;
CREATE INDEX `IDX_VILLE_CLIENT`
ON `TB_CLIENT` (`VILLE_CLIENT`);

-- DROP INDEX `IDX_PAYS_CLIENT` ON `TB_CLIENT`;
CREATE INDEX `IDX_PAYS_CLIENT`
ON `TB_CLIENT` (`PAYS_CLIENT`);

-- DROP INDEX `IDX_REGION_CLIENT` ON `TB_CLIENT`;
CREATE INDEX `IDX_REGION_CLIENT`
ON `TB_CLIENT` (`REGION_CLIENT`);


/*----------------------------------------------------------------------------
  -------------------- Table N°3 : icommerce.TB_CATEGORIE --------------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_LB_CATEGORIE` ON `TB_CATEGORIE`;
CREATE INDEX `IDX_LB_CATEGORIE`
ON `TB_CATEGORIE` (`LB_CATEGORIE`);


/*----------------------------------------------------------------------------
  ------------------ Table N°4 : icommerce.TB_SOUS_CATEGORIE -----------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_LB_SOUS_CATEGORIE` ON `TB_SOUS_CATEGORIE`;
CREATE INDEX `IDX_LB_SOUS_CATEGORIE`
ON `TB_SOUS_CATEGORIE`  (`LB_SOUS_CATEGORIE`);


/*----------------------------------------------------------------------------
  --------------------- Table N°5 : icommerce.TB_PRODUIT ---------------------
  ----------------------------------------------------------------------------*/
-- DROP INDEX `IDX_NOM_PRODUIT` ON `TB_PRODUIT`;
CREATE INDEX `IDX_NOM_PRODUIT`
ON `TB_PRODUIT` (`NOM_PRODUIT`);

-- DROP INDEX `IDX_PRIX_ACHAT_PRODUIT` ON `TB_PRODUIT`;
CREATE INDEX `IDX_PRIX_ACHAT_PRODUIT`
ON `TB_PRODUIT` (`PRIX_ACHAT_PRODUIT`);

-- DROP INDEX `IDX_PRIX_VENTE_PRODUIT` ON `TB_PRODUIT`;
CREATE INDEX `IDX_PRIX_VENTE_PRODUIT`
ON `TB_PRODUIT` (`PRIX_VENTE_PRODUIT`);


/*----------------------------------------------------------------------------
  ---------------------- Table N°6 : icommerce.TB_VENTE ----------------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_DT_VENTE` ON `TB_VENTE`;
CREATE INDEX `IDX_DT_VENTE`
ON `TB_VENTE` (`DT_VENTE`);


/*----------------------------------------------------------------------------
  ------------------ Table N°7 : icommerce.TB_DETAIL_VENTE -------------------
  ----------------------------------------------------------------------------*/
  
-- DROP INDEX `IDX_QTE_VENTE` ON `TB_DETAIL_VENTE`; 
CREATE INDEX `IDX_QTE_VENTE` 
ON `TB_DETAIL_VENTE` (`QTE_VENTE`);

-- DROP INDEX `IDX_PRIX_VENTE` ON `TB_DETAIL_VENTE`;
CREATE INDEX `IDX_PRIX_VENTE`
ON `TB_DETAIL_VENTE` (`PRIX_VENTE`);

-- DROP INDEX `IDX_PRIX_ACHAT` ON `TB_DETAIL_VENTE`;
CREATE INDEX `IDX_PRIX_ACHAT`
ON `TB_DETAIL_VENTE` (`PRIX_ACHAT`);