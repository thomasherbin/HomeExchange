<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div>
    <h1>Your search Results </h1>
    <h2>We found ${fn:length(houses)} result(s)</h2>
    <c:choose>
        <c:when test="${empty houses}">
        </c:when>
        <c:otherwise>
            <table class="table">
                <th scope="col">Name</th>
                <th scope="col">Photo</th>
                <th scope="col">City</th>
                <th scope="col">Address</th>
                <th scope="col">Details</th>
                <c:forEach items="${houses}" var="house">
                    <c:url var="ShowHouse" value="/HouseDetails">
                        <c:param name="id" value="${house.id}"></c:param>
                    </c:url>
                    <tr>
                        <td>${house.name}</td>
                        <td><img src="${house.photo}"></td>
                        <td>${house.city}</td>
                        <td>${house.address}</td>
                        <td><a href="${ShowHouse}">Show Details</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

</div>