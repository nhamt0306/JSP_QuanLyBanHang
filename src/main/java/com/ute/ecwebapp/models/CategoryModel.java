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
}
