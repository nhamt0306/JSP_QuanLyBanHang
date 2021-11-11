package com.ute.ecwebapp.beans;

public class Product {
    private int ProID;
    private String ProName;
    private String TinyDes;
    private String FullDes;
    private int Price;
    private int CatID;
    private int Quantity;

    public Product(int proID, String proName, String tinyDes, String fullDes, int price, int catID, int quantity) {
        ProID = proID;
        ProName = proName;
        TinyDes = tinyDes;
        FullDes = fullDes;
        Price = price;
        CatID = catID;
        Quantity = quantity;
    }

    public int getProID() {
        return ProID;
    }

    public String getProName() {
        return ProName;
    }

    public String getTinyDes() {
        return TinyDes;
    }

    public String getFullDes() {
        return FullDes;
    }

    public int getPrice() {
        return Price;
    }

    public int getCatID() {
        return CatID;
    }

    public int getQuantity() {
        return Quantity;
    }

    public Product() {
    }
}
