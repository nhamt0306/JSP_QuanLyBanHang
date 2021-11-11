<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="category" scope="request" type="com.ute.ecwebapp.beans.Category"/>

<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="CatID">Category</label>
                        <input type="text" name="CatID" class="form-control" id="CatID" readonly value="${category.catID}">
                    </div>
                    <div class="form-group">
                        <label for="CatName">Category</label>
                        <input type="text" name="CatName" class="form-control" id="CatName" value="${category.catName}" autofocus>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/Admin/Category" class="btn btn-primary" role="button">
                        Back to Category List
                    </a>
                    <button type="submit" class="btn btn-outline-success" formaction="${pageContext.request.contextPath}/Admin/Category/Update">
                        Save
                    </button>
                    <button type="submit" class="btn btn-danger" formaction="${pageContext.request.contextPath}/Admin/Category/Delete">
                        Delete
                    </button>
                </div>

            </div>
        </form>
    </jsp:body>
</t:main>