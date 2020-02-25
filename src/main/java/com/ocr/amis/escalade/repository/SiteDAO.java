package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;

import java.util.List;


public interface SiteDAO {List<Site> findSiteByCritere(Recherche recherche);}
