package com.bojan.models;

public class Hotel {

    private int hotel_id;
    private String naziv;
    private String adresa;
    private String grad;
    private String drzava;
    private String opis;
    private int zvezdice;
    private String slika;
    private int min_cena_sobe;
    private int max_cena_sobe;

    public int getMin_cena_sobe() {
        return min_cena_sobe;
    }

    public void setMin_cena_sobe(int min_cena_sobe) {
        this.min_cena_sobe = min_cena_sobe;
    }

    public int getMax_cena_sobe() {
        return max_cena_sobe;
    }

    public void setMax_cena_sobe(int max_cena_sobe) {
        this.max_cena_sobe = max_cena_sobe;
    }

    public String getSlika() {
        return slika;
    }

    public void setSlika(String slika) {
        this.slika = slika;
    }

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
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

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public int getZvezdice() {
        return zvezdice;
    }

    public void setZvezdice(int zvezdice) {
        this.zvezdice = zvezdice;
    }
}
