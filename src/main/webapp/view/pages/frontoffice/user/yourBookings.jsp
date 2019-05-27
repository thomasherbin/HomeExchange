<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your bookings</title>
</head>
<body>
<h1>Your bookings review </h1>
<c:choose>
    <c:when test="${empty housesName}">
        <p>You have no reservation !</p>
    </c:when>
    <c:otherwise>
        <table>
            <tr>
                <th>House's name</th>
                <th>Number of individuals</th>
                <th>Dates</th>
                <th>Status</th>
            </tr>

            <c:set var="housesName" value="${housesName}"></c:set>


            <c:forEach items="${reservations}" var="reservation" varStatus="statusVar">
                <c:url var="CancelBooking" value="/cancelBooking">
                    <c:param name="id" value="${reservation.id}"></c:param>
                </c:url>
                <c:url var="message" value="/messages">
                    <c:param name="id" value="${reservation.ownerId}"></c:param>
                </c:url>



                <tr>
                    <td> ${housesName[statusVar.index]}</td>
                    <td>${reservation.nbGuests}</td>
                    <td>From ${reservation.dateStart} to ${reservation.dateEnd} </td>
                    <td>${reservation.status}</td>
                    <td><a href="${CancelBooking}">Cancel</a></td>
                    <td><a href="${message}">Message</a></td>
                </tr>

            </c:forEach>


        </table>
    </c:otherwise>
</c:choose>

</body>
</html>