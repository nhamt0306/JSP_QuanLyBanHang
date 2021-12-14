package com.ute.ecwebapp.controllers;


import at.favre.lib.crypto.bcrypt.BCrypt;
import com.ute.ecwebapp.beans.Account;
import com.ute.ecwebapp.models.LoginControlModel;
import com.ute.ecwebapp.utils.ServletUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet", value = "/Registration/*")
public class LoginServlet extends HttpServlet {
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String path = request.getPathInfo();
    if (path == null || path.equals("/")) {
      path = "/Login";
    }

    switch (path) {
      case "/Login":
        ServletUtils.forward("/views/vwLogin/Login.jsp", request, response);
        break;
      case "/Register":
        ServletUtils.forward("/views/vwLogin/Register.jsp", request, response);
        break;
      case "/IsAvailable":
        isAvailable(request, response);
        break;
      case "/LoginSuccess":
        loginSuccess(request, response);
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
      case "/Login":
        checkLogin(request, response);
        break;
      case "/Register":
        addAccount(request, response);
        break;
      default:
        ServletUtils.forward("/views/404.jsp", request, response);
        break;
    }
  }
  private void checkLogin (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("login_username");
    String pwd = request.getParameter("login_password");

    Account check = LoginControlModel.checkLogin(username, pwd);
    if (check == null)
    {
      ServletUtils.forward("/views/vwLogin/Login.jsp", request, response);
    }
    else
    {
      HttpSession session = request.getSession();
      session.setAttribute("username", username);
      session.setAttribute("status", "login");
      ServletUtils.redirect("/Home", request, response);
    }
  }
  private void addAccount (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("username");
    String pwd = request.getParameter("password");
    String bcryptHashString = BCrypt.withDefaults().hashToString(12, pwd.toCharArray());
    String email = request.getParameter("email");
    Account a = new Account(username, bcryptHashString, email);
    LoginControlModel.addAccount(a);
    ServletUtils.redirect("/Registration/Login", request, response);
  }
  private void isAvailable (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String username = request.getParameter("user");
    Account user = LoginControlModel.findByUsername(username);
    Boolean available;
    if (user == null)
    {
      available = true;
    }
    else {
      available = false;
    }
    PrintWriter out = response.getWriter();
    response.setContentType("application/json");
    response.setCharacterEncoding("utf-8");

    out.print(available);
    out.flush();
  }
  private void loginSuccess (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String usernamee = request.getParameter("user");
    String pwd = request.getParameter("pass");

    Account check = LoginControlModel.checkLogin(usernamee, pwd);

    Boolean available;
    if (check == null)
    {
      available = false;
    }
    else
    {
      available = true;
    }

    PrintWriter out = response.getWriter();
    response.setContentType("application/json");
    response.setCharacterEncoding("utf-8");

    out.print(available);
    out.flush();
  }
}
