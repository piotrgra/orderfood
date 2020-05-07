<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<div>
    <table id="menu">
        <tr>
            <th>Menu:</th>
        </tr>

        <tr>
            <td><a href="<c:url value="/admin/"/>">Lista potraw</a></td>
        </tr>

        <tr>
            <td><a href="<c:url value="/admin/category/"/>">Lista kategorii</a></td>
        </tr>

        <tr>
            <td><a href="<c:url value="/admin/item/add"/>">Dodaj potrawe</a></td>
        </tr>

        <tr>
            <td><a href="<c:url value="/admin/category/add"/>">Dodaj kategorie</a></td>
        </tr>
    </table>
</div>
</body>
</html>
