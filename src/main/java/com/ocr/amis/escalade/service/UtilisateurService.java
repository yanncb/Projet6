package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Utilisateur;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UtilisateurService extends UserDetailsService {



    List<Utilisateur> rechercherTousLesUtilisateurs();

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id
     * @return Voie ou null
     */
    Utilisateur rechercherUtilisateurParId(Integer id);

    void ajouterUtilisateur(Utilisateur utilisateur);

    void modifierUtilisateur(Utilisateur utilisateur);

    void supprimerUtilisateur(Integer utilisateurId);

    Utilisateur chargementUtilisateurParPseudo(String pseudo);

    public UserDetails loadUserByUsername(String login);




}
