package com.ocr.amis.escalade.models;

import org.springframework.security.core.GrantedAuthority;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "t_role")
public class Role implements GrantedAuthority {

    @Id
    @SequenceGenerator(name = "ROLE_SEQ_GENERATOR", sequenceName = "ROLE_SEQ", initialValue = 1, allocationSize = 1)
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ROLE_SEQ_GENERATOR")
    @Column(name = "role_id")
    private int id;

    @Column(name = "rol_nom")
    private String rolNom;

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "t_role_utilisateur", joinColumns = @JoinColumn(name = "utilisateur_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Utilisateur> utilisateurs;

    public Role() {
    }

    public Role(String rolNom, Set<Utilisateur> utilisateurs) {
        this.rolNom = rolNom;
        this.utilisateurs = utilisateurs;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRolNom() {
        return rolNom;
    }

    public void setRolNom(String rolNom) {
        this.rolNom = rolNom;
    }

    public Set<Utilisateur> getUtilisateurs() {
        return utilisateurs;
    }

    public void setUtilisateurs(Set<Utilisateur> utilisateurs) {
        this.utilisateurs = utilisateurs;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", rol_longueur='" + rolNom + '\'' +
                ", utilisateurs=" + utilisateurs +
                '}';
    }

    @Override
    public String getAuthority() {
        return rolNom;
    }
}
