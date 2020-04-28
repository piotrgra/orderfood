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
        <c:forEach items="${items}" var="i">
            <tr>
                <th><img src="/resources/image/menu-img-01.jpg" alt="${i.name}" width="40%" height="35%"></th>
                <th>${i.name} <br/> ${i.description}</th>
                <th>${i.price}</th>
                <th>Zamawiam:<a href="addToCart/${i.id}/1"><img src="/resources/image/cart.jpg" width="5%" height="5%"></a></th>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
