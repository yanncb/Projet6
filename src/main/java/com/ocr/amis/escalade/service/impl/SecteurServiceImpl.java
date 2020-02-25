package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Site;
import com.ocr.amis.escalade.repository.SecteurRepository;
import com.ocr.amis.escalade.service.SecteurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class SecteurServiceImpl implements SecteurService {

    @Autowired
    private SecteurRepository secteurRepository;

    @Override
    public Secteur rechercherSecteurParId(Integer id) {
        Optional<Secteur> optionalSecteur = secteurRepository.findById(id);
        if (optionalSecteur.isPresent()) {
            return optionalSecteur.get();
        }
        return null;
    }

    @Override
    public Secteur initialiser(Site site) {
        Secteur secteur = new Secteur();
        secteur.setSite(site);
        return secteur;
    }

    public void ajouterSecteur(Secteur secteur) {
        secteurRepository.save(secteur);
    }

    @Override
    public void modifierSecteur(Secteur secteur) {
        secteurRepository.save(secteur);
    }

    public void supprimerSecteur(Integer id) {
        secteurRepository.deleteById(id);
    }

}
