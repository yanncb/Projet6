package com.ocr.amis.escalade.models;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "t_commentaire")
public class Commentaire {

    @Id
    @SequenceGenerator(name = "COMMENTAIRE_SEQ_GENERATOR", sequenceName = "COMMENTAIRE_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "COMMENTAIRE_SEQ_GENERATOR")
    @Column(name = "commentaire_id")
    private int id;

    @Column(name = "com_horodatage_creation")
    private Date date;
    @Column(name = "com_texte")
    private String texte;

    @ManyToOne
    @JoinColumn(name = "utilisateur_id")
    private Utilisateur utilisateur;

    @ManyToOne
    @JoinColumn(name = "sit_id")
    private Site site;

    public Commentaire() {
    }

    public Commentaire(Date date, String texte, Utilisateur utilisateur) {
        this.date = date;
        this.texte = texte;
        this.utilisateur = utilisateur;
    }

    @Override
    public String toString() {
        return "Commentaire{" +
                "id=" + id +
                ", date=" + date +
                ", texte='" + texte + '\'' +
                ", utilisateur=" + utilisateur +
                ", site=" + site +
                '}';
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public Utilisateur getUtilisateur() {
        return utilisateur;
    }

    public void setUtilisateur(Utilisateur utilisateur) {
        this.utilisateur = utilisateur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

}
