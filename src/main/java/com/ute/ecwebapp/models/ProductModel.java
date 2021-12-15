package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.Product;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class ProductModel {
  public static List<Product> findAll() {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
    final String query = "SELECT * FROM tblsanpham";
    try (Connection con = sql2o.open()) {
      return con.createQuery(query)
              .executeAndFetch(Product.class);
    }
  }

  public static List<Product> findByCat(String loaisp) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
    final String query = "SELECT * FROM tblsanpham where loaiSP=:loaisp";
    try (Connection con = sql2o.open()) {
      return con.createQuery(query)
              .addParameter("loaisp", loaisp)
              .executeAndFetch(Product.class);
    }
  }

  public static List<Product> findByName(String tensp) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
    final String query = "select * from tblsanpham where tenSP like :tensp";
    try (Connection con = sql2o.open()) {
      return con.createQuery(query)
              .addParameter("tensp", "%"+tensp+"%")
              .executeAndFetch(Product.class);
    }
  }

  public static void add(Product p) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
    String insertSql = "INSERT INTO tblsanpham (maSP, tenSP, loaiSP, mauSP, sizeSP, maChatlieu, soLuong, dongiaNhap, dongiaBan, indeximg) VALUES (:masp,:tensp,:loaisp,:mausp,:sizesp,:machatlieu,:soluong,:dongianhap,:dongiaban,:indeximg)\n";

    try (Connection con = sql2o.open()) {
      con.createQuery(insertSql)
              .addParameter("masp", p.getMaSP())
              .addParameter("tensp", p.getTenSP())
              .addParameter("loaisp", p.getLoaiSP())
              .addParameter("mausp", p.getMauSP())
              .addParameter("sizesp", p.getSizeSP())
              .addParameter("machatlieu", p.getMaChatlieu())
              .addParameter("soluong", p.getSoLuong())
              .addParameter("dongianhap", p.getDongiaNhap())
              .addParameter("dongiaban", p.getDongiaBan())
              .addParameter("indeximg", p.getIndeximg())
              .executeUpdate();
    }
  }

  public static Product getByID (int id) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
    try (Connection con = sql2o.open()) {
      final String query = "select * from tblsanpham where maSP = :masp";
      List<Product> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
              .addParameter("masp", id) /*Tham số thứ nhất của query, tham số truyền vào*/
              .executeAndFetch(Product.class);
      if (list.size() == 0)
      {
        return null;
      }
      else
        return list.get(0);
    }
  }
  public static void update (Product p) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

    String updateSql = "UPDATE tblsanpham SET  tenSP = :tensp, loaiSP = :loaisp, mauSP = :mausp, sizeSP = :sizesp, maChatlieu = :machatlieu, soLuong = :soluong, dongiaNhap = :dongianhap, dongiaBan = :dongiaban, indeximg = :indeximg WHERE maSP = :masp \n";

    try (Connection con = sql2o.open()) {
      con.createQuery(updateSql)
              .addParameter("masp", p.getMaSP())
              .addParameter("tensp", p.getTenSP())
              .addParameter("loaisp", p.getLoaiSP())
              .addParameter("mausp", p.getMauSP())
              .addParameter("sizesp", p.getSizeSP())
              .addParameter("machatlieu", p.getMaChatlieu())
              .addParameter("soluong", p.getSoLuong())
              .addParameter("dongianhap", p.getDongiaNhap())
              .addParameter("dongiaban", p.getDongiaBan())
              .addParameter("indeximg", p.getIndeximg())
              .executeUpdate();
    }
  }
  public static void delete(int manv) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

    String SQL = "delete from tblnhanvien where maNhanvien = :manv";

    try (Connection con = sql2o.open()) {
      con.createQuery(SQL)
              .addParameter("manv", manv)
              .executeUpdate();
    }
  }
}
