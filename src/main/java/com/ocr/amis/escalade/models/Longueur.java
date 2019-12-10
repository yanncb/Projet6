package com.ocr.amis.escalade.models;


import javax.persistence.*;

@Entity
@Table(name = "t_longueur")
public class Longueur {

    @Id
    @SequenceGenerator(name = "LONGUEUR_SEQ_GENERATOR", sequenceName = "LONGUEUR_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "LONGUEUR_SEQ_GENERATOR")
    @Column(name = "lon_id")
    private int id;

    @Column(name = "lon_nom")  // permets de mapper avec une colonne de la table qui n'a pas le meme nom.
    private String nom_longueur;

    @Column(name = "lon_cotation")  // permets de mapper avec une colonne de la table qui n'a pas le meme nom.
    private String cotation;

    @ManyToOne
    @JoinColumn(name = "voi_id", nullable = false)
    private Voie voie;

    public Longueur(){    }

    public Longueur(String nom_longueur, String cotation, Voie voie) {
        this.nom_longueur = nom_longueur;
        this.cotation = cotation;
        this.voie = voie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_longueur() {
        return nom_longueur;
    }

    public void setNom_longueur(String nom_longueur) {
        this.nom_longueur = nom_longueur;
    }

    public String getCotation() {
        return cotation;
    }

    public void setCotation(String cotation) {
        this.cotation = cotation;
    }

    public Voie getVoie() {
        return voie;
    }

    public void setVoie(Voie voie) {
        this.voie = voie;
    }

    @Override
    public String toString() {
        return "Longueur{" +
                "id=" + id +
                ", nom_longueur='" + nom_longueur + '\'' +
                ", cotation='" + cotation + '\'' +
                ", voie=" + voie +
                '}';
    }
}
