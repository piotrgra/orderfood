<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food APP</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css">
</head>
<body>
<div id="header">
    <div class="headerLogo">
        <a href="/"><img src="<c:url value="/resources/image/logo.png"/>" width="100" height="100"></a>
    </div>
    <div class="headerCart">
        <a href="/cart"><img src="<c:url value="/resources/image/cart.jpg"/>" width="30" height="30"> Koszyk:
            (${cart.size()})</a>
    </div>
</div>
</body>
</html>