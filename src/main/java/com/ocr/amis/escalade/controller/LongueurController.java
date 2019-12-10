package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Longueur;
import com.ocr.amis.escalade.service.LongueurService;
import com.ocr.amis.escalade.service.VoieService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LongueurController {

    @Autowired
    private VoieService voieService;

    @Autowired
    private LongueurService longueurService;

    @GetMapping("/ajout-longueur")
    public String ajouterLongueur(Model model, @RequestParam int voieId) {
        model.addAttribute("longueur", longueurService.initialiser(voieService.rechercherVoieParId(voieId)));
        return "/ajout-longueur";
    }

    @PostMapping("/ajout-longueur")
    public String ajouterLongueur(@ModelAttribute("longueur") Longueur longueur) {
        longueurService.ajouterLongueur(longueur);
        return "redirect:/voie/" + longueur.getVoie().getId();
    }

    @GetMapping("modifier-longueur/{id}")
    public String recupererLongueur(Model model, @PathVariable Integer id) {
        model.addAttribute("longueur", longueurService.rechercherLongueurParId(id));
        return "/modifier-longueur";
    }

    @PostMapping("/modifier-longueur")
    public String modifierVoie(@ModelAttribute("longueur") Longueur longueur) {
        longueurService.modifierLongueur(longueur);
        return "redirect:/voie/" + longueur.getVoie().getId();
    }

    @GetMapping("/supprimer-longueur/{idLongueur}/{idVoie}")
    public String supprimerLongueur(@PathVariable Integer idLongueur, @PathVariable Integer idVoie) {
        longueurService.supprimerLongueur(idLongueur);
        return "redirect:/voie/" + idVoie;
    }
}


