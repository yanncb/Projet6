package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Voie;

import java.util.Date;
import java.util.List;

public interface VoieService {

    List<Voie> rechercherToutesLesvoies();

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     * @param id
     * @return Voie ou null
     */
    Voie rechercherVoieParId(Integer id);

    Voie initialiser(Secteur secteur);
    void ajouterVoie(Voie voie);
    void modifierVoie(Voie voie);
    void supprimerVoie(Integer id);
//    List<Voie> recherche(String nomVoie, String longeur, String difficulte);
}
