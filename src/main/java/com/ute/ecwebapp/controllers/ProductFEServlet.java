package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Product;
import com.ute.ecwebapp.models.ProductModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductFEServlet", value = "/Product/*")
public class ProductFEServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Index";
        }

        switch (path) {
            case "/Detail":
                int id = Integer.parseInt(request.getParameter("id"));
                Product p = ProductModel.getByID(id);
                request.setAttribute("product", p);
                ServletUtils.forward("/views/vwProduct/Detail.jsp", request, response);
                break;
            case "/All":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                ServletUtils.forward("/views/vwProduct/All.jsp", request, response);
                break;
            case "/Quan":
                List<Product> list2 = ProductModel.findByCat("pants");
                request.setAttribute("products", list2);
                ServletUtils.forward("/views/vwProduct/Quan.jsp", request, response);
                break;
            case "/Ao":
                List<Product> list3 = ProductModel.findByCat("shirt");
                request.setAttribute("products", list3);
                ServletUtils.forward("/views/vwProduct/Ao.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

}
