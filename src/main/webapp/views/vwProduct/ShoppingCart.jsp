<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/shoppingcart.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/styles.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/grid.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/fonts/fontawesome-free-5.15.4-web/css/all.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<%--<jsp:useBean id="order" scope="session" type="java.util.List<com.ute.ecwebapp.beans.Order>" />--%>
<t:main>
    <jsp:body>
        <div class="main grid">
            <div class="ShoppingCart-header" >
                <h1 class="ShoppingCart-title" style="padding-top: 120px; font-size:40px; font-weight: bold; background-color: white">GIỎ HÀNG</h1>
            </div>
            <div class="ShoppingCart-container row grid wide" style="margin-top: -60px; margin-bottom: 30px">
                <div class="col l-9 ShoppingCart-content">
                    <div class="row">
                        <div class="container">
                            <table id="cart" class="table table-hover table-condensed">
                                <thead>
                                <tr>
                                    <th style="width:48%">Tên sản phẩm</th>
                                    <th style="width:10%">Giá</th>
                                    <th style="width:10%">Số lượng</th>
                                    <th style="width:22%" class="text-center">Thành tiền</th>
                                    <th style="width:10%"> </th>
                                </tr>
                                </thead>
                                <tbody>
<%--                                    --%>
<%--&lt;%&ndash;                                    Sản phẩm của sản phẩm 2&ndash;%&gt;--%>
<%--                                    <tr>--%>
<%--                                        <td data-th="Product">--%>
<%--                                            <div class="row">--%>
<%--                                                <div class="col-sm-2 hidden-xs"><img src="http://hocwebgiare.com/thiet_ke_web_chuan_demo/shopping_cart/images/174.jpg" alt="Sản phẩm 1" class="img-responsive" width="100">--%>
<%--                                                </div>--%>
<%--                                                <div class="col-sm-10">--%>
<%--                                                    <h4 class="nomargin">Sản phẩm 2</h4>--%>
<%--                                                    <p>Mô tả của sản phẩm 2</p>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </td>--%>
<%--                                        <td data-th="Price">300.000 đ</td>--%>
<%--                                        <td data-th="Quantity"><input class="form-control text-center" value="1" type="number">--%>
<%--                                        </td>--%>
<%--                                        <td data-th="Subtotal" class="text-center">300.000 đ</td>--%>
<%--                                        <td class="actions" data-th="">--%>
<%--                                            <button class="btn btn-danger btn-sm">--%>
<%--                                                <i class="far fa-trash-alt"></i>--%>
<%--                                            </button>--%>
<%--                                        </td>--%>
<%--                                    </tr>--%>

<%--
<%--                                Sản phẩm tính bằng foreach--%>
                                    <c:set var="names" value="${sessionScope.order}"/>
                                    <c:forEach items="${order.items}" var="p">
                                        <tr>
                                            <td data-th="Product">
                                                <div class="row">
                                                    <div class="col-sm-2 hidden-xs"><img src="${pageContext.request.contextPath}/public/img/${p.p.loaiSP}/${p.p.indeximg}/${p.p.loaiSP}${p.p.indeximg}.jpg" class="img-responsive" width="100">
                                                    </div>
                                                    <div class="col-sm-10">
                                                        <h4 class="nomargin">${p.p.tenSP}</h4>
                                                        <p>Size: ${p.p.sizeSP}</p>
                                                        <p>Màu: ${p.p.mauSP}</p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td data-th="Price">${p.price}đ</td>
                                            <td data-th="Quantity"><input class="form-control text-center" value="${p.quantity}" type="number">
                                            </td>
                                            <td data-th="Subtotal" class="text-center">${p.price*p.quantity}đ</td>
                                            <td class="actions" data-th="">
                                                <button class="btn btn-danger btn-sm">
                                                    <i class="far fa-trash-alt"></i>
                                                </button>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </tbody><tfoot>
<%--                            <tr class="visible-xs">--%>
<%--                                <c:set var="totalprice" value="${sessionScope.totalprice}"/>--%>
<%--                                <td class="text-center"><strong>Tổng 200.000 đ</strong>--%>
<%--                                </td>--%>
<%--                            </tr>--%>
                            <tr>
                                <td><a href="${pageContext.request.contextPath}/Home" class="btn btn-warning"><i class="fa fa-angle-left"></i> Tiếp tục mua hàng</a>
                                </td>
                                <td colspan="2" class="hidden-xs"> </td>
                                <td class="hidden-xs text-center"><strong>Tổng tiền: <fmt:formatNumber value="${sessionScope.totalprice}" type="number"/>đ</strong></td>
                                <td><label class="btn btn-success btn-block" for="thanhtoan">Thanh toán <i class="fa fa-angle-right"></i></label>
                                </td>
                            </tr>
                            </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
<%--                Total price--%>
                <c:set var="total" value="${sessionScope.totalprice}" scope="session"/>
                <div class="col l-3 ShoppingCart-pay">
                    <div class="row ShoppingCart-discount" style="margin-left: 0">
                        <label for="discount-input">Mã giảm giá:</label>
                        <input type="text" class="discount-title" id="discount-input">
                        <input type="button" value="Apply" class="discount-btn">
                    </div>
                    <div class="row ShoppingCart-totalprice" style="margin-left: 0; margin-top: 10px">
                        <label >Tổng tiền:
                            <span>
                                    <fmt:formatNumber value="${sessionScope.totalprice}" type="number"/>đ
                            </span>
                        </label>
                        <label >Phí giao hàng: <span>30,000đ</span></label>
                        <label >Giảm giá: <span>0đ</span></label>
                        <label >Thành tiền:
                            <span>
                                    <fmt:formatNumber value="${sessionScope.totalprice}" type="number"/>đ
                            </span>
                        </label>
                        <label >Phương thức thanh toán: <span>Tiền mặt</span></label>
                        <label >Khách hàng: <span>Thanh Nhã</span></label>
                        <label >Địa chỉ giao hàng: <span>TP HCM</span></label>
                        <input type="button" value="Thanh toán" class="pay-btn" id="thanhtoan">
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery-1.11.1.min.js"></script>
    </jsp:body>
</t:main>