<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<jsp:useBean id="category" scope="request" type="com.ute.ecwebapp.beans.Category"/>--%>
<jsp:useBean id="products" scope="request" type="java.util.List<com.ute.ecwebapp.beans.Product>"/>

<t:main>
  <jsp:body>
    <div class="card">
      <h4 class="card-header d-flex justify-content-between">
        Products
        <a href="${pageContext.request.contextPath}/Admin/Product/Add" class="btn btn-outline-success" role="button">
          <i class="fa fa-plus" aria-hidden="true"></i>
          Add Product
        </a>
      </h4>
      <c:choose>
        <c:when test="${products.size() == 0}">
          <div class="card-body">
            <p class="card-text">Không có dữ liệu.</p>
          </div>
        </c:when>
        <c:otherwise>
          <div class="card-body">
            <table class="table table-hover">
              <thead>
                <tr>
                  <th>#</th>
                  <th>Product</th>
                  <th>Tiny Des&nbsp;</th>
                  <th>Full Des&nbsp;</th>
                  <th>Price&nbsp;</th>
                  <th>Cat ID&nbsp;</th>
                  <th>Quantity</th>
                  <th>&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach items="${products}" var="p">
                  <tr>
                    <td>${p.proID}</td>
                    <td>${p.proName}</td>
                    <td>${p.tinyDes}</td>
                    <td>${p.fullDes}</td>
                    <td>${p.price}</td>
                    <td>${p.catID}</td>
                    <td>${p.quantity}</td>
                    <td class="text-right">
                      <a class="btn btn-sm btn-outline-primary" href="${pageContext.request.contextPath}/Admin/Product/Edit?id=${p.proID}" role="button">
                        <i class="fa fa-pencil" aria-hidden="true"></i>
                      </a>
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </c:otherwise>
      </c:choose>
    </div>
  </jsp:body>
</t:main>