<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>




<h1>Your houses</h1>
<c:choose>
    <c:when test="${empty houses}">
        <p>You have no house !</p>
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
                <th>Photos</th>
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
            <c:url var="DeletePhoto" value="/deletePhoto">
                <c:param name="id" value="${home.id}"></c:param>
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
                <c:choose>
                    <c:when test="${empty home.photo && empty home.photo2 && empty home.photo3}">
                        <td>You have to download a photo to describe your house</td>
                    </c:when>
                    <c:otherwise>
                        <td><img src="${home.photo}"></td>
                        <td><img src="${home.photo2}"></td>
                        <td><img src="${home.photo3}"></td>
                    </c:otherwise>
                </c:choose>
                <td><a href="${EditHouse}">Edit</a></td>
                <td><a href="${DeleteHouse}">Remove</a></td>
                <td><a href="${UploadPhoto}">Upload photo</a></td>
                <td><a href ="${DeletePhoto}">Delete Photo</a></td>
            </tr>
        </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a href="/addHouse">Add house</a>
