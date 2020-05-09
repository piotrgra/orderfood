<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="header.jsp"/>

<body>
<div class="place-order">
    <h1>Kasa:</h1>
    <table class="center">
        <tr>
            <th>Produkt:</th>
            <th>Ilość:</th>
            <th>Cena:</th>
        </tr>
        <c:forEach items="${cart}" var="c" varStatus="loop">
            <tr>
                <td>${loop.count}. ${c.product.name}</td>
                <td>${c.quantity} x</td>
                <td>${c.product.price * c.quantity} zł</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">Suma: ${totalPrice}</td>
        </tr>
    </table>
    <hr>
    <h1>Dane dostawy:</h1>
    <form:form method="post" modelAttribute="order" action="/placeOrder">
        <form:label path="name">Name:</form:label>
        <form:input path="name"/>
        <form:errors path="name" cssClass="errorMessage"/><br/>


        <form:label path="address">Address:</form:label>
        <form:input path="address"/>
        <form:errors path="address" cssClass="errorMessage"/><br/>


        <form:label path="email">Email:</form:label>
        <form:input path="email"/>
        <form:errors path="email" cssClass="errorMessage"/><br/>


        <form:label path="phone">Phone number:</form:label>
        <form:input path="phone"/>
        <form:errors path="phone" cssClass="errorMessage"/><br/>

        <form:hidden path="id"/>

        <%--    <form:errors path="*" cssClass="errorMessage"/>--%>
        <input type="submit" value="Submit"/>
    </form:form>

</div>
</body>
</html>
