package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.service.RechercheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("") // ajout des personnes autorisés.
public class RechercheController {

    @Autowired
    private RechercheService rechercheService;


    @GetMapping("/recherche")
    public String recherche(Model model) {
        model.addAttribute("recherche", new Recherche());
        return "/recherche";
    }


    @PostMapping("/recherche")
    public String recherche(Model model, @ModelAttribute("recherche") Recherche recherche) {
        model.addAttribute("resultatSites", rechercheService.rechercherSites(recherche));
        return "/recherche";
    }

}