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
            <h1 class="mt-5">Lista kategorii:</h1>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nazwa</th>
                    <th scope="col">Usuń</th>
                    <th scope="col">Edytuj</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${categories}" var="c" varStatus="loop">
                    <tr>
                        <th scope="row">${c.id}</th>
                        <td>${c.name}</td>
                        <td>
                            <a href="<c:url value="category/delete/${c.id}"/>" class="btn btn-danger btn-circle btn-sm">
                                <i class="fas fa-trash"></i>
                            </a>
                        </td>
                        <td>
                            <a href="<c:url value="category/update/${c.id}"/>" class="btn btn-warning btn-circle btn-sm">
                                <i class="fas fa-exclamation-triangle"></i>
                            </a>
                        </td>
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
