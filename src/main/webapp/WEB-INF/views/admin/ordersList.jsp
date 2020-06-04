<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="en">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<jsp:include page="includes/header.jsp"/>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">
    <jsp:include page="includes/navbars.jsp"/>

    <div class="container-fluid">
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h5 class="m-0 font-weight-bold text-primary">Zamówienia</h5>
            </div>
            <div class="card-body">
                <div class="col-lg-12 text-center">
                    <%--<form:form action="/admin/orders" method="post" modelAttribute="status">
                        <form:select path="id">
                            <c:forEach items="${allStatus}" var="s">
                                <form:option value="${s.id}" label="${s.name}"/>
                            </c:forEach>
                        </form:select>
                        <form:button class="btn btn-primary btn-sm" type="submit">Szukaj</form:button>
                    </form:form>--%>

                    <form action="/admin/orders" method="get">


                        <label for="search">Szukana fraza:</label>
                        <input type="text" name="search" id="search"/>

                        <label for="status">Status</label>
                        <select name="status" id="status">
                            <option value=""></option>
                            <c:forEach items="${allStatus}" var="s">
                                <option value="${s.id}">${s.name}</option>
                            </c:forEach>
                        </select>

                        <label for="delivery">Dostawa</label>
                        <select name="delivery" id="delivery">
                            <option value=""></option>
                            <c:forEach items="${deliveryMethods}" var="d">
                                <option value="${d}">${d}</option>
                            </c:forEach>
                        </select>

                        <label for="paymentMethod">Metoda platnosci</label>
                        <select name="paymentMethod" id="paymentMethod">
                            <option value=""></option>
                            <c:forEach items="${paymentMethods}" var="s">
                                <option value="${s}">${s}</option>
                            </c:forEach>
                        </select>

                        <label for="paymentState">Status płatności</label>
                        <select name="paymentState" id="paymentState">
                            <option value=""></option>
                            <c:forEach items="${paymentState}" var="s">
                                <option value="${s}">${s}</option>
                            </c:forEach>
                        </select>


                        <input class="btn btn-primary btn-sm" type="submit" value="Szukaj"/>
                    </form>
                    <table class="table">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Status</th>
                            <th scope="col">Klient</th>
                            <th scope="col">Dostawa</th>
                            <th scope="col">Rodzaj płatności</th>
                            <th scope="col">Status płatności</th>
                            <th scope="col">Wartość</th>
                            <th scope="col">Data</th>
                            <th scope="col">Akcja</th>
                        </tr>
                        </thead>
                        <tbody id="myTable">
                        <c:forEach items="${orders}" var="o" varStatus="loop">
                            <tr>
                                <th scope="row"><a
                                        href="<c:url value="/admin/orderEdit?orderId=${o.id}"/>"># ${o.id}</a></th>
                                <td>${o.status.name}</td>
                                <td>${o.customer.firstName} ${o.customer.lastName}</td>
                                <td>${o.deliveryMethod.name()}</td>
                                <td>${o.paymentMethod.name()}</td>
                                <td>${o.paymentStatus}</td>
                                <td><fmt:formatNumber value="${o.totalPrice}" type="currency"/></td>
                                <td>
                                    <fmt:parseDate value="${ o.date }" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime"
                                                   type="both"/>
                                    <fmt:formatDate pattern="HH:mm dd.MM.yyyy " value="${ parsedDateTime }"/>

                                </td>
                                <td><a href="<c:url value="/admin/orderEdit?orderId=${o.id}"/>">Akcja</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>


    </div>
    <!-- /.row -->

</div>
<!-- End of Page Wrapper -->


<jsp:include page="includes/footer.jsp"/>


<jsp:include page="includes/js.jsp"/>
</body>

</html>
