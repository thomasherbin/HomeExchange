<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1>Your bookings review </h1>
<c:choose>
    <c:when test="${empty housesName}">
        <p>You have no reservation !</p>
    </c:when>
    <c:otherwise>
        <table class="table">
            <tr>
                <th scope="col">House's name</th>
                <th scope="col">Number of individuals</th>
                <th scope="col">Dates</th>
                <th scope="col">Status</th>
                <th scope="col">Cancel reservation</th>
                <th scope="col">Contact the owner</th>
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
