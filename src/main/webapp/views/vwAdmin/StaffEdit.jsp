<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/management.css">

<jsp:useBean id="staff" scope="request" type="com.ute.ecwebapp.beans.Staff"/>

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
                        <input type="text" name="manv" value="${staff.maNhanvien}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Tên Nhân Viên</span>
                        <input type="text" name="tennv" value="${staff.tenNhanvien}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Giới Tính</span>
                        <input type="text" name="gt" value="${staff.gioitinh}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Địa Chỉ</span>
                        <input type="text" name="dc" value="${staff.diachi}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Số Điện Thoại</span>
                        <input type="text" name="sdt" value="${staff.dienthoai}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Ngày Sinh</span>
                        <input type="date" name="dob" min="1900-01-01" max="2099-12-31" value="${staff.ngaysinh}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Mã Tài Khoản</span>
                        <input type="text" name="accid" value="${staff.accID}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Mã Quản Lý</span>
                        <input type="text" name="maql" value="${staff.maQuanly}" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/Staff/Update" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Lưu lại
                        </button>
                        <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Staff/Delete" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Xóa nhân viên
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:main>