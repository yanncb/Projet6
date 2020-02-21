package com.ocr.amis.escalade.repository.impl;

import com.ocr.amis.escalade.models.Recherche;
import com.ocr.amis.escalade.models.Site;
import com.ocr.amis.escalade.repository.SiteDAO;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@Repository
public class SiteDAOImpl implements SiteDAO {

    @PersistenceContext
    EntityManager entityManager;

    /**
     * findSiteByCritere permets de faire une requete JPQL avec les champs remplies uniquement
     *
     * @param recherche contient les elements de recherches saisi par l'utilisateur
     * @return le resutal de la requete
     */
    public List<Site> findSiteByCritere(Recherche recherche) {

        // Etape 1 : Construction dynamique de la requête
        String jpql = "SELECT DISTINCT si";
        jpql += " FROM Site AS si";
        jpql += " LEFT JOIN si.secteurs se";
        jpql += " LEFT JOIN se.voieList v";
        jpql += " LEFT JOIN v.longueurlist l";
        jpql += " WHERE 1=1";


        if (!StringUtils.isEmpty(recherche.getPays())) {
            jpql += " AND si.pays = :pays";
        }
        if (!StringUtils.isEmpty(recherche.getNbSecteurs())) {
            jpql += " AND size(si.secteurs) = :nbSecteurs";
        }
        if (!StringUtils.isEmpty(recherche.getCotation())) {
            jpql += " AND l.cotation = :cotation";
        }

        // Etape 2 : Définition des paramètres de la requête
        Query query = entityManager.createQuery(jpql, Site.class);

        if (!StringUtils.isEmpty(recherche.getPays())) {
            query.setParameter("pays", recherche.getPays());
        }
        if (!StringUtils.isEmpty(recherche.getNbSecteurs())) {
            query.setParameter("nbSecteurs", recherche.getNbSecteurs());
        }
        if (!StringUtils.isEmpty(recherche.getCotation())) {
            query.setParameter("cotation", recherche.getCotation());
        }

        return query.getResultList();
    }

}

