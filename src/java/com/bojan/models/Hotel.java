package com.bojan.models;

public class Hotel {

    private int hotel_id;
    private String name;
    private String address;
    private String city;
    private String country;
    private String description;
    private int stars;
    private String picture;
    private int min_room_price;
    private int max_room_price;

    public int getHotel_id() {
        return hotel_id;
    }

    public void setHotel_id(int hotel_id) {
        this.hotel_id = hotel_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStars() {
        return stars;
    }

    public void setStars(int stars) {
        this.stars = stars;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public int getMin_room_price() {
        return min_room_price;
    }

    public void setMin_room_price(int min_room_price) {
        this.min_room_price = min_room_price;
    }

    public int getMax_room_price() {
        return max_room_price;
    }

    public void setMax_room_price(int max_room_price) {
        this.max_room_price = max_room_price;
    }
}
