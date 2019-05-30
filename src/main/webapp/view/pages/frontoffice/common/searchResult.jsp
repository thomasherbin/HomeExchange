<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<div>
    <h1 class="text-center pb-2">Your search Results </h1>
    <h3 class="pb-3">We found ${fn:length(houses)} result(s)</h3>
    <c:choose>
        <c:when test="${empty houses}">
        </c:when>
        <c:otherwise>
            <table class="table table-hover thead-dark">
                <thead class="thead-dark ">
                <th scope="col" class="text-center">Name</th>
                <th scope="col" class="text-center">Photo</th>
                <th scope="col" class="text-center">City</th>
                <th scope="col" class="text-center">Address</th>
                <th scope="col" class="text-center">Details</th>
                </thead>

                <c:forEach items="${houses}" var="house">
                    <c:url var="ShowHouse" value="/HouseDetails">
                        <c:param name="id" value="${house.id}"></c:param>
                    </c:url>
                    <tr>
                        <td class="text-center">${house.name}</td>
                        <td class="text-center"><img src="${house.photo}" class="img-fluid rounded w-50"></td>
                        <td class="text-center">${house.city}</td>
                        <td class="text-center">${house.address}</td>
                        <td class="text-center"><a href="${ShowHouse}">Show Details</a></td>
                    </tr>
                </c:forEach>
            </table>
        </c:otherwise>
    </c:choose>

</div>