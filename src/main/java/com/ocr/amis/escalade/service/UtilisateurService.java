package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Utilisateur;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UtilisateurService extends UserDetailsService {


    /**
     * Permets de chercher tous les utilisateurs
     *
     * @return liste d'utilisateur
     */
    List<Utilisateur> rechercherTousLesUtilisateurs();

    /**
     * chargementUtilisateur par pseudo
     *
     * @param pseudo le parametre pseudo pour faire notre recherche
     * @return l'utilisateur ayant le bon parametre pseudo
     */
    Utilisateur chargementUtilisateurParPseudo(String pseudo);

    /**
     * ajouter Utilisateur
     *
     * @param utilisateur information d'un utilisateur pour sauvegard en base
     */
    void ajouterUtilisateur(Utilisateur utilisateur);


}
