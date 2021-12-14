<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="product" scope="request" type="com.ute.ecwebapp.beans.Product"/>

<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="ProID">#</label>
                        <input type="text" name="ProID" class="form-control" id="ProID" value="${product.proID}" readonly>
                    </div>
                    <div class="form-group">
                        <label for="ProName">Product</label>
                        <input type="text" name="ProName" class="form-control" id="ProName" value="${product.proName}" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="TinyDes">TinyDes</label>
                        <input type="text" name="TinyDes" class="form-control" id="TinyDes" value="${product.tinyDes}">
                    </div>
                    <div class="form-group">
                        <label for="FullDes">FullDes</label>
                        <input type="text" name="FullDes" class="form-control" id="FullDes" value="${product.fullDes}">
                    </div>
                    <div class="form-group">
                        <label for="Price">Price</label>
                        <input type="text" name="Price" class="form-control" id="Price" value="${product.price}">
                    </div>
                    <div class="form-group">
                        <label for="CatID">Cat ID</label>
                        <input type="text" name="CatID" class="form-control" id="CatID" value="${product.catID}">
                    </div>
                    <div class="form-group">
                        <label for="Quantity">Quantity</label>
                        <input type="text" name="Quantity" class="form-control" id="Quantity" value="${product.quantity}">
                    </div>
                </div>

                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/Admin/Product" class="btn btn-primary" role="button">
                        Product List
                    </a>
                    <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/Product/Update">
                        Save
                    </button>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Product/Delete">
                        Delete
                    </button>
                </div>

            </div>
        </form>
    </jsp:body>
</t:main>