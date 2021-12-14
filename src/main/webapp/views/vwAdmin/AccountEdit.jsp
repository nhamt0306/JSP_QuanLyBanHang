<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

<jsp:useBean id="account" scope="request" type="com.ute.ecwebapp.beans.Account"/>

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
            <div class="form" id="frmProduct" style="margin-top: 80px;width: 100%">
                <form action="" class="form_accounts" method="post" style="width: 100%">
                    <h2>Quản Lý Tài Khoản</h2>
                    <div class="input-form">
                        <span>Mã Tài Khoản</span>
                        <input type="text" name="accID" value="${account.accID}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Mật Khẩu</span>
                        <input type="text" name="accPASS" value="${account.accPASS}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Email</span>
                        <input type="text" name="email" value="${account.email}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/Account/Update" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Lưu lại
                        </button>
                        <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Account/Delete" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Xóa Tài Khoản
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:main>