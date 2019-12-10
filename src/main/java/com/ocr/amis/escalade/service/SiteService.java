package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Commentaire;
import com.ocr.amis.escalade.models.Site;

import java.util.List;

public interface SiteService {


    List<Site> rechercherTousLesSites();

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id
     * @return Voie ou null
     */
    Site rechercherSiteParId(Integer id);

    void ajouterSite(Site site);

    void modifierSite(Site site);

    void supprimerSite(Integer siteId);

    Commentaire rechercherCommentaireParId(Integer id);

    Commentaire ajouterCommentaire(int siteId, String texte, String userName);

    void modifierCommentaire(Commentaire commentaire);

    void supprimerCommentaire(Integer commentaireId);
}
