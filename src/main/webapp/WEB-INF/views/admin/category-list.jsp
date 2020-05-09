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
            <th>Usun</th>
            <th>Edytuj</th>
        </tr>
        <c:forEach items="${categories}" var="c">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td><a href="<c:url value="delete/${c.id}"/>">Delete</a></td>
                <td><a href="<c:url value="update/${c.id}"/>">Edit</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
