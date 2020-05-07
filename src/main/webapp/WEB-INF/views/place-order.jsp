<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<jsp:include page="header.jsp"/>

<body>
<div>
    <h1>Kasa:</h1>
<form:form method="post" action="/processOrder">
    <form:label path="firstName">First Name:</form:label>
    <form:input path="firstName"/>
    <form:errors path="firstName" cssClass="errorMessage"/>

    <form:label path="lastName">Last Name:</form:label>
    <form:input path="lastName"/>
    <form:errors path="lastName" cssClass="errorMessage"/>

    

</form:form>

</div>
</body>
</html>
