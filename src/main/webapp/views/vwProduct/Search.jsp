 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Product>"/>

<t:main>
    <jsp:body>
        <!--CONTENT-->
        <div class="content row grid wide">
            <!--Quần-->
            <div class="row content_products" style="margin-top: 100px">
                <a href="#" id="content_quan">
                    <div class="row content_title" >Sản phẩm tìm kiếm:</div>
                </a>
                <div class="row content_pants">
                    <c:forEach items="${products}" var="p">
                        <div class="col l-3 card_category">
                            <img class="content_item content_pant-img"
                                 src="${pageContext.request.contextPath}/public/img/${p.loaiSP}/${p.indeximg}/${p.loaiSP}${p.indeximg}.jpg" alt="">
                            <a class="content_item content_pant-name"
                               href="${pageContext.request.contextPath}/Product/Detail?id=${p.maSP}">
                                <h5>${p.tenSP}</h5>
                            </a>
                            <p class="content_item content_pant-price">
                                <span class="price_old">
                                  <strong>
                                    <fmt:formatNumber value="${p.dongiaBan}" type="number"/>
                                  </strong>
                                </span>
                                <span class="price_new">
                                  <strong>
                                    <fmt:formatNumber value="${p.dongiaNhap}" type="number"/>
                                  </strong>
                                </span>
                            </p>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </jsp:body>
</t:main>