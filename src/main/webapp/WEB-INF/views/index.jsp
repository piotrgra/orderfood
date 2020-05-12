<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Food APP</title>
    <link href="<c:url value="/resources/css/style.css" />" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="container">
    <div id="content">
        <div id="row">
            <div class="restaurantCart">
                <div id="restaurantInfo">
                    <img src="<c:url value="/resources/image/logo.png"/>" class="logo">
                    <h2><span class="title">App Food :)</span></h2>
                    <div class="restaurantContact">
                        <div id="phone">Tel: 504234234</div>
                        <div id="address">ul. Jankowska 54, 73-232 Poznan</div>
                    </div>
                    <div id="status">Otwarte</div>
                    <div id="hours">10:00 - 20:00</div>
                </div>
            </div>
            <div id="nav">
                <div class="titleText">Menu</div>

                <c:forEach items="${categories}" var="c">
                    <c:if test="${c.items.size() != 0}">
                        <a href="#">
                            <div class="menuCategory">

                                <span>${c.name} </span>
                                <span class="categoryCount">${c.items.size()}</span>

                            </div>
                        </a>
                    </c:if>
                </c:forEach>

            </div>
        </div>
        <div id="main">
            <div class="titleText">Polecamy</div>

            <c:forEach items="${items}" var="i">
                <div class="mealInfoWrapper">
                    <div class="mealItemImg"><img src="<c:url value="/resources/image/menu-img-01.jpg"/>"
                                                  alt="${i.name}"
                                                  width="100"
                                                  height="100"></div>
                    <div class="mealItemInfo">
                        <span class="mealTitle">${i.name}</span>
                        <span class="mealDescription">${i.description}</span>
                    </div>
                    <div class="mealItemPrice">${i.price} zł</div>
                    <div class="mealItemCart">
                        <a href="<c:url value="/addToCart/${i.id}/1"/>"><img
                                src="<c:url value="/resources/image/cart.jpg"/>" width="30"
                                height="30"></a>
                    </div>
                </div>
            </c:forEach>

        </div>
    </div>

</div>
</body>
</html>