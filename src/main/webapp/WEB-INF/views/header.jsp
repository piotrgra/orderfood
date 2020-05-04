<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet">
    <title>Order Food!</title>
</head>
<body>
<header>
    <table class="header">
        <tr>
            <td>
                <img src="<c:url value="/resources/image/logo.png"/>">
            </td>
            <td>
                <h1>The Food App ! :)</h1>
            </td>
            <td>
                <img src="<c:url value="/resources/image/cart.jpg"/>" width="30" height="30"> Koszyk: (0)
            </td>
        </tr>
    </table>
</header>
</body>
</html>