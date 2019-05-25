<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking list</title>
</head>
<body>
<h1>Your booking list review </h1>
<table>
    <tr>
        <th>House's name</th>
        <th>Number of individuals</th>
        <th>Dates</th>
        <th>Status</th>
    </tr>

    <c:set var="housesName" value="${housesName}"></c:set>

    <c:forEach items="${reservations}" var="reservation" varStatus="status">
        <c:url var="AcceptBooking" value="/acceptBooking">
            <c:param name="id" value="${reservation.id}"></c:param>
        </c:url>
        <c:url var="RejectBooking" value="/rejectBooking">
            <c:param name="id" value="${reservation.id}"></c:param>
        </c:url>
        <c:url var="message" value="/messages">
            <c:param name="id" value="${reservation.renterId}"></c:param>
        </c:url>

        <tr>
            <td>${housesName[status.index]}</td>
            <td>${reservation.nbGuests}</td>
            <td>From ${reservation.dateStart} to ${reservation.dateEnd} </td>
            <td>${reservation.status}</td>
            <td>
                <springForm:form method="post" action="${AcceptBooking}">
                    <input type="submit" value="Accept booking">
                </springForm:form>
            </td>
            <td>
                <springForm:form method="post" action="${RejectBooking}">
                    <input type="submit" value="Reject booking">
                </springForm:form>
            </td>
            <td>
                <a href="${message}">Ask more information</a>
            </td>


        </tr>

    </c:forEach>


</table>
</body>
</html>