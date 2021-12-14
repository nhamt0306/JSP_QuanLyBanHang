package com.ute.ecwebapp.beans;

import java.util.Date;
import java.util.List;

public class Order {
    private int id;
    private Customer cus;
    private List<Item> items;
    private int statusOrder;

    public Order(int id, Customer cus, List<Item> items, int statusOrder) {
        this.id = id;
        this.cus = cus;
        this.items = items;
        this.statusOrder = statusOrder;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Customer getCus() {
        return cus;
    }

    public void setCus(Customer cus) {
        this.cus = cus;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getStatusOrder() {
        return statusOrder;
    }

    public void setStatusOrder(int statusOrder) {
        this.statusOrder = statusOrder;
    }
}
