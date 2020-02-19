package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Topo;
import com.ocr.amis.escalade.models.Utilisateur;
import com.ocr.amis.escalade.repository.TopoRepository;
import com.ocr.amis.escalade.service.TopoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TopoServiceImpl implements TopoService {

    @Autowired
    TopoRepository topoRepository;

    @Override
    public List<Topo> rechercherTousLesTopos() {
        return topoRepository.findAll();
    }

    @Override
    public List<Topo> rechercherTousLesToposPourUtilisateur(String pseudo) {

        return topoRepository.rechercherTousLesToposPourUtilisateur(pseudo);
    }


    @Override
    public Topo rechercherTopoParId(Integer id) {
        Optional<Topo> optionalTopo = topoRepository.findById(id);
        if (optionalTopo.isPresent()) {
            return optionalTopo.get();
        }
        return null;
    }

    public void ajouterTopo(Topo topo) {
        topoRepository.save(topo);
    }

    @Override
    public void modifierTopo(Topo topo) {
        topoRepository.save(topo);
    }

    @Override
    public void supprimerTopo(Integer id) {
        topoRepository.deleteById(id);
    }

    @Override
    public void demandeReservation(Topo topo) {
        topo.setDemandeReservation("En cours");
        topo.setUtilisateurPossedantTopo(topo.getUtilisateurPossedantTopo());
        topoRepository.save(topo);
    }

}
