<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css">
<!--HEADER-->
<div class="header row" style="height: 85px">
  <div class="col l-3 header_left">
    <img src="${pageContext.request.contextPath}/public/img/pictures/logo_center.png" alt="" class="header_left-logo">
  </div>
  <div class="col l-6 header_center">
    <ul class="header_navbar_list">
      <li><a href="${pageContext.request.contextPath}/Home" class="header_navbar-item header_navbar-home" style="font-size: 18px">TRANG CHỦ</a></li>
      <li>
        <a class="header_navbar-item header_navbar-new" style="font-size: 18px">SẢN PHẨM</a>
        <ul class="header_subnav">
          <li>
            <a href="${pageContext.request.contextPath}/Product/All" class="header_subnav-item">Tất cả sản phẩm</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Product/Ao" class="header_subnav-item">Áo Nam/Nữ</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Product/Quan" class="header_subnav-item">Quần Nam/Nữ</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Product/Aokhoac" class="header_subnav-item">Áo khoác Nam/Nữ</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Product/Balo" class="header_subnav-item">Ba lô</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/Product/Quandui" class="header_subnav-item">Quần đùi Nam/Nữ</a>
          </li>
<%--          <li><a href="" class="header_subnav-item">Phụ Kiện Nam/Nữ</a></li>--%>
        </ul>
      </li>
      <li><a href="${pageContext.request.contextPath}/Home/Policy" class="header_navbar-item header_navbar-policy" style="font-size: 18px">CHÍNH SÁCH</a></li>
<%--      <li><a class="header_navbar-item header_navbar-sale" style="font-size: 18px">SALE OFF</a></li>--%>
      <li><a href="${pageContext.request.contextPath}/Home/Contact" class="header_navbar-item header_navbar-contact" style="font-size: 18px">LIÊN HỆ</a></li>
    </ul>
  </div>
  <div class="col l-3 header_right">
<%--    Tìm kiếm--%>
    <form action="Product/Search" method="get">
        <input class="header_right_input-find" type="text" name="keyfind" placeholder="Nhập từ khóa" style="background-color: rgba(0,0,0,0.4); color: white; width: 164px">
        <button type="submit" style="background-color: rgba(0,0,0,0); border: none"><i class="header_btn fas fa-search"></i></button>
    </form>
<%--    --%>
    <c:set var="total" value="${0}"/>
    <c:forEach var="p" items="${order.items}">
      <c:set var="total" value="${total + p.quantity}" />
    </c:forEach>
    <div id="cart" style="margin-top: 30px;">
      <a href="${pageContext.request.contextPath}/Cart">
        <i class="fa" style="font-size:24px; color: #cccccc;">&#xf07a;</i>
        <span class='badge badge-warning' id='lblCartCount'> ${total} </span>
      </a>
    </div>
    <div>
      <a href="${pageContext.request.contextPath}/Registration/Login"><i class="header_btn fas fa-user-circle"></i></a>
      <h5 style="text-align: center">${username}</h5>
    </div>
  </div>
</div>
