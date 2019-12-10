package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Longueur;
import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Voie;

import java.util.List;

public interface LongueurService {


    List<Longueur> rechercherToutesLesLongueurs();

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     * @param id
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

    void ajouterLongueur(Longueur longueur);
    void modifierLongueur(Longueur longueur);
    void supprimerLongueur(Integer id);
    void recherche(Longueur longueur);
}
