<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold text-primary">Dodaj kategorie</h5>
            </div>
            <div class="card-body">
                <div class="col-lg-12 text-left">
                    <form:form method="post" modelAttribute="category" action="/admin/category/add">
                        <div class="mb-3">
                            <form:label path="name">Nazwa:</form:label>
                            <form:input path="name"/>
                            <form:errors path="name" class="text-danger"/><br/>
                        </div>
                        <form:hidden path="id"/>

                        <form:button class="btn btn-primary btn-lg"
                                     type="submit">Dodaj kategorie</form:button>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End of Main Content -->

<jsp:include page="includes/footer.jsp"/>

<jsp:include page="includes/js.jsp"/>
</body>

</html>
