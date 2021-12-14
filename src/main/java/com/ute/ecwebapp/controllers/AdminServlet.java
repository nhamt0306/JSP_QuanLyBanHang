package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Account;
import com.ute.ecwebapp.beans.Product;
import com.ute.ecwebapp.beans.Staff;
import com.ute.ecwebapp.models.AccountModel;
import com.ute.ecwebapp.models.ProductModel;
import com.ute.ecwebapp.models.StaffModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/Admin/*")
public class AdminServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      path = "/Product/Index";
    }
    else if (path.equals("Product") || path.equals("Product/")) {
      path = "/Product/Index";
    }
    else if (path.equals("Staff") || path.equals("Staff/")) {
      path = "/Staff/Index";
    }
    else if (path.equals("Account") || path.equals("Account/")) {
      path = "/Account/Index";
    }
    switch (path) {
      case "/Product/Index":
        List<Product> list = ProductModel.findAll();
        request.setAttribute("products", list);
        ServletUtils.forward("/views/vwAdmin/ProductIndex.jsp", request, response);
        break;
      case "/Product/Edit":
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = ProductModel.getByID(id);
        if (p == null)
        {
          ServletUtils.forward("/views/vwAdmin/ProductIndex.jsp", request, response);
        }
        else
        {
          request.setAttribute("product", p);
          ServletUtils.forward("/views/vwAdmin/ProductEdit.jsp", request, response);
        }
        break;
      case "/Product/Add":
        ServletUtils.forward("/views/vwAdmin/ProductAdd.jsp", request, response);
        break;
      case "/Staff/Index":
        List<Staff> listS = StaffModel.findAll();
        request.setAttribute("staffs", listS);
        ServletUtils.forward("/views/vwAdmin/StaffIndex.jsp", request, response);
        break;
      case "/Staff/Edit":
        int manv = Integer.parseInt(request.getParameter("manv"));
        Staff s = StaffModel.getByID(manv);
        if (s == null)
        {
          ServletUtils.forward("/views/vwAdmin/StaffIndex.jsp", request, response);
        }
        else
        {
          request.setAttribute("staff", s);
          ServletUtils.forward("/views/vwAdmin/StaffEdit.jsp", request, response);
        }
        break;
      case "/Staff/Add":
        ServletUtils.forward("/views/vwAdmin/StaffAdd.jsp", request, response);
        break;
      case "/Account/Index":
        List<Account> listA = AccountModel.findAll();
        request.setAttribute("accounts", listA);
        ServletUtils.forward("/views/vwAdmin/AccountIndex.jsp", request, response);
        break;
      case "/Account/Edit":
        String accID = request.getParameter("accID");
        Account a = AccountModel.getByID(accID);
        if (a == null)
        {
          ServletUtils.forward("/views/vwAdmin/AccountIndex.jsp", request, response);
        }
        else
        {
          request.setAttribute("account", a);
          ServletUtils.forward("/views/vwAdmin/AccountEdit.jsp", request, response);
        }
        break;
      case "/Account/Add":
        ServletUtils.forward("/views/vwAdmin/AccountAdd.jsp", request, response);
        break;
      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    switch (path) {
      case "/Product/Add":
        addProduct(request, response);
        break;
      case "/Product/Update":
        updateProduct(request, response);
        break;
      case "/Product/Delete":
        deleteProduct(request, response);
        break;
      case "/Staff/Add":
        try {
          addStaff(request, response);
        } catch (ParseException e) {
          e.printStackTrace();
        }
        break;
      case "/Staff/Update":
        updateStaff(request, response);
        break;
      case "/Staff/Delete":
        deleteStaff(request, response);
        break;
      case "/Account/Add":
        addAccount(request, response);
        break;
      case "/Account/Update":
        updateAccount(request, response);
        break;
      case "/Account/Delete":
        deleteAccount(request, response);
        break;
      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int masp = Integer.parseInt(request.getParameter("masp"));
    String ten = request.getParameter("tensp");
    String loai = request.getParameter("loaisp");
    String mausac = request.getParameter("mausac");
    int chatlieu = Integer.parseInt(request.getParameter("chatlieu"));
    String size = request.getParameter("size");
    int soluong = Integer.parseInt(request.getParameter("soluong"));
    int gianhap = Integer.parseInt(request.getParameter("giamua"));
    int giaban = Integer.parseInt(request.getParameter("giaban"));
    int indeximg = Integer.parseInt(request.getParameter("indeximg"));
    String ghichu = null;
    Product p = new Product(masp, ten, loai, size, mausac, chatlieu, soluong, gianhap, giaban, ghichu, indeximg);
    ProductModel.add(p);
    ServletUtils.forward("/views/vwAdmin/ProductAdd.jsp", request, response);
  }

  private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("masp"));
    String ten = request.getParameter("tensp");
    String loai = request.getParameter("loaisp");
    String mausac = request.getParameter("mausac");
    int chatlieu = Integer.parseInt(request.getParameter("chatlieu"));
    String size = request.getParameter("size");
    int soluong = Integer.parseInt(request.getParameter("soluong"));
    int gianhap = Integer.parseInt(request.getParameter("giamua"));
    int giaban = Integer.parseInt(request.getParameter("giaban"));
    int indeximg = Integer.parseInt(request.getParameter("indeximg"));
    Product p = new Product(id,ten, loai, size, mausac, chatlieu, soluong, gianhap, giaban,null, indeximg);
    ProductModel.update(p);
    ServletUtils.redirect("/Admin/Product", request, response);
  }

  private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("masp"));
    ProductModel.delete(id);
    ServletUtils.redirect("/Admin/Product", request, response);
  }

  private void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
    int manv = Integer.parseInt(request.getParameter("manv"));
    String tennv = request.getParameter("tennv");
    String gioitinh = request.getParameter("gt");
    String diachi = request.getParameter("dc");
    String sodienthoai = request.getParameter("sdt");
    Date dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
    int accid = Integer.parseInt(request.getParameter("accid"));
    int maql = Integer.parseInt(request.getParameter("maql"));
    Staff p = new Staff(manv, tennv, gioitinh, diachi, sodienthoai, dob, accid, maql);
    StaffModel.add(p);
    ServletUtils.forward("/views/vwAdmin/StaffAdd.jsp", request, response);
  }

  private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int manv = Integer.parseInt(request.getParameter("manv"));
    String tennv = request.getParameter("tennv");
    String gioitinh = request.getParameter("gt");
    String diachi = request.getParameter("dc");
    String sodienthoai = request.getParameter("sdt");
    Date dob = null;
    try {
      dob = new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("dob"));
    } catch (ParseException e) {
      e.printStackTrace();
    }
    int accid = Integer.parseInt(request.getParameter("accid"));
    int maql = Integer.parseInt(request.getParameter("maql"));
    Staff p = new Staff(manv, tennv, gioitinh, diachi, sodienthoai, dob, accid, maql);
    StaffModel.update(p);
    ServletUtils.redirect("/Admin/Staff/Index", request, response);
  }

  private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int manv = Integer.parseInt(request.getParameter("manv"));
    ProductModel.delete(manv);
    ServletUtils.redirect("/Admin/Staff/Index", request, response);
  }

  private void addAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String accID = request.getParameter("accID");
    String accPASS = request.getParameter("accPASS");
    String email = request.getParameter("email");
    Account a = new Account(accID, accPASS, email);
    AccountModel.add(a);
    ServletUtils.forward("/views/vwAdmin/AccountAdd.jsp", request, response);
  }

  private void updateAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String accID = request.getParameter("accID");
    String accPASS = request.getParameter("accPASS");
    String email = request.getParameter("email");
    Account a = new Account(accID, accPASS, email);
    AccountModel.update(a);
    ServletUtils.redirect("/Admin/Account", request, response);
  }

  private void deleteAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String accID = request.getParameter("accID");
    AccountModel.delete(accID);
    ServletUtils.redirect("/Admin/Account/Index", request, response);
  }

}
