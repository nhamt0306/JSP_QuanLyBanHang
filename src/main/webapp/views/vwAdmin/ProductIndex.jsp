<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

<%--<jsp:useBean id="category" scope="request" type="com.ute.ecwebapp.beans.Category"/>--%>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Product>"/>
<t:main>
  <jsp:body>
    <div class="header" style="background-color: gray">
      <ul class="navbar_list">
        <li class="navbar_item"><a href="${pageContext.request.contextPath}/Admin/Product/Index">HÀNG HÓA</a></li>
        <li class="navbar_item"><a href="${pageContext.request.contextPath}/Admin/Staff/Index">NHÂN VIÊN</a></li>
        <li class="navbar_item"><a href="${pageContext.request.contextPath}/Admin/Order/Index">ĐƠN HÀNG</a></li>
        <li class="navbar_item"><a href="${pageContext.request.contextPath}/Admin/Account/Index">ACCOUNT</a></li>
      </ul>
    </div>
    <div class="main" >
<%--      <div class="form" id="frmProduct" style="margin-top: 80px">--%>
<%--        <form action="" class="form_accounts">--%>
<%--          <h2>Quản Lý Hàng Hóa</h2>--%>
<%--          <div class="input-form">--%>
<%--            <span>Mã Sản Phẩm</span>--%>
<%--            <input type="text" name="" placeholder="ID">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Tên Sản Phẩm</span>--%>
<%--            <input type="text" name="" placeholder="Name">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Loại Sản Phẩm</span>--%>
<%--            <input type="text" name="" placeholder="Sector">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Màu Sắc</span>--%>
<%--            <input type="text" name="" placeholder="Color">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Chất liệu</span>--%>
<%--            <input type="text" name="" placeholder="Material">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Size</span>--%>
<%--            <input type="text" name="" placeholder="Size">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Số Lượng</span>--%>
<%--            <input type="text" name="" placeholder="Unit">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Giá Nhập</span>--%>
<%--            <input type="text" name="" placeholder="Price">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Giá Bán</span>--%>
<%--            <input type="text" name="" placeholder="Price">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <span>Chỉ mục ảnh</span>--%>
<%--            <input type="text" name="" placeholder="Price">--%>
<%--          </div>--%>
<%--          <div class="input-form">--%>
<%--            <input type="submit" value="Lưu Lại">--%>
<%--          </div>--%>

<%--        </form>--%>
<%--      </div>--%>
      <div class="table" style="margin-top: 110px">
        <table class="table table-striped">
          <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Tên</th>
            <th scope="col">Loại</th>
            <th scope="col">Màu sắc</th>
            <th scope="col">Chất liệu</th>
            <th scope="col">Size</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Giá nhập</th>
            <th scope="col">Giá bán</th>
            <th scope="col">Chỉ mục ảnh</th>
            <th scope="col">Thao tác</th>
          </tr>
          </thead>

          <tbody>
            <c:forEach items="${products}" var="p">
              <tr>
                <th scope="row">${p.maSP}</th>
                <td>${p.tenSP}</td>
                <td>${p.loaiSP}</td>
                <td>${p.mauSP}</td>
                <td>${p.maChatlieu}</td>
                <td>${p.sizeSP}</td>
                <td>${p.soLuong}</td>
                <td>${p.dongiaNhap}</td>
                <td>${p.dongiaBan}</td>
                <td>${p.indeximg}</td>
                <td>
                  <a href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${p.maSP}">Edit</a>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
        <a href="${pageContext.request.contextPath}/Admin/Product/Add" class="btn btn-outline-success" role="button" style="margin-left: 10px; margin-bottom: 10px">
          <i class="fa fa-plus" aria-hidden="true"></i>
          Add Product
        </a>
      </div>
    </div>
  </jsp:body>
</t:main>