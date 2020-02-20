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
    public void demandeReservation(Topo topo, Utilisateur utilisateur) {
        topo.setUtilisateurReserveTopo(utilisateur);
        topo.setDemandeReservation("En cours");
        topoRepository.save(topo);
    }

    @Override
    public void validationReservation(Topo topo) {
        topo.setDemandeReservation("Validée");
        topo.setDispo(false);
        topo.setReservation(true);
        topoRepository.save(topo);
    }

    @Override
    public void refusReservation(Topo topo) {
        topo.setDemandeReservation("Refusée");
        topo.setDispo(true);
        topo.setReservation(false);
        topoRepository.save(topo);
    }


}
