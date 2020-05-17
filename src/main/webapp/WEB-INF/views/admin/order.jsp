<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<html lang="en">

<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="m-0 font-weight-bold text-primary">Zamówienie nr: ${order.id}</h5>
            </div>
            <br/>
            <br/>
            <div class="col-lg-12">
                <h5 class="font-weight-bold">Status zamówienia:</h5>
                <form:form method="post" modelAttribute="order" action="/admin/orderEdit?orderId=${order.id}">

                    <form:select path="status" items="${status}" itemLabel="name" itemValue="id"/>
                    <form:errors path="status" cssClass="errorMessage"/>

                    <form:errors path="status" cssClass="errorMessage"/>
                    <form:button class="btn btn-primary btn-sm" type="submit">Zapisz</form:button>
                </form:form>
            </div>

            <div class="col-lg-12 text-center">
                <h5 class="font-weight-bold">Zamówione produkty:</h5>
                <table class="table">
                    <tbody>
                    <c:forEach items="${order.orderItems}" var="i" varStatus="loop">
                        <tr>
                            <th scope="row">${i.quantity} x ${i.item.name}</th>
                            <td><fmt:formatNumber value="${i.item.price * i.quantity}" type="currency"/></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="2" class="text-right">Wartość zamówienia: <fmt:formatNumber
                                value="${order.totalPrice}"
                                type="currency"/></th>
                    </tr>
                    </tfoot>

                </table>
            </div>

            <div class="col-lg-12 text-left">
                <h5 class="font-weight-bold">Szczegóły zamówienia:</h5>
                <table class="table table-sm">
                    <tr>
                        <td>Imię i nazwisko: ${order.firstName} ${order.lastName}</td>
                    </tr>
                    <tr>
                        <td>Adres: ${order.address} ${order.zip} ${order.city}</td>
                    </tr>
                    <tr>
                        <td>Telefon: ${order.phone}</td>
                    </tr>
                    <tr>
                        <td>Email: ${order.email}</td>
                    </tr>
                    <tr>
                        <td>Rodzaj płatności: ${order.paymentMethod}</td>
                    </tr>
                    <tr>
                        <td>Metoda dostawy: ${order.deliveryMethod}</td>
                    </tr>
                    <tr>
                        <td>Data złożenia zamówienia: ${order.date}</td>
                    </tr>
                </table>
            </div>

        </div>
    </div>
</div>
<!-- End of Page Wrapper -->

<jsp:include page="includes/footer.jsp"/>


<jsp:include page="includes/js.jsp"/>
</body>

</html>
