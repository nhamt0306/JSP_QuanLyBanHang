package com.ute.ecwebapp.beans;

public class Customer {
    private int maKhach;
    private String tenKhach;
    private String diaChi;
    private String soDienthoai;
    private int accID;

    public Customer(int maKhach, String tenKhach, String diaChi, String soDienthoai, int accID) {
        this.maKhach = maKhach;
        this.tenKhach = tenKhach;
        this.diaChi = diaChi;
        this.soDienthoai = soDienthoai;
        this.accID = accID;
    }

    public Customer() {
    }

    public int getMaKhach() {
        return maKhach;
    }

    public void setMaKhach(int maKhach) {
        this.maKhach = maKhach;
    }

    public String getTenKhach() {
        return tenKhach;
    }

    public void setTenKhach(String tenKhach) {
        this.tenKhach = tenKhach;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getSoDienthoai() {
        return soDienthoai;
    }

    public void setSoDienthoai(String soDienthoai) {
        this.soDienthoai = soDienthoai;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }
}
