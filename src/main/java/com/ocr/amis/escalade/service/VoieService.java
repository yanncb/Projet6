package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Voie;

import java.util.Date;
import java.util.List;

public interface VoieService {

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     * @param id
     * @return Voie ou null
     */
    Voie rechercherVoieParId(Integer id);

    /**
     * Permets d'instancier un secteur et de l'utiliser dans mes services.
     * @param secteur parametre du secteur
     * @return une nstance de secteur
     */
    Voie initialiser(Secteur secteur);

    /**
     * Ajouter une voie
     * @param voie informations de la voie
     */
    void ajouterVoie(Voie voie);

    /**
     * modifier Voie
     * @param voie information modifié de la voie
     */
    void modifierVoie(Voie voie);

    /**
     * supprimer voie
     * @param id l'id de la voie à supprimer
     */
    void supprimerVoie(Integer id);
}
