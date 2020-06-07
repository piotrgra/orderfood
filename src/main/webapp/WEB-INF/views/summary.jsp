<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>
<body>
<div class="my-4">
    <!-- zostawione aby była przerwa miedzy menu a produktami-->
</div>
<div class="container">
    <div class="container-fluid">
        <div class="col-lg-10 text-center">
            <div class="card shadow mb-4 text-center">
                <h1 class="mt-5">Twoje zamowienie zostało złożone!</h1>
                <h2>Numer zamowienia to: ${order.id}</h2>
                <c:if test="${order.paymentMethod.name() == 'DOTPAY'}">
                    <form action="https://ssl.dotpay.pl/test_payment/" method="get" target="_parent">


                        <input type="hidden" name="amount" value="${order.totalPrice}"/>
                        <input type="hidden" name="currency" value="PLN"/>

                        <input type="hidden" name="id" value="764501"/>
                        <input type="hidden" name="description" value="Zamówienie #${order.id}"/>

                        <input type="hidden" name="chk" value="${chk}"/>
                        <input type="hidden" name="url" value="http://foodappgra.herokuapp.com/thanks?id=${order.id}"/>
                        <input type="hidden" name="type" value="0"/>
                        <input type="hidden" name="buttontext" value="Wróć do sklepu"/>
                        <br>
                        <button class="btn btn-success btn-lg">Zapłać!</button>
                    </form>
                </c:if>
                <c:if test="${order.paymentMethod.name() == 'PRZY_ODBIORZE'}">
                    <h3 class="text-success">Zamówienie zostanie niebawem dostarczone!</h3>
                </c:if>
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
                            <td><fmt:formatNumber value="${c.item.price * c.quantity}" type="currency"/></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5">Suma: <fmt:formatNumber value="${order.totalPrice}" type="currency"/></td>
                    </tr>

                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="5" class="text-center">
                            <a href="<c:url value="/"/>">&larr; Wroc do strony glownej </a>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
<jsp:include page="includes/footer.jsp"/>

</body>

</html>
