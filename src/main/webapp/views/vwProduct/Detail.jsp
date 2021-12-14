<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product_detail.css">

<jsp:useBean id="product" scope="request" type="com.ute.ecwebapp.beans.Product"/>

<t:main>
    <jsp:body>
        <div class="main grid wide">
            <div class="row">
                <div class="col l-5">
                    <div class="row" style="margin-top: 120px">
                        <img class="pant_product" src="${pageContext.request.contextPath}/public/img/${product.loaiSP}/${product.indeximg}/${product.loaiSP}${product.indeximg}.jpg" style="margin-top: -90px">
                    </div>
<%--                    <div class="row pant_footer" style="margin-bottom: 80px">--%>
<%--                        <div class="col l-3">--%>
<%--                            <img class="pant_more" src="${pageContext.request.contextPath}/public/img/pants/pant1.jpg" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="col l-3">--%>
<%--                            <img class="pant_more" src="${pageContext.request.contextPath}/public/img/pants/pant2.jpg" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="col l-3">--%>
<%--                            <img class="pant_more" src="${pageContext.request.contextPath}/public/img/pants/pant3.jpg" alt="">--%>
<%--                        </div>--%>
<%--                        <div class="col l-3">--%>
<%--                            <img class="pant_more" src="${pageContext.request.contextPath}/public/img/pants/pant2.jpg" alt="">--%>
<%--                        </div>--%>
<%--                    </div>--%>
                </div>
                <div class="col l-7 pant_right" style="margin-top: 120px">
                    <h3 class="pant_title">${product.tenSP}</h3>
                    <p class="pant_price">
                        <span class="price_old">
                            <strong>
                                <fmt:formatNumber value="${product.dongiaBan}" type="number"/>
                            </strong>
                        </span>
                        <span class="price_new">
                            <strong>
                                <fmt:formatNumber value="${product.dongiaNhap}" type="number"/>
                            </strong>
                        </span>
                    </p>
                    <h5>Kích thước:</h5>
                    <select name="" id="pant_size_option">
                        <option value="size">${product.sizeSP}</option>
                    </select>

                    <h5>Màu sắc:</h5>
                    <select name="" id="pant_color_option">
                        <option value="color">${product.mauSP}</option>
                    </select>
                    <h5>Số lượng còn lại: ${product.soLuong}</h5>
                    <h5>Mô tả:</h5>
                    <p class="pant_desc">
                        ${product.tenSP} <br>
                        MÀU SẮC: ${product.mauSP} <br>
                        BẢNG SIZE: <br>
                        <img src="${pageContext.request.contextPath}/public/img/pictures/size_chart.jpg" alt="" width="60%">
                    </p>
<%--                    <button role="button" value="Thêm vào giỏ hàng" class="pant_add_cart" style="margin-top: -28px">--%>
<%--                        Thêm vào giỏ hàng--%>
<%--                    </button>--%>
                    <a role="button" href="${pageContext.request.contextPath}/Cart/Add?id=${product.maSP}" class="pant_add_cart" style="margin-top: -28px">
                        Thêm vào giỏ hàng
                    </a>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>