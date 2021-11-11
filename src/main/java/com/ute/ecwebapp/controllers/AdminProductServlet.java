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

@WebServlet(name = "AdminProductServlet", value = "/Admin/Product/*")
public class AdminProductServlet extends HttpServlet {
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

      case "/Add":
        ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
        break;
      case "/Edit":
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = ProductModel.getByID(id);
        if (p!= null)
        {
          request.setAttribute("product", p);
          ServletUtils.forward("/views/vwProduct/Edit.jsp", request, response);
        }
        else {
          ServletUtils.redirect("/Admin/Product", request, response);
        }
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

      case "/Delete":
        deleteProduct(request, response);
        break;

      case "/Update":
        updateProduct(request, response);
        break;

      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("ProName");
    int id = Integer.parseInt(request.getParameter("ProID"));
    String tiny = request.getParameter("TinyDes");
    String full = request.getParameter("FullDes");
    int catid = Integer.parseInt(request.getParameter("CatID"));
    int price = Integer.parseInt(request.getParameter("Price"));
    int quantity = Integer.parseInt(request.getParameter("Quantity"));
    Product p = new Product(id,name, tiny, full, price, catid, quantity);
    ProductModel.add(p);
    ServletUtils.forward("/views/vwProduct/Add.jsp", request, response);
  }

  private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String name = request.getParameter("ProName");
    int id = Integer.parseInt(request.getParameter("ProID"));
    String tiny = request.getParameter("TinyDes");
    String full = request.getParameter("FullDes");
    int catid = Integer.parseInt(request.getParameter("CatID"));
    int price = Integer.parseInt(request.getParameter("Price"));
    int quantity = Integer.parseInt(request.getParameter("Quantity"));//Name của Parameter tương đương name trong thẻ input của form Edit.jsp
    Product p = new Product(id,name, tiny, full, price, catid, quantity);
    ProductModel.update(p);
    ServletUtils.redirect("/Admin/Product", request, response);
  }

  private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("ProID"));
    ProductModel.delete(id);
    ServletUtils.redirect("/Admin/Product", request, response);
  }
}
