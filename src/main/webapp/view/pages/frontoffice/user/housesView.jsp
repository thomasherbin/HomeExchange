<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<!DOCTYPE HTML>
<html>
<body>
<h1>Your houses</h1>
<table>
    <tr>
        <th>Name</th>
        <th>City</th>
        <th>Adress</th>
        <th>Status</th>
        <th>Description</th>
        <th>Service</th>
        <th>Constraint Rules</th>
        <th>Availability</th>
    </tr>
<c:forEach items="${houses}" var="home">
    <c:url var="EditHouse" value="/view/pages/frontoffice/home/edit">
        <c:param name="id" value="${home.id}" />
    </c:url>
    <c:url var="DeleteHouse" value="/view/pages/frontoffice/home/remove">
        <c:param name="id" value="${home.id}" />
    </c:url>

    <tr>
        <td>${home.name}</td>
        <td>${home.city}</td>
        <td>${home.address}</td>
        <td>${home.status}</td>
        <td>${home.description}</td>
        <td>${home.service}</td>
        <td>${home.constraintRule}</td>
        <td>Available from ${home.dateStart} to ${home.dateEnd} </td>
        <td><a href="${EditHouse}">Edit</a></td>
        <td><a href="${DeleteHouse}">Remove</a></td>
    </tr>
</c:forEach>
</table>
</body>
</html>