package com.ocr.amis.escalade.models;

import javax.persistence.*;

@Entity
@Table(name = "t_topo")
public class Topo {

    @Id
    @SequenceGenerator(name = "TOPO_SEQ_GENERATOR", sequenceName = "TOPO_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "TOPO_SEQ_GENERATOR")
    @Column(name = "topo_id")
    private int id;

    @Column(name = "top_date_parution")
    private String dateParution;

    @Column(name = "top_nom")
    private String nom;

    @Column(name = "top_description")
    private String description;

    @Column(name = "top_lieu")
    private String lieu;

    @Column(name = "top_disponibilite")
    private boolean dispo;

    @Column(name = "top_confirmation_reservation")
    private boolean reservation;

    @Column(name = "top_demande_reservation")
    private String demandeReservation;

    @ManyToOne
    @JoinColumn(name = "utilisateur_createur_id")
    private Utilisateur utilisateurPossedantTopo;

    @ManyToOne
    @JoinColumn(name = "utilisateur_emprunteur_id")
    private Utilisateur utilisateurReserveTopo;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDateParution() {
        return dateParution;
    }

    public void setDateParution(String dateParution) {
        this.dateParution = dateParution;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getLieu() {
        return lieu;
    }

    public void setLieu(String lieu) {
        this.lieu = lieu;
    }

    public boolean isDispo() {
        return dispo;
    }

    public void setDispo(boolean dispo) {
        this.dispo = dispo;
    }

    public boolean isReservation() {
        return reservation;
    }

    public void setReservation(boolean reservation) {
        this.reservation = reservation;
    }

    public String getDemandeReservation() {
        return demandeReservation;
    }

    public void setDemandeReservation(String demandeReservation) {
        this.demandeReservation = demandeReservation;
    }

    public Utilisateur getUtilisateurPossedantTopo() {
        return utilisateurPossedantTopo;
    }

    public void setUtilisateurPossedantTopo(Utilisateur utilisateurPossedantTopo) {
        this.utilisateurPossedantTopo = utilisateurPossedantTopo;
    }

    public Utilisateur getUtilisateurReserveTopo() {
        return utilisateurReserveTopo;
    }

    public void setUtilisateurReserveTopo(Utilisateur utilisateurReserveTopo) {
        this.utilisateurReserveTopo = utilisateurReserveTopo;
    }

    @Override
    public String toString() {
        return "Topo{" +
                "id=" + id +
                ", dateParution='" + dateParution + '\'' +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", lieu='" + lieu + '\'' +
                ", dispo=" + dispo +
                ", reservation=" + reservation +
                ", demandeReservation='" + demandeReservation + '\'' +
                '}';
    }
}

