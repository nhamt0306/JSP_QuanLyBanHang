<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

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
                    <h2>Quản Lý Nhân Viên</h2>
                    <div class="input-form">
                        <span>Mã Nhân Viên</span>
                        <input type="text" name="manv"  style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Tên Nhân Viên</span>
                        <input type="text" name="tennv" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Giới Tính</span>
                        <input type="text" name="gt" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Địa Chỉ</span>
                        <input type="text" name="dc" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Số Điện Thoại</span>
                        <input type="text" name="sdt" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Ngày Sinh</span>
                        <input type="date" name="dob" min="1900-01-01" max="2099-12-31" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Mã Tài Khoản</span>
                        <input type="text" name="accid" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Mã Quản Lý</span>
                        <input type="text" name="maql" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <button type="submit" class="btn btn-outline-success" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Thêm nhân viên
                        </button>
                        <a href="${pageContext.request.contextPath}/Admin/Staff/Index" class="btn btn-primary" role="button" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Danh sách nhân viên
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:main>