package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Site;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SiteRepository extends JpaRepository<Site, Integer> {

    //C'est un repository, alors pas besoin de faire d'implémentaition
    //je rajoute une méthode dans l'interface en resspectant une certaine convention, et jpa me crée automatiquement l'implémentation.
    //https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
    List<Site> findByTag(String tag);

//    List<Site> findByPaysInAndNomNotEqualsOrderByPays(List<String> pays, String nomToExclude);

}
