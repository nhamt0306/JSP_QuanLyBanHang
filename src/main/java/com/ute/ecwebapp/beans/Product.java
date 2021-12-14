package com.ute.ecwebapp.beans;

public class Product {
    private int maSP;
    private String tenSP;
    private String loaiSP;

    public int getIndeximg() {
        return indeximg;
    }

    public void setIndeximg(int indeximg) {
        this.indeximg = indeximg;
    }

    private int indeximg;

    public String getMauSP() {
        return mauSP;
    }

    public void setMauSP(String mauSP) {
        this.mauSP = mauSP;
    }

    private String mauSP;
    private String sizeSP;
    private int maChatlieu;
    private int soLuong;
    private int dongiaNhap;
    private int dongiaBan;
    private String ghichu;

    public Product() {

    }

    public Product(int maSP, String tenSP, String loaiSP, String sizeSP,String mauSP, int maChatlieu, int soLuong, int dongiaNhap, int dongiaBan, String ghichu, int indeximg) {
        this.maSP = maSP;
        this.tenSP = tenSP;
        this.loaiSP = loaiSP;
        this.sizeSP = sizeSP;
        this.mauSP = mauSP;
        this.maChatlieu = maChatlieu;
        this.soLuong = soLuong;
        this.dongiaNhap = dongiaNhap;
        this.dongiaBan = dongiaBan;
        this.ghichu = ghichu;
        this.indeximg = indeximg;
    }

    public int getMaSP() {
        return maSP;
    }

    public void setMaSP(int maSP) {
        this.maSP = maSP;
    }

    public String getTenSP() {
        return tenSP;
    }

    public void setTenSP(String tenSP) {
        this.tenSP = tenSP;
    }

    public String getLoaiSP() {
        return loaiSP;
    }

    public void setLoaiSP(String loaiSP) {
        this.loaiSP = loaiSP;
    }

    public String getSizeSP() {
        return sizeSP;
    }

    public void setSizeSP(String sizeSP) {
        this.sizeSP = sizeSP;
    }

    public int getMaChatlieu() {
        return maChatlieu;
    }

    public void setMaChatlieu(int maChatlieu) {
        this.maChatlieu = maChatlieu;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public int getDongiaNhap() {
        return dongiaNhap;
    }

    public void setDongiaNhap(int dongiaNhap) {
        this.dongiaNhap = dongiaNhap;
    }

    public int getDongiaBan() {
        return dongiaBan;
    }

    public void setDongiaBan(int dongiaBan) {
        this.dongiaBan = dongiaBan;
    }

    public String getGhichu() {
        return ghichu;
    }

    public void setGhichu(String ghichu) {
        this.ghichu = ghichu;
    }
}
