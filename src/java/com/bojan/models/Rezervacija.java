/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bojan.models;

import java.util.Date;

/**
 *
 * @author bojan
 */
public class Rezervacija {

    private int rezervacija_id;
    private int korisnik_id;
    private int soba_id;
    private Date datum_dolaska;
    private Date datum_odlaska;
    private int novac;
    private int poeni;

    public int getRezervacija_id() {
        return rezervacija_id;
    }

    public void setRezervacija_id(int rezervacija_id) {
        this.rezervacija_id = rezervacija_id;
    }

    public int getKorisnik_id() {
        return korisnik_id;
    }

    public void setKorisnik_id(int korisnik_id) {
        this.korisnik_id = korisnik_id;
    }

    public int getSoba_id() {
        return soba_id;
    }

    public void setSoba_id(int soba_id) {
        this.soba_id = soba_id;
    }

    public Date getDatum_dolaska() {
        return datum_dolaska;
    }

    public void setDatum_dolaska(Date datum_dolaska) {
        this.datum_dolaska = datum_dolaska;
    }

    public Date getDatum_odlaska() {
        return datum_odlaska;
    }

    public void setDatum_odlaska(Date datum_odlaska) {
        this.datum_odlaska = datum_odlaska;
    }

    public int getNovac() {
        return novac;
    }

    public void setNovac(int novac) {
        this.novac = novac;
    }

    public int getPoeni() {
        return poeni;
    }

    public void setPoeni(int poeni) {
        this.poeni = poeni;
    }
}
