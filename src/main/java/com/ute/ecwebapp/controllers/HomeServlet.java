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
        List<Product> list2 = ProductModel.findByCat("pants");
        request.setAttribute("pants", list2);
        List<Product> list3 = ProductModel.findByCat("shirt");
        request.setAttribute("shirt", list3);
        List<Product> list4 = ProductModel.findByCat("jacket");
        request.setAttribute("jacket", list4);
        List<Product> list5 = ProductModel.findByCat("bags");
        request.setAttribute("bags", list5);
        List<Product> list6 = ProductModel.findByCat("shorts");
        request.setAttribute("shorts", list6);
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
