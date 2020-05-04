<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="header.jsp"/>

<body>
<div>
    <table id="menu">
        <tr>
            <th>Menu:</th>
        </tr>
        <c:forEach items="${categories}" var="c">
            <tr>
                <td class="menu-item-list">- ${c.name} ( )</td>
            </tr>
        </c:forEach>
    </table>
    <table id="items">
        <tr>
            <th colspan="5">Potrawy:</th>
        </tr>
        <c:forEach items="${items}" var="i">
            <tr>
                <td class="item-img"><img src="/resources/image/menu-img-01.jpg" alt="${i.name}" width="200"
                                          height="150"></td>
                <td class="item-name">${i.name}</td>
                <td class="item-description">${i.description}</td>
                <td class="item-price">${i.price} zł</td>
                <td class="item-cart"><a href="addToCart/${i.id}/1"><img src="/resources/image/cart.jpg" width="30"
                                                                         height="30"></a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
