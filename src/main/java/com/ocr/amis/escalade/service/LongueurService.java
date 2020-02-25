package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Longueur;
import com.ocr.amis.escalade.models.Voie;

public interface LongueurService {

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id Id de la voie
     * @return Voie ou null
     */
    Longueur rechercherLongueurParId(Integer id);

    /**
     * Initialiser une nouvelle longueur avec une voie
     *
     * @param voie voie à utiliser pour initialiser la longueur
     * @return une nouvelle longueur
     */
    Longueur initialiser(Voie voie);

    /**
     * AjouterLongueur recupere une Longueur et l'ajoute en base
     *
     * @param longueur contient la nouvelle longueur saisie par utilisateur pour la creer en base
     */
    void ajouterLongueur(Longueur longueur);

    /**
     * ModifierLongueur recupere une Longueur et la modifie en base
     *
     * @param longueur contient les champs de longueur saisie par utilisateur pour la modifié en base
     */
    void modifierLongueur(Longueur longueur);

    /**
     * supprimerLongueur recupere un id
     *
     * @param id permets de supprimer une longueur par depuis un id
     */
    void supprimerLongueur(Integer id);

}
