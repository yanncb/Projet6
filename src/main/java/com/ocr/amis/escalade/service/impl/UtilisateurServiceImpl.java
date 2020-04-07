package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Role;
import com.ocr.amis.escalade.models.Utilisateur;
import com.ocr.amis.escalade.repository.RoleRepository;
import com.ocr.amis.escalade.repository.UtilisateurRepository;
import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class UtilisateurServiceImpl implements UtilisateurService {

    @Autowired
    private UtilisateurRepository utilisateurRepository;

    @Autowired
    public UtilisateurServiceImpl(UtilisateurRepository utilisateurRepository) {
        this.utilisateurRepository = utilisateurRepository;
    }

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public List<Utilisateur> rechercherTousLesUtilisateurs() {
        return utilisateurRepository.findAll();
    }


    @Override
    public Utilisateur chargementUtilisateurParPseudo(String pseudo) {
        Optional<Utilisateur> optionalUtilisateur = utilisateurRepository.findByPseudo(pseudo);
        return optionalUtilisateur.isPresent() ? optionalUtilisateur.get() : null;
    }

    @Override
    public UserDetails loadUserByUsername(String login)
            throws UsernameNotFoundException, DataAccessException {
        Utilisateur utilisateur = chargementUtilisateurParPseudo(login);
        if (utilisateur == null) {
            throw new UsernameNotFoundException(login + " non trouvé");
        }
        return utilisateur;
    }

    @Override
    public void ajouterUtilisateur(Utilisateur utilisateur) {
        String password = utilisateur.getMotDePasse();
        String encryptedPassword = passwordEncoder.encode(password);
        utilisateur.setMotDePasse(encryptedPassword);
        Role utilisateurRole = roleRepository.findByRolNom("MEMBRE");
        utilisateur.setRoles(new ArrayList<Role>(Arrays.asList(utilisateurRole)));
        utilisateurRepository.save(utilisateur);
    }

}
