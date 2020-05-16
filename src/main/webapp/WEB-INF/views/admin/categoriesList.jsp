<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                <h5 class="m-0 font-weight-bold text-primary">Lista kategorii</h5>
                <a href="<c:url value="/admin/category/add"/>" class="btn btn-primary btn-icon-split btn-sm">
                    <span class="icon text-white-50">
                      <i class="fas fa-flag"></i>
                    </span>
                    <span class="text">Dodaj nowa kategorie</span>
                </a>

            </div>
            <div class="card-body">
                <div class="col-lg-12 text-center">
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
                                    <a href="<c:url value="category/delete/${c.id}"/>"
                                       class="btn btn-danger btn-circle btn-sm">
                                        <i class="fas fa-trash"></i>
                                    </a>
                                </td>
                                <td>
                                    <a href="<c:url value="category/update/${c.id}"/>"
                                       class="btn btn-warning btn-circle btn-sm">
                                        <i class="fas fa-exclamation-triangle"></i>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- End of Page Wrapper -->

<jsp:include page="includes/footer.jsp"/>


<jsp:include page="includes/js.jsp"/>
</body>

</html>
