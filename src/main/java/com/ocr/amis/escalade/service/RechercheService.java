package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;

import java.util.List;

public interface RechercheService {
    List<Site> rechercherSites(Recherche recherche);
}

