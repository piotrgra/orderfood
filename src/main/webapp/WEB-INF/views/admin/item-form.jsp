<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="d-flex p-2">
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Dodaj przedmiot</h4>
            <form:form method="post" modelAttribute="item" action="/admin/item/add">
                <div class="mb-3">
                    <form:label path="name">Name:</form:label>
                    <form:input path="name"/>
                    <form:errors path="name" cssClass="errorMessage"/><br/>
                </div>
                <div class="mb-3">
                    <form:label path="description">Description:</form:label>
                    <form:input path="description"/>
                    <form:errors path="description" cssClass="errorMessage"/><br/>
                </div>
                <div class="mb-3">
                    <form:label path="price">Price:</form:label>
                    <form:input path="price"/>
                    <form:errors path="price" cssClass="errorMessage"/><br/>
                </div>
                <div class="mb-3">
                    <form:select path="category" items="${categories}" itemLabel="name" itemValue="id"/>
                    <form:errors path="category" cssClass="errorMessage"/>
                </div>


                <form:hidden path="id"/>

                <form:button class="btn btn-primary btn-lg btn-block" type="submit">Dodaj produkt</form:button>
            </form:form>


        </div>
        <!-- /.row -->

    </div>
    <!-- End of Main Content -->

    <jsp:include page="includes/footer.jsp"/>

</div>
<!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->
<jsp:include page="includes/js.jsp"/>
</body>

</html>
