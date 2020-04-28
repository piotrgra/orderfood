<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Lista produktów</title>
</head>
<body>
<a href="item/add">Add new item</a>
<hr/>
<c:forEach items="${items}" var="i">
    <p>Name: ${i.name}</p>
    <p>Description: ${i.description}</p>
    <p>Price: ${i.price}</p>
    <p>Image: <img src="/resources/image/menu-img-01.jpg" alt="${i.name}"></p>
    <p>Category: ${i.category.name}</p>
    <a href="item/delete/${i.id}">Delete</a>
    <a href="item/update/${i.id}">Edit</a>
    <hr/>
</c:forEach>
</body>
</html>