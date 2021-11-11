package com.ute.ecwebapp.models;

import java.util.List;

import com.ute.ecwebapp.beans.Category;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class CategoryModel {
  public static List<Category> findAll() {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang","root","");
    final String query = "SELECT * FROM categories";
    try (Connection con = sql2o.open()) {
      return con.createQuery(query)
              .executeAndFetch(Category.class);
    }
  }

  public static void add(Category cat) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");
    String insertSql =
            "insert into categories(CatID, CatName) " +
                    "values (:catid, :catname)";

    try (Connection con = sql2o.open()) {
      con.createQuery(insertSql)
              .addParameter("catid", cat.getCatID())
              .addParameter("catname", cat.getCatName())
              .executeUpdate();
    }
  }

  public static Category getCategoryByID (int id) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");
    try (Connection con = sql2o.open()) {
      final String query = "select * from categories where CatID = :catid";
      List<Category> listCat= con.createQuery(query) //addParameter để mapping giữa query với tham số
              .addParameter("catid", id) /*Tham số thứ nhất của query, tham số truyền vào*/
              .executeAndFetch(Category.class);
      if (listCat.size() == 0)
      {
        return null;
      }
      else
        return listCat.get(0);
    }
  }
  public static void updateCategory(Category c) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");

    String updateSql = "update categories set CatName = :catname where CatID = :catid";

    try (Connection con = sql2o.open()) {
      con.createQuery(updateSql)
              .addParameter("catname", c.getCatName())
              .addParameter("catid", c.getCatID())
              .executeUpdate();
    }
  }
  public static void delete(int catid) {
    Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");

    String SQL = "delete from categories where CatID = :catid";

    try (Connection con = sql2o.open()) {
      con.createQuery(SQL)
              .addParameter("catid", catid)
              .executeUpdate();
    }
  }
}
