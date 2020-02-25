package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Voie;
import com.ocr.amis.escalade.repository.VoieRepository;
import com.ocr.amis.escalade.service.VoieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class VoieServiceImpl implements VoieService {

    @Autowired
    private VoieRepository voieRepository;

    @Override
    public Voie rechercherVoieParId(Integer id) {
        Optional<Voie> optionalVoie = voieRepository.findById(id);
        if (optionalVoie.isPresent()) {
            return optionalVoie.get();
        }
        return null;
    }

    @Override
    public Voie initialiser(Secteur secteur) {
        Voie voie = new Voie();
        voie.setSecteur(secteur);
        return voie;
    }

    public void ajouterVoie(Voie voie) {

        voieRepository.save(voie);
    }

    @Override
    public void modifierVoie(Voie voie) {
        voieRepository.save(voie);
    }

    public void supprimerVoie(Integer id) {
        voieRepository.deleteById(id);
    }
}
