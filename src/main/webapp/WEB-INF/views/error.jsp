<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="includes/header.jsp"/>
<body>
<div class="my-4">
    <!-- zostawione aby była przerwa miedzy menu a produktami-->
</div>
<div class="container">
    <div class="text-center" style="padding-top: 20px">
        <div class="error mx-auto" data-text="404">404</div>
        <p class="lead text-gray-800 mb-5">Strona nie została znaleziona</p>
        <p class="text-gray-500 mb-0">Wyglada na to ze znalazles bląd...</p>
        <a href="<c:url value="/"/>">&larr; Wróc do strony głównej</a>
    </div>
</div>

<jsp:include page="includes/footer.jsp"/>

</body>

</html>
