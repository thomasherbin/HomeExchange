<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div>
    <h1>Your search Results</h1>
    <table>
        <c:forEach items="${houses}" var="house">
            <c:url var="ShowHouse" value="/HouseDetails">
                <c:param name="id" value="${house.id}"></c:param>
            </c:url>
            <tr>
               <td>${house.name}</td>
                <td><a href="${ShowHouse}">Show Details</a></td>
            </tr>
        </c:forEach>
    </table>
</div>