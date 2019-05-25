<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<h1>Your houses</h1>
<c:choose>
    <c:when test="${empty houses}">
        <p>You have any houses !</p>
    </c:when>
    <c:otherwise>
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
                <th>Photo</th>
            </tr>
        <c:forEach items="${houses}" var="home">
            <c:url var="EditHouse" value="/editHouse">
                <c:param name="id" value="${home.id}" />
            </c:url>
            <c:url var="DeleteHouse" value="/removeHouse">
                <c:param name="id" value="${home.id}" />
            </c:url>
            <c:url var="UploadPhoto" value="/upload">
                <c:param name="id" value="${home.id}"/>
            </c:url>

            <tr>
                <td>${home.name}</td>
                <td>${home.city}</td>
                <td>${home.address}</td>
                <td>${home.status}</td>
                <td>${home.description}</td>
                <td>${home.service}</td>
                <td>${home.constraintRule}</td>
                <td><img src="${home.photo}"></td>
                <td>Available from ${home.dateStart} to ${home.dateEnd} </td>
                <td><a href="${EditHouse}">Edit</a></td>
                <td><a href="${DeleteHouse}">Remove</a></td>
                <td><a href="${UploadPhoto}">Upload photo</a></td>
            </tr>
        </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a href="/addHouse">Add house</a>
