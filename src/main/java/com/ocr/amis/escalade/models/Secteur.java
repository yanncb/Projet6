package com.ocr.amis.escalade.models;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "t_secteur")
public class Secteur {

    @Id
    @SequenceGenerator(name = "SECTEUR_SEQ_GENERATOR", sequenceName = "SECTEUR_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SECTEUR_SEQ_GENERATOR")
    @Column(name = "secteur_id")
    private int id;

    @Column(name = "sec_nom")
    private String secteurNom;

    @ManyToOne
    @JoinColumn(name = "sit_id", nullable = false)
    private Site site;

    @OneToMany(mappedBy = "secteur", cascade = CascadeType.ALL)
    private List<Voie> voieList;

    public Secteur() {
    }

    public Secteur(String secteurNom, Site site, List<Voie> voieList) {
        this.secteurNom = secteurNom;
        this.site = site;
        this.voieList = voieList;
    }

    public Secteur(String secteurNom) {
        this.secteurNom = secteurNom;
    }

    public int nbVoies() {
        return voieList.size();
    }

    public Site getSite() {
        return site;
    }

    public void setSite(Site site) {
        this.site = site;
    }

    public List<Voie> getVoieList() {
        return voieList;
    }

    public void setVoieList(List<Voie> voieList) {
        this.voieList = voieList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getSecteurNom() {
        return secteurNom;
    }

    public void setSecteurNom(String secteurNom) {
        this.secteurNom = secteurNom;
    }

    @Override
    public String toString() {
        return "Secteur{" +
                "id=" + id +
                ", secteurNom='" + secteurNom + '\'' +
                ", voieList=" + voieList +
                '}';
    }
}
