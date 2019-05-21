<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your bookings</title>
</head>
<body>
<h1>Your bookings review </h1>
<table>
    <tr>
        <th>House's name</th>
        <th>Number of individuals</th>
        <th>Dates</th>
        <th>Status</th>
    </tr>

    <c:forEach items="${reservations}" var="reservation">
        <c:url var="CancelBooking" value="/cancelBooking">
            <c:param name="id" value="${reservation.id}"></c:param>
        </c:url>

        <tr>
            <td>${reservation.id}</td>
            <td>${reservation.nbGuests}</td>
            <td>From ${reservation.dateStart} to ${reservation.dateEnd} </td>
            <td>${reservation.status}</td>
            <td><a href="${CancelBooking}">Cancel</a></td>
        </tr>

    </c:forEach>


</table>
</body>
</html>