<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>

<body>
<!-- Page Content -->
<div class="container">

    <div class="row">
        <div class="col-lg-3">
            <a href="<c:url value="/" />"><img src="<c:url value="/resources/image/logo.png" />" alt="Food App"></a>
            <h1 class="my-4">Food App</h1>
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
        <div class="col-lg-9">

            <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">

                <!-- zostawione aby była przerwa miedzy menu a produktami-->
            </div>


            <div class="row">
                <c:forEach items="${items}" var="i">
                    <div class="col-lg-4 col-md-6 mb-4">
                        <div class="card h-100">
                            <img class="card-img-top"
                                 src="<c:url value="/resources/image/menu-img-01.jpg" />"
                                 alt="">
                            <div class="card-body">
                                <h4 class="card-title">
                                    <a href="#">${i.name}</a>
                                </h4>
                                <h5> <fmt:formatNumber value = "${i.price}" type = "currency"/></h5>
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
            <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

    </div>
    <!-- /.row -->

</div>
<!-- /.container -->

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
