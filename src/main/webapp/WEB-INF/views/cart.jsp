<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"/>

<body>
<div>
    <table id="cart">
        <tr>
            <th colspan="5">Koszyk:</th>
        </tr>
        <c:if test="${empty cart}">
            <tr>
                <td>Czemu masz pusty koszyk ?! :( Zamów coś i daj zarobić! :)</td>
            </tr>
        </c:if>
        <c:forEach items="${cart}" var="c" varStatus="loop">
            <tr>
                <td class="cart-loop">${loop.count}. </td>
                <td class="cart-name">${c.product.name}</td>
                <td class="cart-description">${c.product.description}</td>
                <td class="cart-quantity">${c.quantity}</td>
                <td class="cart-price">${c.product.price} zł</td>
                <td><a href="/removeFromCart/${c.product.id}">X</a></td>
            </tr>
        </c:forEach>
        <tr>
            <td>Suma: ${totalPrice} zł</td>
        </tr>
        <tr>
            <td>
                Zamawiam
            </td>
        </tr>
    </table>
</div>
</body>
</html>
