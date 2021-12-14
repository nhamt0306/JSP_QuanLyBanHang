package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Product;
import com.ute.ecwebapp.models.ProductModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = "/Home/*")
public class HomeServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      path = "/Index";
    }

    switch (path) {
      case "/Index":
        HttpSession session = request.getSession();
        session.setAttribute("user", 1);
        List<Product> list = ProductModel.findAll();
        request.setAttribute("products", list);
        ServletUtils.forward("/views/vwHome/Index.jsp", request, response);
        break;
      case "/Contact":
        ServletUtils.forward("/views/vwHome/Contact.jsp", request, response);
        break;
      case "/Policy":
        ServletUtils.forward("/views/vwHome/Policy.jsp", request, response);
        break;
      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

  }
}
