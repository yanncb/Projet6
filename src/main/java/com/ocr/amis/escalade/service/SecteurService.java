package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Site;

public interface SecteurService {

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id
     * @return Voie ou null
     */
    Secteur rechercherSecteurParId(Integer id);

    /**
     * Initialise un secteur avec un site
     *
     * @param site utiliser pour l'initialisation
     * @return un nouveau secteur
     */
    Secteur initialiser(Site site);

    /**
     * AjouterSecteur recupere un secteur et l'ajoute en base
     *
     * @param secteur contient la nouvelle secteur saisie par utilisateur pour le creer en base
     */
    void ajouterSecteur(Secteur secteur);

    /**
     * ModifierSecteur recupere un secteur
     *
     * @param secteur contient les champs du secteur saisie par utilisateur pour le modifié en base
     */
    void modifierSecteur(Secteur secteur);

    /**
     * supprimerSecteur recupere un id
     *
     * @param id permets de supprimer un secteur depuis un id
     */
    void supprimerSecteur(Integer id);

}


