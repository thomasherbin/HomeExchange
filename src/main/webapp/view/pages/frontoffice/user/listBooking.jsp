<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<h1>Your booking list review </h1>
<c:choose>
    <c:when test="${empty reservations}">
        <p>You have no booking !</p>
    </c:when>
    <c:otherwise>
        <table class="table">
            <tr>
                <th scope="col">House's name</th>
                <th scope="col">Number of individuals</th>
                <th scope="col">Dates</th>
                <th scope="col">Status</th>
                <th scope="col">Accept booking</th>
                <th scope="col">Reject booking</th>
                <th scope="col">Ask for more information</th>
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
    </c:otherwise>
</c:choose>
