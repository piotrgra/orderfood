<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>

<body>


<!-- Page Content -->
<div class="container">

    <div class="py-5 text-center">
        <img class="d-block mx-auto mb-4" src="<c:url value="/resources/image/logo.png"/>" alt="" width="72"
             height="72">
        <h2>Składanie zamówienia</h2>
        <p class="lead">Proszę o podanie wszystkich ponizszych danych</p>
    </div>

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-muted">Twoj koszyk</span>
                <span class="badge badge-secondary badge-pill">${cart.size()}</span>
            </h4>
            <ul class="list-group mb-3">
                <c:forEach items="${cart}" var="c" varStatus="loop">
                    <li class="list-group-item d-flex justify-content-between lh-condensed">
                        <div>
                            <h6 class="my-0">${c.product.name}</h6>
                            <small class="text-muted">Ilość: ${c.quantity}</small>
                        </div>
                        <span class="text-muted"> <fmt:formatNumber value="${c.product.price * c.quantity}"
                                                                    type="currency"/></span>
                    </li>
                </c:forEach>
                <li class="list-group-item d-flex justify-content-between">
                    <span>Łącznie (PLN)</span>
                    <strong><fmt:formatNumber value="${totalPrice}" type="currency"/></strong>
                </li>
            </ul>

            <form class="card p-2">
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Promo code">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary">Redeem</button>
                    </div>
                </div>
            </form>
        </div>

        <div class="col-md-8 order-md-1">
            <h4 class="mb-3">Adres dostawy</h4>
            <form:form class="needs-validation" action="/checkout" modelAttribute="order">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <form:label path="firstName">Imię</form:label>
                        <form:input path="firstName" class="form-control"/>

                    </div>
                    <div class="col-md-6 mb-3">
                        <form:label path="lastName">Nazwisko</form:label>
                        <form:input path="lastName" class="form-control"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">

                        <form:label path="email">Email</form:label>
                        <form:input path="email" class="form-control"/>
                    </div>

                    <div class="col-md-6 mb-3">
                        <form:label path="phone">Telefon</form:label>
                        <form:input path="phone" class="form-control"/>
                    </div>

                </div>

                <div class="mb-3">
                    <form:label path="address">Adres</form:label>
                    <form:input path="address" class="form-control"/>
                </div>

                <div class="row">
                    <div class="col-md-3 mb-3">
                        <form:label path="zip">Kod pocztowy</form:label>
                        <form:input path="zip" class="form-control"/>
                    </div>
                    <div class="col-md-3 mb-3">
                        <form:label path="city">Miasto</form:label>
                        <form:input path="city" class="form-control"/>
                    </div>

                </div>

                <hr class="mb-4">
                <h4 class="mb-3">Sposób dostawy:</h4>
                <div class="d-block my-3">
                    <c:forEach items="${deliveryMethods}" var="d">
                        <div class="custom-control custom-radio">
                            <form:radiobutton id="delivery_${d.id}" value="${d}" path="deliveryMethod"
                                              class="custom-control-input"/>
                            <form:label for="delivery_${d.id}" path="deliveryMethod"
                                        class="custom-control-label">${d.name}</form:label>
                        </div>
                    </c:forEach>
                </div>
                <hr class="mb-4">

                <h4 class="mb-3">Metoda płatności</h4>
                <div class="d-block my-3">
                    <c:forEach items="${paymentMethods}" var="p">
                        <div class="custom-control custom-radio">
                            <form:radiobutton id="payment_${p.id}" value="${p}" path="paymentMethod"
                                              class="custom-control-input"/>
                            <form:label for="payment_${p.id}" path="paymentMethod"
                                        class="custom-control-label">${p.name}</form:label>
                        </div>
                    </c:forEach>
                </div>
                <hr class="mb-4">
                <form:button class="btn btn-primary btn-lg btn-block" type="submit">Zamawiam</form:button>
            </form:form>
        </div>
    </div>

    <footer class="my-5 pt-5 text-muted text-center text-small">
    </footer>

</div>
<!-- /.container -->

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
