package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Voie;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface VoieRepository extends JpaRepository<Voie, Integer> {

}
