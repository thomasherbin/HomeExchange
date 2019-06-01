<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="RemovePhotoConfirmed" value="/RemovePhotoConfirmed">
    <c:param name="photoPath" value="${house.photo}" />
    <c:param name="id" value="${house.id}"/>
</c:url>

<c:url var="RemovePhoto2Confirmed" value="/RemovePhoto2Confirmed">
    <c:param name="photo2Path" value="${house.photo2}" />
    <c:param name="id" value="${house.id}"/>
</c:url>

<c:url var="RemovePhoto3Confirmed" value="/RemovePhoto3Confirmed">
    <c:param name="photo3Path" value="${house.photo3}" />
    <c:param name="id" value="${house.id}"/>
</c:url>

<h1 class="text-center pb-3">Here are your photos for ${house.name}</h1>
<c:choose>
    <c:when test="${empty house.photo && empty house.photo2 && empty house.photo3}">
        <h2>You have no photo ! Please add at least one photo to describe your housing.</h2>
    </c:when>
    <c:otherwise>
        <table class="text-center">
            <tr>
                <td><img src="${house.photo}" class="img-fluid rounded w-50"></td>
                <c:choose>
                    <c:when test="${empty house.photo}"></c:when>
                    <c:otherwise>
                        <td><a href="${RemovePhotoConfirmed}" class="btn btn-outline-info">Delete</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td><img src="${house.photo2}" class="img-fluid rounded w-50"></td>
                <c:choose>
                    <c:when test="${empty house.photo2}"></c:when>
                    <c:otherwise>
                        <td><a href="${RemovePhoto2Confirmed}" class="btn btn-outline-info">Delete</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
            <tr>
                <td><img src="${house.photo3}" class="img-fluid rounded w-50"></td>
                <c:choose>
                    <c:when test="${empty house.photo3}" ></c:when>
                    <c:otherwise>
                        <td><a href="${RemovePhoto3Confirmed}" class="btn btn-outline-info">Delete</a></td>
                    </c:otherwise>
                </c:choose>
            </tr>
        </table>
    </c:otherwise>
</c:choose>
