package com.ute.ecwebapp.beans;

import java.util.List;

public class Item {
    private int id;
    private Product p;
    private int quantity;
    private long price;


    public Item(int id, Product p, int quantity, long price) {
        this.id = id;
        this.p = p;
        this.quantity = quantity;
        this.price = price;
    }

    public Item() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }
}
