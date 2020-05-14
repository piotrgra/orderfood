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
            <h1 class="mt-5">Zamówienia:</h1>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Status</th>
                    <th scope="col">Klient</th>
                    <th scope="col">Dostawa</th>
                    <th scope="col">Wartość</th>
                    <th scope="col">Data</th>
                    <th scope="col">Akcja</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="o" varStatus="loop">
                    <tr>
                        <th scope="row">${o.id}</th>
                        <td>${o.status}</td>
                        <td>${o.firstName} ${o.lastName}</td>
                        <td>${o.deliveryMethod}</td>
                        <td>${o.totalPrice}</td>
                        <td>${o.date}</td>
                        <td>Akcja</td>
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
