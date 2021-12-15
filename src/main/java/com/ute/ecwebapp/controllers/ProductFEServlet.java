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
            case "/Search":
                String key = request.getParameter("keyfind");
                List<Product> listf = ProductModel.findByName(key);
                request.setAttribute("products", listf);
                ServletUtils.forward("/views/vwProduct/Search.jsp", request, response);
                break;
            case "/All":
                List<Product> list = ProductModel.findAll();
                request.setAttribute("products", list);
                List<Product> listp = ProductModel.findByCat("pants");
                request.setAttribute("pants", listp);
                List<Product> lists = ProductModel.findByCat("shirt");
                request.setAttribute("shirt", lists);
                List<Product> listj = ProductModel.findByCat("jacket");
                request.setAttribute("jacket", listj);
                List<Product> listb = ProductModel.findByCat("bags");
                request.setAttribute("bags", listb);
                List<Product> listss = ProductModel.findByCat("shorts");
                request.setAttribute("shorts", listss);
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
            case "/Aokhoac":
                List<Product> list4 = ProductModel.findByCat("jacket");
                request.setAttribute("products", list4);
                ServletUtils.forward("/views/vwProduct/Aokhoac.jsp", request, response);
                break;
            case "/Balo":
                List<Product> list5 = ProductModel.findByCat("bags");
                request.setAttribute("products", list5);
                ServletUtils.forward("/views/vwProduct/Balo.jsp", request, response);
                break;
            case "/Quandui":
                List<Product> list6 = ProductModel.findByCat("shorts");
                request.setAttribute("products", list6);
                ServletUtils.forward("/views/vwProduct/Quandui.jsp", request, response);
                break;
            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }

}
