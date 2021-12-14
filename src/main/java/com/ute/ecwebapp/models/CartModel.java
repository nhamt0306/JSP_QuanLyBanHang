package com.ute.ecwebapp.models;

import java.util.List;

import com.ute.ecwebapp.beans.Item;
import com.ute.ecwebapp.beans.Order;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

public class CartModel {
//    public static void updateCategory(Category c) {
//        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/quanlybanhang", "root", "");
//
//        String updateSql = "update categories set CatName = :catname where CatID = :catid";
//
//        try (Connection con = sql2o.open()) {
//            con.createQuery(updateSql)
//                    .addParameter("catname", c.getCatName())
//                    .addParameter("catid", c.getCatID())
//                    .executeUpdate();
//        }
//    }
    private static long totalPrice(List<Item> items) {
        long total = 0;
        for (Item item: items)
        {
            total = item.getQuantity()*item.getPrice();
        }
        return total;
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
