package com.devoir.metier;

/**
 * Classe métier représentant un équipement.
 */
public class Equipement {

    private String code;
    private String nom;
    private String type;
    private String marque;
    private String fournisseur;
    private double prix;

    // Constructeur par défaut
    public Equipement() {
    }

    // Constructeur avec tous les champs
    public Equipement(String code, String nom, String type,
                      String marque, String fournisseur, double prix) {
        this.code       = code;
        this.nom        = nom;
        this.type       = type;
        this.marque     = marque;
        this.fournisseur = fournisseur;
        this.prix       = prix;
    }

    // ─── Getters ────────────────────────────────────────────────────────────

    public String getCode() {
        return code;
    }

    public String getNom() {
        return nom;
    }

    public String getType() {
        return type;
    }

    public String getMarque() {
        return marque;
    }

    public String getFournisseur() {
        return fournisseur;
    }

    public double getPrix() {
        return prix;
    }

    // ─── Setters ────────────────────────────────────────────────────────────

    public void setCode(String code) {
        this.code = code;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setMarque(String marque) {
        this.marque = marque;
    }

    public void setFournisseur(String fournisseur) {
        this.fournisseur = fournisseur;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    // ─── toString ────────────────────────────────────────────────────────────

    @Override
    public String toString() {
        return "Equipement{" +
                "code='"        + code        + '\'' +
                ", nom='"       + nom         + '\'' +
                ", type='"      + type        + '\'' +
                ", marque='"    + marque      + '\'' +
                ", fournisseur='"+ fournisseur + '\'' +
                ", prix="       + prix        +
                '}';
    }
}
