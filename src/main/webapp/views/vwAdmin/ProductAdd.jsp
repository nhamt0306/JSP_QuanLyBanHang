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
                    <h2>Quản Lý Hàng Hóa</h2>
                    <div class="input-form">
                        <span>Mã Sản Phẩm</span>
                        <input type="text" name="masp"  style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Tên Sản Phẩm</span>
                        <input type="text" name="tensp" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Loại Sản Phẩm</span>
                        <input type="text" name="loaisp" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Màu Sắc</span>
                        <input type="text" name="mausac" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Chất liệu</span>
                        <input type="text" name="chatlieu" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Size</span>
                        <input type="text" name="size" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Số Lượng</span>
                        <input type="text" name="soluong" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Giá Nhập</span>
                        <input type="text" name="giamua" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Giá Bán</span>
                        <input type="text" name="giaban" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <span>Chỉ mục ảnh</span>
                        <input type="text" name="indeximg" style="width: 102%">
                    </div>
                    <div class="input-form">
                        <button type="submit" class="btn btn-outline-success" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Thêm sản phẩm
                        </button>
                        <a href="${pageContext.request.contextPath}/Admin/Product/Index" class="btn btn-primary" role="button" style="padding: 5px 40px; font-size: 25px; font-weight: bold">
                            Danh sách sản phẩm
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </jsp:body>
</t:main>