package com.ocr.amis.escalade.service;

import com.ocr.amis.escalade.models.Topo;
import com.ocr.amis.escalade.models.Utilisateur;

import java.util.List;

public interface TopoService {

    List<Topo> rechercherTousLesTopos();

    List<Topo> rechercherTousLesToposPourUtilisateur(String pseudo);

    /**
     * Retourne la voie avec l'id <i>id</i> ou null si aucune voie avec l'id en paramètre n'est trouvée
     *
     * @param id
     * @return Voie ou null
     */
    Topo rechercherTopoParId(Integer id);

    void ajouterTopo(Topo topo);

    void modifierTopo(Topo topo);

    void supprimerTopo(Integer topoId);

    void demandeReservation(Topo topo, Utilisateur utilisateur);

}
