package com.bojan.models;

public class Korisnik {

    @Override
    public String toString() {
        return "Korisnik{" + "korisnikId=" + korisnikId + ", korisnickoIme=" + korisnickoIme + ", lozinka=" + lozinka + ", imePrezime=" + imePrezime + ", email=" + email + ", telefon=" + telefon + ", adresa=" + adresa + ", grad=" + grad + ", drzava=" + drzava + ", postanskiBroj=" + postanskiBroj + ", uloga=" + uloga + ", poeni=" + poeni + '}';
    }

    private Integer korisnikId;
    private String korisnickoIme;
    private String lozinka;
    private String imePrezime;
    private String email;
    private String telefon;
    private String adresa;
    private String grad;
    private String drzava;
    private int postanskiBroj;
    private String uloga = "korisnik";
    private int poeni = 0;

    public Korisnik() {
    }

    public Korisnik(Integer korisnikId) {
        this.korisnikId = korisnikId;
    }

    public Korisnik(Integer korisnikId, String korisnickoIme, String lozinka, String imePrezime, String email, String telefon, String adresa, String grad, String drzava, int postanskiBroj, String uloga) {
        this.korisnikId = korisnikId;
        this.korisnickoIme = korisnickoIme;
        this.lozinka = lozinka;
        this.imePrezime = imePrezime;
        this.email = email;
        this.telefon = telefon;
        this.adresa = adresa;
        this.grad = grad;
        this.drzava = drzava;
        this.postanskiBroj = postanskiBroj;
        this.uloga = uloga;
    }

    public Integer getKorisnikId() {
        return korisnikId;
    }

    public void setKorisnikId(Integer korisnikId) {
        this.korisnikId = korisnikId;
    }

    public String getKorisnickoIme() {
        return korisnickoIme;
    }

    public void setKorisnickoIme(String korisnickoIme) {
        this.korisnickoIme = korisnickoIme;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getImePrezime() {
        return imePrezime;
    }

    public void setImePrezime(String imePrezime) {
        this.imePrezime = imePrezime;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefon() {
        return telefon;
    }

    public void setTelefon(String telefon) {
        this.telefon = telefon;
    }

    public String getAdresa() {
        return adresa;
    }

    public void setAdresa(String adresa) {
        this.adresa = adresa;
    }

    public String getGrad() {
        return grad;
    }

    public void setGrad(String grad) {
        this.grad = grad;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    public int getPostanskiBroj() {
        return postanskiBroj;
    }

    public void setPostanskiBroj(int postanskiBroj) {
        this.postanskiBroj = postanskiBroj;
    }

    public String getUloga() {
        return uloga;
    }

    public void setUloga(String uloga) {
        this.uloga = uloga;
    }

    public int getPoeni() {
        return poeni;
    }

    public void setPoeni(int poeni) {
        this.poeni = poeni;
    }
}
