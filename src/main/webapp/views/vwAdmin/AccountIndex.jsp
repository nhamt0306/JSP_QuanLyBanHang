<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

<%--<jsp:useBean id="category" scope="request" type="com.ute.ecwebapp.beans.Category"/>--%>
<jsp:useBean id="accounts" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Account>"/>
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
                        <th scope="col">Mã Tài Khoản</th>
                        <th scope="col">Password</th>
                        <th scope="col">Email</th>
                        <th scope="col">Thao tác</th>
                    </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${accounts}" var="p">
                        <tr>
                            <th scope="row">${p.accID}</th>
                            <td>${p.accPASS}</td>
                            <td>${p.email}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/Admin/Account/Edit?accID=${p.accID}">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <a href="${pageContext.request.contextPath}/Admin/Account/Add" class="btn btn-outline-success" role="button" style="margin-left: 10px; margin-bottom: 10px">
                    <i class="fa fa-plus" aria-hidden="true"></i>
                    Thêm Tài Khoản
                </a>
            </div>
        </div>
    </jsp:body>
</t:main>