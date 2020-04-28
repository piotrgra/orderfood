<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista kategorii:</title>
</head>
<body>
<a href="<c:url value="/admin/category/add"/>">Add new category</a>
<hr/>
<c:forEach items="${categories}" var="c">
    <p>Name: ${c.name}</p>
    <a href="category/delete/${c.id}">Delete</a>
    <a href="category/update/${c.id}">Edit</a>
    <hr/>
</c:forEach>
</body>
</html>