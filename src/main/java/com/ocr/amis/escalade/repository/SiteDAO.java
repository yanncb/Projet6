package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface SiteDAO {

    List<Site> findSiteByCritere(Recherche recherche);


}
