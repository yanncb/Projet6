package com.ocr.amis.escalade.models;

public class Recherche {

   private String pays;
   private String cotation;
   private Integer nbSecteurs;

   public Recherche() {}

   public Recherche(String pays, String cotation, Integer nbSecteurs) {
      this.pays = pays;
      this.cotation = cotation;
      this.nbSecteurs = nbSecteurs;
   }

   public String getPays() {
      return pays;
   }

   public void setPays(String pays) {
      this.pays = pays;
   }

   public String getCotation() {
      return cotation;
   }

   public void setCotation(String cotation) {
      this.cotation = cotation;
   }

   public Integer getNbSecteurs() {
      return nbSecteurs;
   }

   public void setNbSecteurs(Integer nbSecteurs) {
      this.nbSecteurs = nbSecteurs;
   }



   @Override
   public String toString() {
      return "Recherche{" +
              "pays='" + pays + '\'' +
              ", cotation='" + cotation + '\'' +
              ", nbSecteurs=" + nbSecteurs +
              '}';
   }
}
