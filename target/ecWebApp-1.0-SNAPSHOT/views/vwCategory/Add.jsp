<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<t:main>
    <jsp:body>
        <form action="" method="post">
            <div class="card">
                <h4 class="card-header">
                    New Category
                </h4>
                <div class="card-body">
                    <div class="form-group">
                        <label for="CatName">Category</label>
                        <input type="text" name="CatName" class="form-control" id="CatName" placeholder="Enter name" autofocus>
                    </div>
                </div>
                <div class="card-footer">
                    <a href="${pageContext.request.contextPath}/Admin/Category" class="btn btn-primary" role="button">
                        Back to Category List
                    </a>
                    <button type="submit" class="btn btn-outline-success">Save</button>
                </div>

            </div>
        </form>
    </jsp:body>
</t:main>