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
                <div class="col-lg-12 text-center">
                    <c:if test="${shop != null }">
                        <a href="<c:url value="shopsetting/update/${shop.id}"/>"
                           class="btn btn-warning btn-icon-split btn-sm">
                            <span class="icon text-white-50">
                            <i class="fas fa-exclamation-triangle"></i>
                            </span>
                            <span class="text">Edytuj dane sklepu</span>
                        </a>

                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">Nazwa</th>
                                <th scope="col">Adres</th>
                                <th scope="col">Numer telefonu</th>
                                <th scope="col">Godziny otwarcia</th>
                                <th scope="col">Logo</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>${shop.name}</td>
                                <td>${shop.address}</td>
                                <td>${shop.phone}</td>
                                <td>Od ${shop.open} do ${shop.close}</td>
                                <td>${shop.logo}</td>
                            </tr>
                            </tbody>
                        </table>
                    </c:if>
                    <c:if test="${shop == null}">
                        <H2>Nie dodales jeszcze danych sklepu! Zrob to jak najszybciej zeby zarabiac $$$$</H2>


                        <a href="<c:url value="/admin/shopsetting/add"/>" class="btn btn-primary btn-icon-split btn-sm">
                             <span class="icon text-white-50">
                            <i class="fas fa-flag"></i>
                            </span>
                            <span class="text">Dodaj nowy przedmiot</span>
                        </a>

                    </c:if>
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
