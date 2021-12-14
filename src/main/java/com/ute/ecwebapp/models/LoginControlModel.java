package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.Account;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;

public class LoginControlModel {
    public static Account checkLogin (String accid, String accpass) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        try (Connection con = sql2o.open()) {
            final String query = "SELECT accID, accPASS, email FROM tblaccount WHERE accID = :accid and accPASS = :accpass";
            List<Account> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
                    .addParameter("accid", accid) /*Tham số thứ nhất của query, tham số truyền vào*/
                    .addParameter("accpass", accpass)
                    .executeAndFetch(Account.class);
            if (list.size() == 0)
            {
                return null;
            }
            else
            {
                return list.get(0);
            }
        }
    }
    public static void addAccount (Account a) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        try (Connection con = sql2o.open()) {
            final String insertSql = "INSERT INTO tblaccount (accID, accPASS, email) VALUES (:accid,:accpass,:email)";
            con.createQuery(insertSql)
                    .addParameter("accid", a.getAccID()) /*Tham số thứ nhất của query, tham số truyền vào*/
                    .addParameter("accpass", a.getAccPASS())
                    .addParameter("email", a.getEmail())
                    .executeUpdate();
        }
    }

    public static Account findByUsername (String accid) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        try (Connection con = sql2o.open()) {
            final String query = "SELECT * FROM tblaccount WHERE accID = :accid";
            List<Account> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
                    .addParameter("accid", accid) /*Tham số thứ nhất của query, tham số truyền vào*/
                    .executeAndFetch(Account.class);
            if (list.size() == 0)
            {
                return null;
            }
            else
            {
                return list.get(0);
            }
        }
    }
}
