package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.models.Topo;
import com.ocr.amis.escalade.models.Utilisateur;
import com.ocr.amis.escalade.service.TopoService;
import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;


@Controller
public class TopoController {

    @Autowired
    private TopoService topoService;

    @Autowired
    private UtilisateurService utilisateurService;

    @GetMapping("/liste-de-mes-topos")
    public String mesTopos(Model model, Authentication authentication) {
        model.addAttribute("topos", topoService.rechercherTousLesToposPourUtilisateur(authentication.getName()));
        return "/liste-de-mes-topos";
    }

    @GetMapping("/liste-des-topos")
    public String tousLesTopos(Model model, Authentication authentication) {
        model.addAttribute("topos", topoService.rechercherTousLesTopos());
        return "/liste-des-topos";
    }

    @GetMapping("/ajout-topo")
    public String ajout(Model model, Authentication authentication) {
        model.addAttribute("utilisateur", authentication);
        model.addAttribute("topo", new Topo());
        return "/ajout-topo";
    }

    @PostMapping("/ajout-topo")
    public String ajoutTopo(@ModelAttribute("topo") Topo topo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        topo.setUtilisateurPossedantTopo(utilisateurService.chargementUtilisateurParPseudo(authentication.getName()));
        topoService.ajouterTopo(topo);
        return "redirect:/liste-de-mes-topos";
    }

    @GetMapping("/modifier-topo/{id}")
    public String recupererTopo(Model model, @PathVariable Integer id) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("utilisateur", authentication);
        model.addAttribute("topo", topoService.rechercherTopoParId(id));
        return "/modifier-topo";
    }

    @PostMapping("/modifier-topo")
    public String modifierTopo(@ModelAttribute("topo") Topo topo) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        topo.setUtilisateurPossedantTopo(utilisateurService.chargementUtilisateurParPseudo(authentication.getName()));
        topoService.modifierTopo(topo);
        return "redirect:/liste-de-mes-topos";
    }

    @GetMapping("/supprimer-topo/{topoId}")
    public String supprimerTopo(Model model, @PathVariable Integer topoId) {
        topoService.supprimerTopo(topoId);
        return "redirect:/liste-de-mes-topos";
    }

    @GetMapping("/reserver-topo/{topoId}")
    public String demandeReservation(Model model, @PathVariable Integer topoId){
        model.addAttribute("topo", topoService.rechercherTopoParId(topoId));
        return ("/reserver-topo");
    }

    @PostMapping("/reserver-topo")
    public String envoieReservation(@ModelAttribute("topo") Topo topo) {
        Topo topoAReserver = topoService.rechercherTopoParId(topo.getId());
        Utilisateur utilisateur = utilisateurService.chargementUtilisateurParPseudo(SecurityContextHolder.getContext().getAuthentication().getName());
        topoService.demandeReservation(topoAReserver, utilisateur);
        return ("redirect:/liste-de-mes-topos");
    }
}
