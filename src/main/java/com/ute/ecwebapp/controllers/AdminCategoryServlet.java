package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Category;
import com.ute.ecwebapp.models.CategoryModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminCategoryServlet", value = "/Admin/Category/*")
public class AdminCategoryServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      path = "/Index";
    }

    switch (path) {
      case "/Index":
        // Category c = new Category(1, "Sách");
        // request.setAttribute("category", c);

        List<Category> list = CategoryModel.findAll();
        request.setAttribute("categories", list);
        ServletUtils.forward("/views/vwCategory/Index.jsp", request, response);
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
