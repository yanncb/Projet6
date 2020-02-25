package com.ocr.amis.escalade.models;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "t_utilisateur")
public class Utilisateur implements Serializable, UserDetails {


    @Id
    @SequenceGenerator(name = "UTILISATEUR_SEQ_GENERATOR", sequenceName = "UTILISATEUR_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "UTILISATEUR_SEQ_GENERATOR")
    @Column(name = "utilisateur_id")
    private Integer utilisateurId;

    @NotEmpty
    @Size(min = 3, max = 32)
    @Column(name = "utill_nom")
    private String nom;

    @NotEmpty
    @Size(min = 3, max = 32)
    @Column(name = "utill_prenom")
    private String prenom;

    @NotEmpty
    @Size(max = 12)
    @Column(name = "utill_telephone")
    private String telephone;

    @NotEmpty
    @Email
    @Column(name = "utill_mail")
    private String mail;

    @NotEmpty
    @Size(min = 3, max = 30)
    @Column(name = "util_pseudo")
    private String pseudo;

    @NotEmpty
    @Size(max = 255)
    @Column(name = "utill_mot_de_passe")
    private String motDePasse;

    @OneToMany(mappedBy = "utilisateur")
    private List<Commentaire> commentairesList;

    @OneToMany(mappedBy = "utilisateurPossedantTopo")
    private Set<Topo> topoListPossedeParUtilisateur;

    @OneToMany(mappedBy = "utilisateurReserveTopo")
    private Set<Topo> topoListReserves;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "t_role_utilisateur", joinColumns = @JoinColumn(name = "utilisateur_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private List<Role> roles;

    public Set<Topo> getTopoListPossedeParUtilisateur() {
        return topoListPossedeParUtilisateur;
    }

    public void setTopoListPossedeParUtilisateur(Set<Topo> topoListPossedeParUtilisateur) {
        this.topoListPossedeParUtilisateur = topoListPossedeParUtilisateur;
    }

    public Set<Topo> getTopoListReserves() {
        return topoListReserves;
    }

    public void setTopoListReserves(Set<Topo> topoListReserves) {
        this.topoListReserves = topoListReserves;
    }

    public Integer getUtilisateurId() {
        return utilisateurId;
    }

    public void setUtilisateurId(Integer utilisateurId) {
        this.utilisateurId = utilisateurId;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPseudo() {
        return pseudo;
    }

    public void setPseudo(String pseudo) {
        this.pseudo = pseudo;
    }

    public String getMotDePasse() {
        return motDePasse;
    }

    public void setMotDePasse(String motDePasse) {
        this.motDePasse = motDePasse;
    }

    public List<Commentaire> getCommentairesList() {
        return commentairesList;
    }

    public void setCommentairesList(List<Commentaire> commentairesList) {
        this.commentairesList = commentairesList;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    @Override
    public String toString() {
        return "Utilisateur{" +
                "utilisateur_id=" + utilisateurId +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", telephone='" + telephone + '\'' +
                ", mail='" + mail + '\'' +
                ", pseudo='" + pseudo + '\'' +
                ", motDePasse='" + motDePasse + '\'' +
//                ", roles=" + roles +
                '}';
    }


    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getPassword() {
        return motDePasse;
    }

    @Override
    public String getUsername() {
        return nom;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }
}

