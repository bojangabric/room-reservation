package com.bojan.modeli;

public class Korisnik {

    private Integer korisnik_id;
    private String korisnicko_ime;
    private String lozinka;
    private String ime_prezime;
    private String email;
    private String telefon;
    private String adresa;
    private String grad;
    private String drzava;
    private int postanski_broj;
    private String uloga = "korisnik";
    private int poeni = 0;

    public Korisnik() {
    }

    public Korisnik(Integer korisnikId) {
        this.korisnik_id = korisnikId;
    }

    public Korisnik(Integer korisnikId, String korisnickoIme, String lozinka, String imePrezime, String email, String telefon, String adresa, String grad, String drzava, int postanskiBroj, String uloga) {
        this.korisnik_id = korisnikId;
        this.korisnicko_ime = korisnickoIme;
        this.lozinka = lozinka;
        this.ime_prezime = imePrezime;
        this.email = email;
        this.telefon = telefon;
        this.adresa = adresa;
        this.grad = grad;
        this.drzava = drzava;
        this.postanski_broj = postanskiBroj;
        this.uloga = uloga;
    }

    public Integer getKorisnik_id() {
        return korisnik_id;
    }

    public void setKorisnik_id(Integer korisnik_id) {
        this.korisnik_id = korisnik_id;
    }

    public String getKorisnicko_ime() {
        return korisnicko_ime;
    }

    public void setKorisnicko_ime(String korisnicko_ime) {
        this.korisnicko_ime = korisnicko_ime;
    }

    public String getLozinka() {
        return lozinka;
    }

    public void setLozinka(String lozinka) {
        this.lozinka = lozinka;
    }

    public String getIme_prezime() {
        return ime_prezime;
    }

    public void setIme_prezime(String ime_prezime) {
        this.ime_prezime = ime_prezime;
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

    public int getPostanski_broj() {
        return postanski_broj;
    }

    public void setPostanski_broj(int postanski_broj) {
        this.postanski_broj = postanski_broj;
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
