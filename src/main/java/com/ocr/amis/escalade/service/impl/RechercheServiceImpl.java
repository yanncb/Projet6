package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;
import com.ocr.amis.escalade.repository.SiteDAO;
import com.ocr.amis.escalade.repository.SiteRepository;
import com.ocr.amis.escalade.service.RechercheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RechercheServiceImpl implements RechercheService {


    @Autowired
    SiteRepository siteRepository;

    @Autowired
    SiteDAO siteDAO;

    @Override
    public List<Site> rechercherSites(Recherche recherche) {
        List<Site> maListe = siteDAO.findSiteByCritere(recherche);
        return maListe;
    }


}
