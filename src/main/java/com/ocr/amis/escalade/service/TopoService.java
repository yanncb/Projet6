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
     * @param id du topo
     * @return Voie ou null
     */
    Topo rechercherTopoParId(Integer id);

    /**
     * Permet d'ajouter le topo en base
     * @param topo les informations du topo
     */
    void ajouterTopo(Topo topo);

    /**
     * Permet de modifier le topo en base
     * @param topo les champs d'information a modifié
     */
    void modifierTopo(Topo topo);

    /**
     * permet de supprimer un topo
     * @param topoId supprimerle topo en fonction de son ID
     */
    void supprimerTopo(Integer topoId);

    /**
     * Permet de modifier le champ demandeReservation dans la table topo
     * @param topo permet de recuperer des informations presente dans l'instance de topo et d'en setter par la suite
     * @param utilisateur passe les informations de l'utilisateur pour effectuer une reservation.
     */
    void demandeReservation(Topo topo, Utilisateur utilisateur);

    /**
     * permet de modifier des champs en base
     * @param topo information contenu dans le topo
     */
    void validationReservation(Topo topo);

    /**
     * permet de modifier des champs en base
     * @param topo information contenu dans le topo
     */
    void refusReservation(Topo topo);

}
