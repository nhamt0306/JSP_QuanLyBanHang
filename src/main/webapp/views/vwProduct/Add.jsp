<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Product
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="ProID">#</label>
                        <input type="text" name="ProID" class="form-control" id="ProID" placeholder="Enter ID" autofocus>
                    </div>
                    <div class="form-group">
                        <label for="ProName">Product</label>
                        <input type="text" name="ProName" class="form-control" id="ProName" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="TinyDes">TinyDes</label>
                        <input type="text" name="TinyDes" class="form-control" id="TinyDes" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="FullDes">FullDes</label>
                        <input type="text" name="FullDes" class="form-control" id="FullDes" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="Price">Price</label>
                        <input type="text" name="Price" class="form-control" id="Price" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="CatID">Cat ID</label>
                        <input type="text" name="CatID" class="form-control" id="CatID" placeholder="Enter name">
                    </div>
                    <div class="form-group">
                        <label for="Quantity">Quantity</label>
                        <input type="text" name="Quantity" class="form-control" id="Quantity" placeholder="Enter name">
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/Admin/ProName" class="btn btn-primary" role="button">
                        Back to Category List
                    </a>
                    <button type="submit" class="btn btn-outline-success">Save</button>
                </div>

            </div>
        </form>
    </jsp:body>
</t:main>