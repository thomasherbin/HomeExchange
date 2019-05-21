<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="BookHouse" value="/BookHouse">
    <c:param name="id" value="${house.id}" />
</c:url>

<!DOCTYPE HTML>
<html>
<body>
<h1>${house.name}</h1>
<table>
    <tr>
        <td>Name:</td>
        <td>${house.name}</td>
    </tr>
    <tr>
        <td>City:</td>
        <td>${house.city}</td>
    </tr>
    <tr>
        <td>Adress:</td>
        <td>${house.address}</td>
    </tr>
    <tr>
        <td>Status:</td>
        <td>${house.status}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${house.description}</td>
    </tr>
    <tr>
        <td>Service</td>
        <td>${house.service}</td>
    </tr>
    <tr>
        <td>Constraint Rules</td>
        <td>${house.constraintRule}</td>
    </tr>
    <tr>
        <td>Availability</td>
        <td>Available from ${houe.dateStart} to ${houe.dateEnd} </td>
    </tr>
        <tr>
            <td><a href="${BookHouse}">Book</a></td>
        </tr>
</table>
</body>
</html>