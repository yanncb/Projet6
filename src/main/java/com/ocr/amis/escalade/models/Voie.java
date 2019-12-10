package com.ocr.amis.escalade.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_voie")
public class Voie {

    @Id
    @SequenceGenerator(name = "VOIE_SEQ_GENERATOR", sequenceName = "VOIE_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "VOIE_SEQ_GENERATOR")
    @Column(name = "voi_id")
    private int id;

    @Column(name = "voi_nom")  // permets de mapper avec une colonne de la table qui n'a pas le meme nom.
    private String nom_voie;
    @Column(name = "voi_altitude")
    private String altitude;
    @Column(name = "voi_type_roche")
    private String type_roche;

    @JoinColumn(name = "secteur_id", nullable = false)
    @ManyToOne
    private Secteur secteur;

    @OneToMany(mappedBy = "voie", cascade = CascadeType.ALL)
    private List<Longueur> longueurlist;

    public int nbLongueur() {
        return longueurlist.size();
    }

    public Voie() {

    }

    public Voie(String nom_voie, String altitude, String type_roche, Secteur secteur, List<Longueur> longueurlist) {
        this.nom_voie = nom_voie;
        this.altitude = altitude;
        this.type_roche = type_roche;
        this.secteur = secteur;
        this.longueurlist = longueurlist;
    }




    public List<Longueur> getLongueurlist() {
        return longueurlist;
    }

    public void setLongueurlist(List<Longueur> longueurlist) {
        this.longueurlist = longueurlist;
    }

    public Secteur getSecteur() {
        return secteur;
    }

    public void setSecteur(Secteur secteur) {
        this.secteur = secteur;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom_voie() {
        return nom_voie;
    }

    public void setNom_voie(String nom_voie) {
        this.nom_voie = nom_voie;
    }

    public String getAltitude() {
        return altitude;
    }

    public void setAltitude(String altitude) {
        this.altitude = altitude;
    }

    public String getType_roche() {
        return type_roche;
    }

    public void setType_roche(String type_roche) {
        this.type_roche = type_roche;
    }

    @Override
    public String toString() {
        return "Voie{" +
                "id=" + id +
                ", nom_voie='" + nom_voie + '\'' +
                ", altitude='" + altitude + '\'' +
                ", type_roche='" + type_roche + '\'' +
                ", secteur=" + secteur +
                ", longueurlist=" + longueurlist +
                '}';
    }

}


