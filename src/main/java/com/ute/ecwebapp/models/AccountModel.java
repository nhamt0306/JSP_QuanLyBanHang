package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.Account;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;
public class AccountModel {
    public static List<Account> findAll() {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
        final String query = "SELECT * FROM tblaccount";
        try (Connection con = sql2o.open()) {
            return con.createQuery(query)
                    .executeAndFetch(Account.class);
        }
    }

    public static List<Account> findByID(String accID) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
        final String query = "SELECT * FROM tblaccount where accID=:accID";
        try (Connection con = sql2o.open()) {
            return con.createQuery(query)
                    .addParameter("accID", accID)
                    .executeAndFetch(Account.class);
        }
    }


    public static void add(Account p) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        String insertSql = "INSERT INTO tblaccount (accID, accPASS, email) VALUES (:accID, :accPASS, :email)\n";

        try (Connection con = sql2o.open()) {
            con.createQuery(insertSql)
                    .addParameter("accPASS", p.getAccPASS())
                    .addParameter("accID", p.getAccID())
                    .addParameter("email", p.getEmail())
                    .executeUpdate();
        }
    }

    public static Account getByID (String accID) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        try (Connection con = sql2o.open()) {
            final String query = "select * from tblaccount where accID = :accID";
            List<Account> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
                    .addParameter("accID", accID) /*Tham số thứ nhất của query, tham số truyền vào*/
                    .executeAndFetch(Account.class);
            if (list.size() == 0)
            {
                return null;
            }
            else
                return list.get(0);
        }
    }
    public static void update (Account p) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

        String updateSql = "UPDATE tblnhanvien SET  accPASS = :accPASS, email = :email WHERE accID = :accID \n";

        try (Connection con = sql2o.open()) {
            con.createQuery(updateSql)
                    .addParameter("accPASS", p.getAccPASS())
                    .addParameter("accID", p.getAccID())
                    .addParameter("email", p.getEmail())
                    .executeUpdate();
        }
    }
    public static void delete(String accID) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

        String SQL = "delete from tblaccount where accID = :accID";

        try (Connection con = sql2o.open()) {
            con.createQuery(SQL)
                    .addParameter("accID", accID)
                    .executeUpdate();
        }
    }
}
