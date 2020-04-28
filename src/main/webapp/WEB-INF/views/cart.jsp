<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Order Food!</title>
    <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<h1>Zamow jedzonko!</h1><br/>
<h2>Menu:</h2>
<p> Świeze pyszne jedzonko prosze od najlepszych kucharzy na swiecie!</p>
<div>
    <table>
        <c:forEach items="${cart}" var="c">
            <tr>
                <th><img src="/resources/image/menu-img-01.jpg" alt="${c.product.name}" width="40%" height="35%"></th>
                <th>${c.product.name} <br/> ${c.product.name}</th>
                <th>${c.product.price}</th>
                <th>Ilość: ${c.quantity}</th>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
