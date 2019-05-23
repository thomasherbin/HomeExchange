<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div>
    <h1>Your search Results </h1>
    <h2>We found ${fn:length(houses)} result(s)</h2>
    <table>
        <th>Name</th>
        <th>City</th>
        <th>Address</th>
        <th>Details</th>
        <c:forEach items="${houses}" var="house">
            <c:url var="ShowHouse" value="/HouseDetails">
                <c:param name="id" value="${house.id}"></c:param>
            </c:url>
            <tr>
               <td>${house.name}</td>
                <td>${house.city}</td>
                <td>${house.address}</td>
                <td><a href="${ShowHouse}">Show Details</a></td>
            </tr>
        </c:forEach>
    </table>
</div>