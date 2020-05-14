<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="row">

        <div class="col-lg-12 text-center">
            <h1 class="mt-5">Lista przedmiotów:</h1>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nazwa</th>
                    <th scope="col">Opis</th>
                    <th scope="col">Cena</th>
                    <th scope="col">Kategoria</th>
                    <th scope="col">Usuń</th>
                    <th scope="col">Edytuj</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${items}" var="i" varStatus="loop">
                    <tr>
                        <th scope="row">${i.id}</th>
                        <td>${i.name}</td>
                        <td>${i.description}</td>
                        <td>${i.price}</td>
                        <td>${i.category.name}</td>
                        <td>
                            <a href="<c:url value="item/delete/${i.id}"/>" class="btn btn-danger btn-circle btn-sm">
                                <i class="fas fa-trash"></i>
                            </a></td>
                        <td><a href="<c:url value="item/update/${i.id}"/>" class="btn btn-warning btn-circle btn-sm">
                            <i class="fas fa-exclamation-triangle"></i>
                        </a></td>
                    </tr>
                </c:forEach>
                </tbody>

            </table>
        </div>

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
