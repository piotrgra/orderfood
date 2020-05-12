<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food APP</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>

<div id="container">
    <div id="contentCart">
        <div id="cart">
            <div class="titleText">Koszyk</div>

            <div class="cartWrapper">
                <c:if test="${not empty cart}">
                    <table id="cartItems">
                        <tr>
                            <th>Id:</th>
                            <th>Nazwa:</th>
                            <th>Opis:</th>
                            <th>Ilość:</th>
                            <th>Cena:</th>
                            <th>Usuń:</th>
                        </tr>
                        <c:forEach items="${cart}" var="c" varStatus="loop">
                            <tr>
                                <td class="cart-loop">${loop.count}.</td>
                                <td class="cart-name">${c.product.name}</td>
                                <td class="cart-description">${c.product.description}</td>
                                <td class="cart-quantity">${c.quantity} x</td>
                                <td class="cart-price">(${c.product.price}) ${c.product.price * c.quantity} zł</td>
                                <td><a href="/removeFromCart/${c.product.id}">X</a></td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="6">Suma: ${totalPrice} zł</td>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <a href="/order">Zamawiam</a>
                            </td>
                        </tr>
                    </table>
                </c:if>
            </div>
            <div class="titleText">Razem: ${totalPrice} zł</div>
            <div class="orderButton"><a href="/order">Zamawiam</a></div>
        </div>
    </div>
</div>
</body>
</html>