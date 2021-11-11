package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.Product;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class ProductModel {
  public static List<Product> findAll() {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang","root","");
    final String query = "SELECT * FROM products";
    try (Connection con = sql2o.open()) {
      return con.createQuery(query)
              .executeAndFetch(Product.class);
    }
  }

  public static void add(Product p) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");
    String insertSql = "INSERT INTO products (ProID, ProName, TinyDes, FullDes, Price, CatID, Quantity) VALUES (:proid,:proname,:tinydes,:fulldes,:price,:catid,:quantity)\n";

    try (Connection con = sql2o.open()) {
      con.createQuery(insertSql)
              .addParameter("proid", p.getProID())
              .addParameter("proname", p.getProName())
              .addParameter("tinydes", p.getTinyDes())
              .addParameter("fulldes", p.getFullDes())
              .addParameter("price", p.getPrice())
              .addParameter("catid", p.getCatID())
              .addParameter("quantity", p.getQuantity())
              .executeUpdate();
    }
  }

  public static Product getByID (int id) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");
    try (Connection con = sql2o.open()) {
      final String query = "select * from products where ProID = :proid";
      List<Product> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
              .addParameter("proid", id) /*Tham số thứ nhất của query, tham số truyền vào*/
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
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");

    String updateSql = "UPDATE products SET  ProName = :proname, TinyDes = :tinydes, FullDes = :fulldes, Price = :price, CatID = :catid, Quantity = :quantity WHERE ProID = :proid \n";

    try (Connection con = sql2o.open()) {
      con.createQuery(updateSql)
              .addParameter("proid", p.getProID())
              .addParameter("proname", p.getProName())
              .addParameter("tinydes", p.getTinyDes())
              .addParameter("fulldes", p.getFullDes())
              .addParameter("price", p.getPrice())
              .addParameter("catid", p.getCatID())
              .addParameter("quantity", p.getQuantity())
              .executeUpdate();
    }
  }
  public static void delete(int id) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");

    String SQL = "delete from products where ProID = :proid";

    try (Connection con = sql2o.open()) {
      con.createQuery(SQL)
              .addParameter("proid", id)
              .executeUpdate();
    }
  }
}
