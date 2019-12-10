package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Site;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.List;

public interface SecteurService {

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     * @param id
     * @return Voie ou null
     */
    Secteur rechercherSecteurParId(Integer id);

    /**
     * Initialise un secteur avec un site
     * @param site utiliser pour l'initialisation
     * @return un nouveau secteur
     */
    Secteur initialiser(Site site);
    void ajouterSecteur(Secteur secteur);
    void modifierSecteur(Secteur secteur);
    void supprimerSecteur(Integer id);
    void recherche(Secteur secteur);
}


