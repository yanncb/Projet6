package com.ocr.amis.escalade.repository;

import com.ocr.amis.escalade.models.Utilisateur;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UtilisateurRepository extends JpaRepository<Utilisateur, Integer> {
    @Query("select u from Utilisateur u left join fetch u.roles where u.pseudo =:pseudo")
    Optional<Utilisateur> findByPseudo(@Param("pseudo") String pseudo);
}

