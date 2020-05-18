<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Food App - aplikacja do zamawiania jedzenia</title>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/bootstrap/vendor/bootstrap/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/bootstrap/css/shop-homepage.css" />" rel="stylesheet">
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

</head>

<body>

<!-- Navigation -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="<c:url value="/" />"><img src="<c:url value="/resources/image/logo.png"/>" width="30" height="30"> FoodApp</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
                <a href="<c:url value="/cart" />" type="button" class="btn btn-secondary">
                    <img src="<c:url value="/resources/image/cart.jpg"/>" width="30" height="30"> Koszyk <span class="badge badge-light">${cart.size()}</span>
                </a>
            </ul>
        </div>
    </div>

</nav>
</body>
</html>