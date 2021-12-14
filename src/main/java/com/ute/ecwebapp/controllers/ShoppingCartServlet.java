package com.ute.ecwebapp.controllers;

import com.ute.ecwebapp.beans.Account;
import com.ute.ecwebapp.beans.Item;
import com.ute.ecwebapp.beans.Order;
import com.ute.ecwebapp.beans.Product;
import com.ute.ecwebapp.models.CartModel;
import com.ute.ecwebapp.models.LoginControlModel;
import com.ute.ecwebapp.models.ProductModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShoppingCartServlet", value = "/Cart/*")
public class ShoppingCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Detail";
        }

        switch (path) {
            case "/Detail":
                totalPrice(request, response);
                ServletUtils.forward("/views/vwProduct/ShoppingCart.jsp", request, response);
                break;
            case "/Add":
                addToCart(request, response);
//                ServletUtils.forward("/views/vwProduct/ShoppingCart.jsp", request, response);
                ServletUtils.redirect("/Home/Index",request,response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String path = request.getPathInfo();
        if (path == null || path.equals("/")) {
            path = "/Detail";
        }

        switch (path) {
            case "/Add":
                addToCart(request, response);
//                ServletUtils.forward("/views/vwProduct/ShoppingCart.jsp", request, response);
                //ServletUtils.redirect("/Home/Index",request,response);
                break;

            default:
                ServletUtils.forward("/views/404.jsp", request, response);
                break;
        }
    }
    private void addToCart (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int quantity = 1;
        int id = Integer.parseInt(request.getParameter("id"));
        Product p = ProductModel.getByID(id);
        if(p != null)
        {
            if(request.getParameter("quantity") != null)
            {
                quantity = Integer.parseInt(request.getParameter("quantity"));
            }
        }
        HttpSession session = request.getSession();
        if(session.getAttribute("order") ==null)
        {
            Order order = new Order();
            List<Item> list = new ArrayList<>();
            Item item = new Item();
            item.setQuantity(quantity);
            item.setP(p);
            item.setPrice(p.getDongiaBan());
            list.add(item);
            order.setItems(list);
            session.setAttribute("order", order);
            session.setAttribute("list", list);
        }
        else {
            Order order = (Order) session.getAttribute("order");
            List<Item> list = order.getItems();
            boolean check = false;
            for (Item item:list){
                if(item.getP().getMaSP() == p.getMaSP())
                {
                    item.setQuantity(item.getQuantity() + quantity);
                    check = true;
                }
            }
            if (check == false)
            {
                Item item = new Item();
                item.setQuantity(quantity);
                item.setP(p);
                item.setPrice(p.getDongiaBan());
                list.add(item);
                session.setAttribute("list", list);
            }
            session.setAttribute("order", order);
        }

    }
    private void totalPrice (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long total = 0;

        HttpSession session = request.getSession();
        if(session.getAttribute("order") ==null)
        {
            total = 0;
            session.setAttribute("totalprice", total);
        }
        else {
            Order order = (Order) session.getAttribute("order");
            List<Item> listItem = order.getItems();

            for (Item item:listItem)
            {
                total = total + (item.getPrice()*item.getQuantity());
            }
            session.setAttribute("totalprice", total);
        }

    }
}
