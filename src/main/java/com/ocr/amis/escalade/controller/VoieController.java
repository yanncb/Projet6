package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Voie;
import com.ocr.amis.escalade.service.SecteurService;
import com.ocr.amis.escalade.service.VoieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class VoieController {

    @Autowired
    private VoieService voieService;

    @Autowired
    private SecteurService secteurService;

    @GetMapping("/voie/{id}")
    public String voie(Model model, @PathVariable Integer id) {
        Voie voie = voieService.rechercherVoieParId(id);
        model.addAttribute("voie", voie);
        model.addAttribute("longueur", voie.getLongueurlist());
        return "/voie";
    }

    // permet d'afficher mon formulaire qui me permettra par la suite d'ajouter une voie
    @GetMapping("/ajout-voie")
    public String ajouterVoie(Model model, @RequestParam int secteurId) {
        model.addAttribute("voie", voieService.initialiser(secteurService.rechercherSecteurParId(secteurId)));
        return "/ajout-voie";
    }

    // permet de recuperer le formulaire d'ajout de liste et de rediriger sur la page pour affichage.
    @PostMapping("/ajout-voie")
    public String ajouterVoie(@ModelAttribute("voie") Voie voie) {
        voieService.ajouterVoie(voie);
        return "redirect:/secteur/" + voie.getSecteur().getId();
    }

    @GetMapping("/modifier-voie/{id}")
    public String recupererVoie(Model model, @PathVariable Integer id) {
        model.addAttribute("voie", voieService.rechercherVoieParId(id));
        return "/modifier-voie";
    }

    @PostMapping("/modifier-voie")
    public String modifierVoie(@ModelAttribute("voie") Voie voie) {
        voieService.modifierVoie(voie);
        return "redirect:/secteur/" + voie.getSecteur().getId();
    }

    @GetMapping("/supprimer-voie/{idVoie}/{idSecteur}")
    public String supprimerVoie(@PathVariable Integer idVoie, @PathVariable Integer idSecteur) {
        voieService.supprimerVoie(idVoie);
        return "redirect:/secteur/" + idSecteur;
    }

}