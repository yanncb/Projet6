package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.controller.post.CommentaireForm;
import com.ocr.amis.escalade.models.Commentaire;
import com.ocr.amis.escalade.models.Site;
import com.ocr.amis.escalade.service.SiteService;
import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class SiteController {

    @Autowired
    private SiteService siteService;

    @GetMapping("/sites")
    public String site(Model model) {
        model.addAttribute("sites", siteService.rechercherTousLesSites());
        return "/sites";
    }

    @GetMapping("/site/{id}")
    public String secteur(Model model, @PathVariable Integer id) {
        model.addAttribute("site", siteService.rechercherSiteParId(id));
        return "/site";
    }

    // permet d'afficher mon formulaire qui me permettra par la suite d'ajouter un site
    @GetMapping("/ajout-site")
    public String ajouterSite(Model model) {
        model.addAttribute("site", new Site());
        return "/ajout-site";
    }

    // permet de recuperer le formulaire d'ajout de liste et de rediriger sur la page pour affichage.
    @PostMapping("/ajout-site")
    public String ajouterSite(@ModelAttribute("site") Site site) {
        siteService.ajouterSite(site);
        return "redirect:/sites";
    }

    @GetMapping("/modifier-site/{id}/{siteId}")
    public String recupererSite(Model model, @PathVariable Integer id) {
        model.addAttribute("site", siteService.rechercherSiteParId(id));
        return "/modifier-site";
    }

    @PostMapping("/modifier-site")
    public String modifierSite(@ModelAttribute("site") Site site) {
        siteService.modifierSite(site);
        return "redirect:/sites";
    }

    @GetMapping("/supprimer-site/{siteId}")
    public String supprimerSite(Model model, @PathVariable Integer siteId) {
        siteService.supprimerSite(siteId);
        return "redirect:/sites";
    }


    @GetMapping("/ajout-commentaire")
    public String ajoutCommentaire(Model model, @RequestParam Integer siteId) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        model.addAttribute("utilisateur", authentication);
        CommentaireForm commentaireForm = new CommentaireForm();
        commentaireForm.setSiteId(siteId);
        model.addAttribute("commentaire", commentaireForm);
        Site site = siteService.rechercherSiteParId(siteId);
        model.addAttribute("site", site);
        return "/ajout-commentaire";
    }

    @PostMapping("/ajout-commentaire")
    public String ajouterCommentaire(Model model, @ModelAttribute("commentaire") CommentaireForm commentaireForm) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Commentaire commentaire = siteService.ajouterCommentaire(commentaireForm.getSiteId(), commentaireForm.getTexte(), authentication.getName());
        model.addAttribute("commentaire", commentaire);
        return "redirect:/site/" + commentaire.getSite().getId();
    }

    @GetMapping("/modifier-commentaire/{id}")
    public String recupererCommentaire(Model model, @PathVariable Integer commentaireId) {
        model.addAttribute("commentaire", siteService.rechercherCommentaireParId(commentaireId));
        return "/modifier-commentaire";
    }

    @PostMapping("/modifier-commentaire")
    public String modifierCommentaire(@ModelAttribute("commentaire") Commentaire commentaire) {
        siteService.modifierCommentaire(commentaire);
        return "redirect:/site/" + commentaire.getSite().getId();
    }

    @GetMapping("/supprimer-commentaire/{commentaireId}/{siteId}")
    public String supprimerCommentaire(Model model, @PathVariable Integer commentaireId, @PathVariable Integer siteId) {
        siteService.supprimerCommentaire(commentaireId);
        return "redirect:/site/" + siteId;
    }

}


