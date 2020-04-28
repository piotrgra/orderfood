<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add new product</title>
</head>
<body>
<form:form method="post" modelAttribute="item" action="/admin/item/add">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/>
    <form:errors path="name" cssClass="errorMessage"/><br/>

    <form:label path="description">Description:</form:label>
    <form:input path="description"/>
    <form:errors path="description" cssClass="errorMessage"/><br/>

    <form:label path="price">Price:</form:label>
    <form:input path="price"/>
    <form:errors path="price" cssClass="errorMessage"/><br/>

    <form:label path="image">Image:</form:label>
    <form:textarea path="image"/>
    <form:errors path="image" cssClass="errorMessage"/><br/>

    <form:select path="category" items="${categories}" itemLabel="name" itemValue="id"/>
    <form:errors path="category" cssClass="errorMessage"/>

    <form:hidden path="id"/>

    <%--    <form:errors path="*" cssClass="errorMessage"/>--%>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
