<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

<%--<jsp:useBean id="category" scope="request" type="com.ute.ecwebapp.beans.Category"/>--%>
<jsp:useBean id="staffs" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Staff>"/>
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
            <div class="table" style="margin-top: 110px">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Mã nhân viên</th>
                        <th scope="col">Tên nhân viên</th>
                        <th scope="col">Giới tính</th>
                        <th scope="col">Địa chỉ</th>
                        <th scope="col">Điện thoại</th>
                        <th scope="col">Ngày sinh</th>
                        <th scope="col">ID Tài khoản</th>
                        <th scope="col">Mã quản lý</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${staffs}" var="p">
                        <tr>
                            <th scope="row">${p.maNhanvien}</th>
                            <td>${p.tenNhanvien}</td>
                            <td>${p.gioitinh}</td>
                            <td>${p.diachi}</td>
                            <td>${p.dienthoai}</td>
                            <td>${p.ngaysinh}</td>
                            <td>${p.accID}</td>
                            <td>${p.maQuanly}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/Admin/Staff/Edit?manv=${p.maNhanvien}">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="${pageContext.request.contextPath}/Admin/Staff/Add" class="btn btn-outline-success" role="button" style="margin-left: 10px; margin-bottom: 10px">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Add Staff
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>