<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>

<body>
<div class="my-4">
    <!-- zostawione aby była przerwa miedzy menu a produktami-->
</div>
<div class="container">
    <div class="container-fluid">
        <div class="card shadow mb-4">
        <c:if test="${empty cart}">
            <h2 class="mt-5 text-center">Koszyk jest pusty</h2>
            <p class="text-secondary big text-center">Może coś kupisz? <i class="fa fa-smile-o"></i></p>
        </c:if>
            <c:if test="${not empty cart}">
            <h1 class="mt-5 text-center">Koszyk:</h1>

            <table class="table">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Nazwa</th>
                    <th scope="col">Ilość</th>
                    <th scope="col">Cena</th>
                    <th scope="col">Usuń</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${cart}" var="c" varStatus="loop">
                    <tr>
                        <th scope="row">${loop.count}</th>
                        <td>${c.product.name}</td>
                        <td>${c.quantity}</td>
                        <td><fmt:formatNumber value="${c.product.price * c.quantity}" type="currency"/></td>
                        <td>
                            <a href="<c:url value="/removeFromCart/${c.product.id}"/>" style="color: red;">
                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                            </a>
                        </td>
                    </tr>
                </c:forEach>


                <tr>
                    <td colspan="5" class="text-center text-primary">Suma: <fmt:formatNumber value="${totalPrice}" type="currency"/></td>
                </tr>

                </tbody>
                <tfoot>
                <tr>
                    <td colspan="5" class="text-center">
                        <a href="<c:url value="/order"/>" class="btn btn-success">Zamawiam </a>
                    </td>
                </tr>
                </tfoot>
            </table>
            </c:if>
        </div>
    </div>
</div>
<!-- /.container -->

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
