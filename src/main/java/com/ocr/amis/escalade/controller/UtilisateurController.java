package com.ocr.amis.escalade.controller;

import com.ocr.amis.escalade.models.Utilisateur;
import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

@Controller
public class UtilisateurController {

    @Autowired
    private UtilisateurService utilisateurService;


    @GetMapping(value = "/login")
    public ModelAndView loginGet(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            return new ModelAndView("redirect:/sites");
        }
        return new ModelAndView("/login");
    }

    @PostMapping(value = "/login")
    public ModelAndView loginPost(Model model, @ModelAttribute("utilisateur") Utilisateur utilisateur) {
        return new ModelAndView("redirect:/sites");
    }


    @GetMapping("/inscription")
    public String inscription(Model model) {
        model.addAttribute("utilisateur", new Utilisateur());
        return "/inscription";
    }

    @PostMapping("/inscription")
    public String creationUtilisateur(@ModelAttribute("utilisateur") Utilisateur utilisateur, @Valid Utilisateur s, BindingResult result) {
        utilisateurService.ajouterUtilisateur(utilisateur);
        return "/inscriptionValidee";
    }


}
