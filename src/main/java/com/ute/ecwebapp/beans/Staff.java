package com.ute.ecwebapp.beans;

import java.util.Date;

public class Staff {
    private int maNhanvien;
    private String tenNhanvien;
    private String gioitinh;
    private String diachi;
    private String dienthoai;
    private Date ngaysinh;
    private int accID;
    private int maQuanly;

    public Staff(int maNhanvien, String tenNhanvien, String gioitinh, String diachi, String dienthoai, Date ngaysinh, int accID, int maQuanly) {
        this.maNhanvien = maNhanvien;
        this.tenNhanvien = tenNhanvien;
        this.gioitinh = gioitinh;
        this.diachi = diachi;
        this.dienthoai = dienthoai;
        this.ngaysinh = ngaysinh;
        this.accID = accID;
        this.maQuanly = maQuanly;
    }

    public int getMaNhanvien() {
        return maNhanvien;
    }

    public void setMaNhanvien(int maNhanvien) {
        this.maNhanvien = maNhanvien;
    }

    public String getTenNhanvien() {
        return tenNhanvien;
    }

    public void setTenNhanvien(String tenNhanvien) {
        this.tenNhanvien = tenNhanvien;
    }

    public String getGioitinh() {
        return gioitinh;
    }

    public void setGioitinh(String gioitinh) {
        this.gioitinh = gioitinh;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

    public Date getNgaysinh() {
        return ngaysinh;
    }

    public void setNgaysinh(Date ngaysinh) {
        this.ngaysinh = ngaysinh;
    }

    public int getAccID() {
        return accID;
    }

    public void setAccID(int accID) {
        this.accID = accID;
    }

    public int getMaQuanly() {
        return maQuanly;
    }

    public void setMaQuanly(int maQuanly) {
        this.maQuanly = maQuanly;
    }
}
