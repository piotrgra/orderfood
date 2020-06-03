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
                <h5 class="m-0 font-weight-bold text-primary">Ustawienia sklepu</h5>
            </div>
            <div class="card-body">
                <div class="col-lg-12 text-left">
                    <form:form method="post" modelAttribute="shop" action="/admin/shopsetting/add" enctype="multipart/form-data">
                        <div class="mb-3">
                            <form:label path="name">Nazwa:</form:label>
                            <form:input path="name"/>
                            <form:errors path="name" class="text-danger"/><br/>
                        </div>
                        <div class="mb-3">
                            <form:label path="address">Addres:</form:label>
                            <form:input path="address"/>
                            <form:errors path="address" class="text-danger"/><br/>
                        </div>

                        <div class="mb-3">
                            <form:label path="phone">Telefon:</form:label>
                            <form:input path="phone"/>
                            <form:errors path="phone" class="text-danger"/><br/>
                        </div>

                        <div class="mb-3">
                            <form:label path="open">Otwarcie od godziny:</form:label>
                            <form:input path="open"/>
                            <form:errors path="open" class="text-danger"/><br/>
                        </div>
                        <div class="mb-3">
                            <form:label path="close">Do godziny:</form:label>
                            <form:input path="close"/>
                            <form:errors path="close" class="text-danger"/><br/>
                        </div>
                        <div class="mb-3">
                            <form:label path="logo">Dodaj logo:</form:label>
                            <input type="file" name="file"/>
                        </div>
                        <form:hidden path="id"/>

                        <form:button class="btn btn-primary btn-lg"
                                     type="submit">Dodaj sklep</form:button>
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
