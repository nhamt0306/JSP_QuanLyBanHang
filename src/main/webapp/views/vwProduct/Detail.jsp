<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/product_detail.css">
<jsp:useBean id="product" scope="request" type="com.ute.ecwebapp.beans.Product"/>

<t:main>
    <jsp:attribute name="css">
        <style>
            #zoom-img {
                width: 300px;
                height: 150px;
                background: url("${pageContext.request.contextPath}/public/img/pictures/size_chart.jpg");
                background-position: center;
                background-size: cover;
            }
        </style>
    </jsp:attribute>
    <jsp:attribute name="js">
        <script>
            // CREDITS TO https://www.cssscript.com/image-zoom-pan-hover-detail-view/
            var addZoom = function (target) {
                // (A) FETCH CONTAINER + IMAGE
                var container = document.getElementById(target),
                    imgsrc = container.currentStyle || window.getComputedStyle(container, false),
                    imgsrc = imgsrc.backgroundImage.slice(4, -1).replace(/"/g, ""),
                    img = new Image();

                // (B) LOAD IMAGE + ATTACH ZOOM
                img.src = imgsrc;
                img.onload = function () {
                    var imgWidth = img.naturalWidth,
                        imgHeight = img.naturalHeight,
                        ratio = imgHeight / imgWidth,
                        percentage = ratio * 100 + '%';

                    // (C) ZOOM ON MOUSE MOVE
                    container.onmousemove = function (e) {
                        var boxWidth = container.clientWidth,
                            rect = e.target.getBoundingClientRect(),
                            xPos = e.clientX - rect.left,
                            yPos = e.clientY - rect.top,
                            xPercent = xPos / (boxWidth / 100) + "%",
                            yPercent = yPos / ((boxWidth * ratio) / 100) + "%";

                        Object.assign(container.style, {
                            backgroundPosition: xPercent + ' ' + yPercent,
                            backgroundSize: imgWidth + 'px'
                        });
                    };

                    // (D) RESET ON MOUSE LEAVE
                    container.onmouseleave = function (e) {
                        Object.assign(container.style, {
                            backgroundPosition: 'center',
                            backgroundSize: 'cover'
                        });
                    };
                }
            };

            window.addEventListener("load", function(){
                addZoom("zoom-img");
            });

        </script>
    </jsp:attribute>
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
                    </p>
                    <div class="img-zoom-container">
                        <div id="zoom-img"></div>
                    </div>
<%--                    <button role="button" value="Thêm vào giỏ hàng" class="pant_add_cart" style="margin-top: -28px">--%>
<%--                        Thêm vào giỏ hàng--%>
<%--                    </button>--%>
                    <div style="margin-top: 30px;">
                        <a role="button" href="${pageContext.request.contextPath}/Cart/Add?id=${product.maSP}" class="pant_add_cart btn btn-secondary btn-lg active" style="margin-top: -28px">
                            <i class="fa fa-shopping-cart" aria-hidden="true"> Thêm vào giỏ hàng</i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>