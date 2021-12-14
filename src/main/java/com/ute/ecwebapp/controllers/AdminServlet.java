package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Product;
import com.ute.ecwebapp.models.ProductModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/Admin/Product/*")
public class AdminServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      path = "/Index";
    }

    switch (path) {
      case "/Index":
        List<Product> list = ProductModel.findAll();
        request.setAttribute("products", list);
        ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
        break;
      case "/Edit":
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = ProductModel.getByID(id);
        if (p == null)
        {
          ServletUtils.forward("/views/vwProduct/Index.jsp", request, response);
        }
        else
        {
          request.setAttribute("product", p);
          ServletUtils.forward("/views/vwProduct/Edit.jsp", request, response);
        }
        break;
      case "/Add":
        ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
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
      case "/Add":
        addProduct(request, response);
        break;
      case "/Update":
        updateProduct(request, response);
        break;
      case "/Delete":
        deleteProduct(request, response);
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
    Product p = new Product(masp, ten, loai, size, mausac, chatlieu, soluong, gianhap, giaban,ghichu, indeximg);
    ProductModel.add(p);
    ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
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
}
