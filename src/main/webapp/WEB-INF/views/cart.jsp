<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="header.jsp"/>

<body>

<!-- Page Content -->
<div class="container">

    <div class="row">

        <div class="col-lg-12 text-center">
            <h1 class="mt-5">Koszyk:</h1>

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
                        <td>${c.product.price * c.quantity}</td>
                        <td>
                            <a href="<c:url value="/removeFromCart/${c.product.id}" />">Usuń</a>
                        </td>
                    </tr>
                </c:forEach>


                <tr>
                    <td colspan="5">Suma: ${totalPrice}</td>
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
        </div>

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<jsp:include page="footer.jsp"/>

</body>

</html>
