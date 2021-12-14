<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Product>"/>

<t:main>
  <jsp:body>
    <!--SLIDER - BOOTSTRAP-->
    <div class="slider row">
      <div id="carouselExampleInterval" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active" data-interval="10000">
            <img src="${pageContext.request.contextPath}/public/img/pictures/slider2.png" class="l-12 slider_picture" alt="...">
          </div>
          <div class="carousel-item" data-interval="2000">
            <img src="${pageContext.request.contextPath}/public/img/pictures/slider4.jpg" class="l-12 slider_picture" alt="...">
          </div>
          <div class="carousel-item">
            <img src="${pageContext.request.contextPath}/public/img/pictures/slider3.jpg" class="l-12 slider_picture" alt="...">
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleInterval" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleInterval" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>

    <!--CONTENT-->
    <div class="content row grid wide">
      <!--Quần-->
      <div class="row content_products">
<%--        <a href="#" id="content_quan">--%>
<%--          <div class="row content_title">QUẦN:</div>--%>
<%--        </a>--%>
        <div class="row content_pants">
          <c:forEach items="${products}" var="p">
            <div class="col l-3 card_category">
              <img class="content_item content_pant-img" src="${pageContext.request.contextPath}/public/img/${p.loaiSP}/${p.indeximg}/${p.loaiSP}${p.indeximg}.jpg" alt="">

              <a class="content_item content_pant-name" href="${pageContext.request.contextPath}/Product/Detail?id=${p.maSP}">
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