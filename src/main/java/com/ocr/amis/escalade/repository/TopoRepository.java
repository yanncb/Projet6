package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Topo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TopoRepository extends JpaRepository<Topo, Integer> {
    @Query("select t from Topo t join Utilisateur u ON u.utilisateurId = t.utilisateurPossedantTopo WHERE u.pseudo = :pseudo")
    List<Topo> rechercherTousLesToposPourUtilisateur(@Param("pseudo") String pseudo);
}
