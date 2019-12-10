package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Utilisateur;
import com.ocr.amis.escalade.repository.UtilisateurRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import java.util.Objects;

public class UserService implements UserDetailsService {

    private final UtilisateurRepository utilisateurRepository;

    public UserService(UtilisateurRepository utilisateurRepository) {
        this.utilisateurRepository = utilisateurRepository;
    }

    @Override
    public UserDetails loadUserByUsername(String pseudo) throws UsernameNotFoundException {

        Objects.requireNonNull(pseudo);
        Utilisateur utilisateur = utilisateurRepository.findByPseudo(pseudo)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));

        return utilisateur;
    }

}
