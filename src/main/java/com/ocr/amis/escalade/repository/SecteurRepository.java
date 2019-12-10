package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Secteur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SecteurRepository extends JpaRepository<Secteur, Integer> {


}
