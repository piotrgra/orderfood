<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>
<body>
<!-- Page Content -->
<div class="container">

    <div class="row">


        <div class="col-lg-10 text-center">
            <h1 class="mt-5">Twoje zamowienie zostało przyjete!</h1>
            <h2>Numer zamowienia to: ${order.id}</h2>

            <h2 class="mt-5">Twoje zamowienie bedzie gotowe za XXX</h2>

            <table class="table text-center">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Produkt</th>
                    <th scope="col">Ilość</th>
                    <th scope="col">Cena</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order.orderItems}" var="c" varStatus="loop">
                    <tr>
                        <th scope="row">${loop.count}</th>
                        <td>${c.item.name}</td>
                        <td>${c.quantity}</td>
                        <td>${c.item.price * c.quantity}</td>
                    </tr>
                </c:forEach>


                <tr>
                    <td colspan="5">Suma: ${order.totalPrice}</td>
                </tr>

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5" class="text-center">
                        <a href="<c:url value="/"/>" class="btn btn-success">Wroc do strony glownej </a>
                    </td>
                </tr>
                </tfoot>
            </table>
        </div>

    </div>
    <!-- /.container -->
</div>
<jsp:include page="footer.jsp"/>

</body>

</html>
