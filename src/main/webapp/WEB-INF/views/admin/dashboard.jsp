<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<jsp:include page="../header.jsp"/>

<body>
<div>
    <jsp:include page="menu-dashboard.jsp"/>
    <table id="items">
        <tr>
            <th>Id</th>
            <th>Nazwa</th>
            <th>Opis</th>
            <th>Cena</th>
            <th>Kategoria</th>
            <th>Usun</th>
            <th>Edytuj</th>
        </tr>
        <c:forEach items="${items}" var="i">
            <tr>
                <td>${i.id}</td>
                <td>${i.name}</td>
                <td>${i.description}</td>
                <td>${i.price}</td>
                <td>${i.category.name}</td>
                <td><a href="<c:url value="item/delete/${i.id}"/>">Delete</a></td>
                <td><a href="<c:url value="item/update/${i.id}"/>">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
