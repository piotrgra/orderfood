<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="header.jsp"/>

<body>
<div>
    <h1>Zamowienie zlozone!</h1>
    <h2>Dziekujemy za zlozenie zamowienia twoj numer zamowienia to: ${order.id}</h2>
    <table>
        <tr>
            <th>Produkt:</th>
            <th>Ilość:</th>
            <th>Cena:</th>
        </tr>
        <c:forEach items="${order.orderItems}" var="c" varStatus="loop">
            <tr>
                <td>${loop.count}. ${c.item.name}</td>
                <td>${c.quantity} x</td>
                <td>${c.item.price * c.quantity} zł</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">Łącznie: ${order.totalPrice}</td>
        </tr>
    </table>
    <h1>Twoje zamowienie zostanie dostarczona za XXXX ;)</h1>

</div>
</body>
</html>
