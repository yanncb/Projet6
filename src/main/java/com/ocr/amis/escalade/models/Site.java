package com.ocr.amis.escalade.models;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;


@Entity
@Table(name = "t_site_escalade")
public class Site {

    @Id
    @SequenceGenerator(name = "SITE_SEQ_GENERATOR", sequenceName = "SITE_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SITE_SEQ_GENERATOR")
    @Column(name = "sit_id")
    private int id;

    @Column(name = "sit_nom")
    private String nom;

    @Column(name = "sit_tag")
    private String tag;

    @Column(name = "sit_loc_pays")
    private String pays;

    @Column(name = "sit_adresse")
    private String adresse;

    @OneToMany(mappedBy = "site", cascade = CascadeType.ALL)
    private List<Secteur> secteurs;

    @OneToMany(mappedBy = "site", cascade = CascadeType.ALL)
    private List<Commentaire> commentaires;

    public Site() {
    }

    public Site(List<Secteur> secteurs, String nom, String tag, String pays, String adresse) {
        this.secteurs = secteurs;
        this.nom = nom;
        this.tag = tag;
        this.pays = pays;
        this.adresse = adresse;
    }

    public int nbSecteurs() {
        return secteurs.size();
    }

    public int nbVoies() {
        int nbVoie = 0;

        for (Secteur secteur : secteurs) {
            nbVoie += secteur.nbVoies();
        }

        return nbVoie;
    }

    public String getPays() {
        return pays;
    }

    public void setPays(String pays) {
        this.pays = pays;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public Collection<Secteur> getSecteurs() {
        return secteurs;
    }

    public void setSecteurs(List<Secteur> secteurs) {
        this.secteurs = secteurs;
    }

    public List<Commentaire> getCommentaires() {
        return commentaires;
    }

    public void setCommentaires(List<Commentaire> commentaires) {
        this.commentaires = commentaires;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }


    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    @Override
    public String toString() {
        return "Site{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", tag='" + tag + '\'' +
                ", pays='" + pays + '\'' +
                ", adresse='" + adresse + '\'' +
                ", secteurs=" + secteurs +
                ", commentaires=" + commentaires +
                '}';
    }
}

