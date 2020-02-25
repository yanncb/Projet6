package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Secteur;
import com.ocr.amis.escalade.service.SecteurService;
import com.ocr.amis.escalade.service.SiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SecteurController {

    @Autowired
    private SecteurService secteurService;

    @Autowired
    private SiteService siteService;

    @GetMapping("/secteur/{id}")
    public String secteur(Model model, @PathVariable Integer id) {
        Secteur secteur = secteurService.rechercherSecteurParId(id);
        model.addAttribute("secteur", secteur);
        model.addAttribute("voies", secteur.getVoieList());
        return "secteur";

    }

    // permet d'afficher mon formulaire qui me permettra par la suite d'ajouter un secteur
    // Exemple d'URL : ajout-secteur?siteId=25
    @GetMapping("/ajout-secteur")
    public String ajouterSecteur(Model model, @RequestParam int siteId) {
        model.addAttribute("secteur", secteurService.initialiser(siteService.rechercherSiteParId(siteId)));
        return "/ajout-secteur";
    }

    // permet de recuperer le formulaire d'ajout de liste et de rediriger sur la page pour affichage.
    @PostMapping("/ajout-secteur")
    public String ajouterSecteur(@ModelAttribute("secteur") Secteur secteur) {
        secteurService.ajouterSecteur(secteur);
        return "redirect:/site/" + secteur.getSite().getId();
    }

    @GetMapping("/modifier-secteur/{id}")
    public String recupererSecteur(Model model, @PathVariable Integer id) {
        model.addAttribute("secteur", secteurService.rechercherSecteurParId(id));
        return "modifier-secteur";

    }

    @PostMapping("/modifier-secteur")
    public String modifierSecteur(@ModelAttribute("secteur") Secteur secteur) {
        secteurService.modifierSecteur(secteur);
        return "redirect:/site/" + secteur.getSite().getId();
    }

    @GetMapping("/supprimer-secteur/{idSecteur}/{idSite}")
    public String supprimerSecteur(@PathVariable Integer idSecteur, @PathVariable Integer idSite) {
        secteurService.supprimerSecteur(idSecteur);
        return "redirect:/site/" + idSite;
    }

}
