<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Add new category</title>
</head>
<body>
<form:form method="post" modelAttribute="category" action="/admin/category/add">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/>
    <form:errors path="name" cssClass="errorMessage"/><br/>

    <form:hidden path="id"/>

    <%--    <form:errors path="*" cssClass="errorMessage"/>--%>
    <input type="submit" value="Submit"/>
</form:form>
</body>
</html>
