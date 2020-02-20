package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;

import java.util.List;

public interface RechercheService {

    /**
     * RechercherSite recupere une liste de parametres saisi par l'utilisateur
     * @param recherche effectue la recherche avec une requete jpql
     * @return une liste de site correspondant a la recherche.
     */
    List<Site> rechercherSites(Recherche recherche);
}

