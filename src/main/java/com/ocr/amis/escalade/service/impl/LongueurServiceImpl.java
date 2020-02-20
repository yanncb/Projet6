package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Longueur;
import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Voie;
import com.ocr.amis.escalade.repository.LongueurRepository;
import com.ocr.amis.escalade.service.LongueurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LongueurServiceImpl implements LongueurService {


        @Autowired
        private LongueurRepository longueurRepository;

        @Override
        public Longueur rechercherLongueurParId(Integer id) {
            Optional<Longueur> optionalLongueur = longueurRepository.findById(id);
            if (optionalLongueur.isPresent()) {
                return optionalLongueur.get();
            }
            return null;
        }

    @Override
    public Longueur initialiser(Voie voie) {
        Longueur longueur = new Longueur();
        longueur.setVoie(voie);
        return longueur;
    }

        public void ajouterLongueur(Longueur longueur) {
            longueurRepository.save(longueur);
        }

        @Override
        public void modifierLongueur(Longueur longueur) {
            longueurRepository.save(longueur);
        }

        public void supprimerLongueur(Integer id) {
            longueurRepository.deleteById(id);
        }


    }

