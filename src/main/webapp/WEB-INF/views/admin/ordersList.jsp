<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="m-0 font-weight-bold text-primary">Zamówienia</h5>
            </div>
            <div class="card-body">
                <div class="col-lg-12 text-center">
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
                                <th scope="row"><a href="<c:url value="/admin/orderEdit?orderId=${o.id}"/>"># ${o.id}</a></th>
                                <td>${o.status.name}</td>
                                <td>${o.firstName} ${o.lastName}</td>
                                <td>${o.deliveryMethod}</td>
                                <td><fmt:formatNumber value = "${o.totalPrice}" type = "currency"/></td>
                                <td>${o.date}</td>
                                <td><a href="<c:url value="/admin/orderEdit?orderId=${o.id}"/>">Akcja</a></td>
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
