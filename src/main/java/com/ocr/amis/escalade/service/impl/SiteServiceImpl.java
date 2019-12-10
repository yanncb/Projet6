package com.ocr.amis.escalade.service.impl;

import com.ocr.amis.escalade.models.Commentaire;
import com.ocr.amis.escalade.models.Site;
import com.ocr.amis.escalade.repository.CommentaireRepository;
import com.ocr.amis.escalade.repository.SiteRepository;
import com.ocr.amis.escalade.service.SiteService;
import com.ocr.amis.escalade.service.UtilisateurService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class SiteServiceImpl implements SiteService {


    @Autowired
    private SiteRepository siteRepository;

    @Autowired
    private CommentaireRepository commentaireRepository;

    @Autowired
    private UtilisateurService utilisateurService;


    @Override
    public List<Site> rechercherTousLesSites() {
        return siteRepository.findAll();
    }

    @Override
    public Site rechercherSiteParId(Integer id) {
        Optional<Site> optionalSite = siteRepository.findById(id);
        if (optionalSite.isPresent()) {
            return optionalSite.get();
        }
        return null;
    }

    //    @Override
    public void recherche(Site site) {

    }

    public void ajouterSite(Site site) {
        siteRepository.save(site);
    }

    @Override
    public void modifierSite(Site site) {
        siteRepository.save(site);
    }

    public void supprimerSite(Integer id) {
        siteRepository.deleteById(id);
    }

    @Override
    public Commentaire ajouterCommentaire(int siteId, String texte, String userName) {
        Site site = siteRepository.findById(siteId).get(); // Pour le moment, opn fait confiance et on estime que ce site ne sera jamais null
        Commentaire commentaire = new Commentaire();
        commentaire.setSite(site);
        commentaire.setDate(new Date());
        commentaire.setTexte(texte);
        commentaire.setUtilisateur(utilisateurService.chargementUtilisateurParPseudo(userName));
        return commentaireRepository.save(commentaire);
    }

    @Override
    public void modifierCommentaire(Commentaire commentaire) {
        commentaireRepository.save(commentaire);
    }


    public void supprimerCommentaire(Integer id) {
        commentaireRepository.deleteById(id);
    }

    @Override
    public Commentaire rechercherCommentaireParId(Integer id) {
        Optional<Commentaire> optionalCommentaire = commentaireRepository.findById(id);
        if (optionalCommentaire.isPresent()) {
            return optionalCommentaire.get();
        }
        return null;
    }


}


