<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>

<body>
<!-- Page Content -->
<div class="my-4">
    <!-- zostawione aby była przerwa miedzy menu a produktami-->
</div>
<div class="container">

    <div class="row">
        <div class="col-lg-3">

            <div class="card shadow mb-4 text-center">
                <a href="<c:url value="/" />"><img src="<c:url value="/resources/image/logo.png" />" alt="Food App"
                                                   height="120" width="120"></a>
                <h3 class="my-4 text-primary">Food App</h3>
                <p class="text-secondary small"><i class="fa fa-address-card-o"></i> ul. Lamanska 1, 62-300 Krakow</p>
                <p class="text-secondary small"><i class="fa fa-phone"></i> 555 555 555</p>
                <p class="text-secondary small"> Otwarte: 20:00 - 10:00</p>
            </div>

            <div class="card shadow mb-4">
                <div class="list-group">
                    <c:forEach items="${categories}" var="c">
                        <c:if test="${c.items.size() != 0}">
                            <a href="<c:url value="/menu?categoryId=${c.id}" />" class="list-group-item">
                                    ${c.name} <small class="text-muted"> ${c.items.size()}</small>
                            </a>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-lg-9">

            <div class="row">
                <c:forEach items="${items}" var="i">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="<c:url value="/uploads/product-img/${i.image}" />"
                                 alt="">
                            <div class="card-body">
                                <h4 class="card-title">
                                    <p class="text-primary">${i.name}</p>
                                </h4>
                                <h5><fmt:formatNumber value="${i.price}" type="currency"/></h5>
                                <p class="card-text">${i.description}</p>
                            </div>
                            <div class="card-footer">
                                <a href="<c:url value="/addToCart?id=${i.id}&&quantity=1"/>">
                                    <button type="button" class="btn btn-success">Dodaj do koszyka</button>
                                </a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
