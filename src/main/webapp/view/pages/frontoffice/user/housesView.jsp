<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<h1 class="text-center pb-2">Your houses</h1>
<c:choose>
    <c:when test="${empty houses}">
        <p>You have no house !</p>
    </c:when>
    <c:otherwise>
        <table class="table table-hover">
            <thead class="thead-dark">
            <tr>
                <th scope="col">Name</th>
                <th scope="col">City</th>
                <th scope="col">Adress</th>
                <th scope="col">Status</th>
                <th scope="col">Description</th>
                <th scope="col">Service</th>
                <th scope="col">Constraint Rules</th>
                <th scope="col">Availability</th>
                <th scope="col">Photos</th>
                <th scope="col">Edit House</th>
                <th scope="col">Remove House</th>
                <th scope="col">Upload Photo</th>
                <th scope="col">Delete Photo</th>
            </tr>
            </thead>

            <c:forEach items="${houses}" var="home">
                <c:url var="EditHouse" value="/editHouse">
                    <c:param name="id" value="${home.id}"/>
                </c:url>
                <c:url var="DeleteHouse" value="/removeHouse">
                    <c:param name="id" value="${home.id}"/>
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
                            <td><img src="${home.photo}" class="img-fluid rounded w-75"></td>
                            <td><img src="${home.photo2}" class="img-fluid rounded w-75"></td>
                            <td><img src="${home.photo3}" class="img-fluid rounded w-75"></td>
                        </c:otherwise>
                    </c:choose>
                    <td><a href="${EditHouse}">Edit</a></td>
                    <td><a href="${DeleteHouse}">Remove</a></td>
                    <td><a href="${UploadPhoto}">Upload photo</a></td>
                    <td><a href="${DeletePhoto}">Delete Photo</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:otherwise>
</c:choose>

<a href="/addHouse">Add house</a>
