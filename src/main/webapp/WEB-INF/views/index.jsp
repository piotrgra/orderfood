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
                <c:if test="${shop != null}">
                    <a href="<c:url value="/" />"><img src="<c:url value="${shop.logo}" />" alt="${shop.name}"></a>
                    <h3 class="my-4 text-primary">${shop.name}</h3>
                    <p class="text-secondary small"><i class="fa fa-address-card-o"></i> ${shop.address}</p>
                    <p class="text-secondary small"><i class="fa fa-phone"></i> ${shop.phone}</p>
                    <p class="text-secondary small"> Godziny otwarcia: ${shop.open} - ${shop.close}</p>
                </c:if>
                <c:if test="${shop == null}">
                    <h2 class="my-4 text-primary">Chyba pojawiles sie na stronie zbyt szybko. Wlasciciel jeszcze jej nie
                        przygotował :) Zajrzyj tu później</h2>
                </c:if>
            </div>

            <div class="card shadow mb-4">
                <div class="list-group">
                    <div class="list-group-item">
                        Menu:
                    </div>
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
                <c:if test="${empty items}">
                    <div class="container-fluid">
                        <div class="card shadow mb-4">
                            <h3 class="text-secondary text-center">Sprzedawca nie dodal jeszcze zadnego produktu.</h3>
                        </div>
                    </div>
                </c:if>

                <c:forEach items="${items}" var="i">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="<c:url value="${i.image}" />" alt="">
                            <div class="card-body">
                                <h4 class="card-title">
                                    <p class="text-primary">${i.name}</p>
                                </h4>
                                <h5><fmt:formatNumber value="${i.price}" type="currency"/></h5>
                                <p class="card-text"><small class="text-muted"> ${i.description}</small></p>
                            </div>
                            <div class="card-footer">
                                <a href="<c:url value="/addToCart?id=${i.id}&&quantity=1"/>">
                                    <button type="button" class="btn btn-success">Dodaj do koszyka</button>
                                </a>
                            </div>
                        </div>
                    </div>
                    <%--    2 formy wyswietlania przedmiotow
                                        <div class="card mb-3" style="max-width: 620px;">
                                            <div class="row no-gutters align-center">
                                                <div class="col-md-4">
                                                    <img src="<c:url value="${i.image}" />" class="card-img" alt="${i.name}">
                                                </div>
                                                <div class="col-md-8">
                                                    <div class="card-body">
                                                        <h5 class="card-title">${i.name}</h5>

                                                        <p class="card-text"><small class="text-muted"> ${i.description}</small></p>
                                                        <p class="card-text"><fmt:formatNumber value="${i.price}" type="currency"/></p>

                                                    </div>
                                                    <div class="card-footer">
                                                        <a href="<c:url value="/addToCart?id=${i.id}&&quantity=1"/>">
                                                            <button type="button" class="btn btn-success">Dodaj do koszyka</button>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>--%>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
