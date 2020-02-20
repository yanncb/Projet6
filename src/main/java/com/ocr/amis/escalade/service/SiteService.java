package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Commentaire;
import com.ocr.amis.escalade.models.Site;

import java.util.List;

public interface SiteService {

    /**
     * rechercherTouslesSites
     * @return une list de tous les sites presents
     */
    List<Site> rechercherTousLesSites();

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id
     * @return Voie ou null
     */
    Site rechercherSiteParId(Integer id);


    /**
     * AjouterSite recupere un site et l'ajoute en base
     * @param site contient le nouveau site saisie par utilisateur pour le creer en base
     */
    void ajouterSite(Site site);

    /**
     * ModifierSite recupere un site et le modifie en base
     * @param site contient les champs de site saisie par utilisateur pour le modifié en base
     */
    void modifierSite(Site site);

    /**
     * supprimerSite recupere un id
     * @param siteId permets de supprimer une longueur par depuis un id
     */
    void supprimerSite(Integer siteId);

    /**
     * rechercherCommentaireParId
     * @param id du commentaire
     * @return le commentaire associé
     */
    Commentaire rechercherCommentaireParId(Integer id);

    /**
     * ajouterCommentaire
     * @param siteId
     * @param texte
     * @param userName
     * @return contient le nouveau commentaire saisie par utilisateur pour le creer en base
     */
    Commentaire ajouterCommentaire(int siteId, String texte, String userName);

    /**
     * modifierCommentaire
     * @param commentaire le commentaire saisi par l'utilisateur, pour qu'il soit sauvegarder en base
     */
    void modifierCommentaire(Commentaire commentaire);

    /**
     * supprimerCommentaire
     * @param commentaireId l'id du commentaire pour pouvoir effectuer une suppression par rapport à son id.
     */
    void supprimerCommentaire(Integer commentaireId);
}
