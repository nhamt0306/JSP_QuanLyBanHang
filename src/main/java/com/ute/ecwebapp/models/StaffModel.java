package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.Staff;
import org.sql2o.Connection;
import org.sql2o.Sql2o;

import java.util.List;
public class StaffModel {
    public static List<Staff> findAll() {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
        final String query = "SELECT * FROM tblnhanvien";
        try (Connection con = sql2o.open()) {
            return con.createQuery(query)
                    .executeAndFetch(Staff.class);
        }
    }

    public static List<Staff> findByID(Integer manv) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing","root","");
        final String query = "SELECT * FROM tblnhanvien where maNhanvien=:manv";
        try (Connection con = sql2o.open()) {
            return con.createQuery(query)
                    .addParameter("manv", manv)
                    .executeAndFetch(Staff.class);
        }
    }


    public static void add(Staff p) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        String insertSql = "INSERT INTO tblnhanvien (maNhanvien, tenNhanvien, gioitinh, diachi, dienthoai, ngaysinh, accID, maQuanly) VALUES (:manv,:tennv,:gt,:dc,:sdt,:dob,:accid,:maql)\n";

        try (Connection con = sql2o.open()) {
            con.createQuery(insertSql)
                    .addParameter("tennv", p.getTenNhanvien())
                    .addParameter("gt", p.getGioitinh())
                    .addParameter("dc", p.getDiachi())
                    .addParameter("sdt", p.getDienthoai())
                    .addParameter("dob", p.getNgaysinh())
                    .addParameter("accid", p.getAccID())
                    .addParameter("maql", p.getMaQuanly())
                    .addParameter("manv", p.getMaNhanvien())
                    .executeUpdate();
        }
    }

    public static Staff getByID (int manv) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");
        try (Connection con = sql2o.open()) {
            final String query = "select * from tblnhanvien where maNhanvien = :manv";
            List<Staff> list= con.createQuery(query) //addParameter để mapping giữa query với tham số
                    .addParameter("manv", manv) /*Tham số thứ nhất của query, tham số truyền vào*/
                    .executeAndFetch(Staff.class);
            if (list.size() == 0)
            {
                return null;
            }
            else
                return list.get(0);
        }
    }
    public static void update (Staff p) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

        String updateSql = "UPDATE tblnhanvien SET  tenNhanvien = :tennv, gioitinh = :gt, diachi = :dc, dienthoai = :sdt, ngaysinh = :dob, accID = :accid, maQuanly = :maql WHERE maNhanvien = :manv \n";

        try (Connection con = sql2o.open()) {
            con.createQuery(updateSql)
                    .addParameter("tennv", p.getTenNhanvien())
                    .addParameter("gt", p.getGioitinh())
                    .addParameter("dc", p.getDiachi())
                    .addParameter("sdt", p.getDienthoai())
                    .addParameter("dob", p.getNgaysinh())
                    .addParameter("accid", p.getAccID())
                    .addParameter("maql", p.getMaQuanly())
                    .addParameter("manv", p.getMaNhanvien())
                    .executeUpdate();
        }
    }
    public static void delete(int maNhanvien) {
        Sql2o sql2o = new Sql2o("jdbc:mysql://localhost:3306/webclothing", "root", "");

        String SQL = "delete from tblnhanvien where maNhanvien = :maNhanvien";

        try (Connection con = sql2o.open()) {
            con.createQuery(SQL)
                    .addParameter("maNhanvien", maNhanvien)
                    .executeUpdate();
        }
    }
}
