<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-info h2 mt-4 mb-2">Your booking list review </h1>
<c:choose>
    <c:when test="${empty reservations}">
        <p class="text-secondary  mb-2">You have no booking !</p>
    </c:when>
    <c:otherwise>
        <table class="mt-4 table table-hover thead-dark" style="width:100%">
            <tr class="thead-dark " style="width:100%">
                <th style="width:15%"  class="text-center" scope="col"><i class="fa fa-home" aria-hidden="true"></i> Name</th>
                <th  style="width:10%"  class="text-center" scope="col"><i class="fa fa-user" aria-hidden="true"></i> Individuals</th>
                <th style="width:30%" class="text-center"  scope="col"><i class="fa fa-calendar" aria-hidden="true"></i> Dates</th>
                <th style="width:10%" class="text-center" class="col-xs-1" scope="col"><i class="fa fa-book" aria-hidden="true"></i> Status</th>
                <th style="width:10%" class="text-center" scope="col">Accept booking</th>
                <th style="width:10%" class="text-center" scope="col">Reject booking</th>
                <th style="width:25%" class="text-center" class="col-1" scope="col"><i class="fa fa-info-circle" aria-hidden="true"></i> Information</th>
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

                <tr class="text-dark">
                    <td class="text-center">${housesName[status.index]}</td>
                    <td class="text-center" >${reservation.nbGuests}</td>
                    <td class="text-center">From ${reservation.dateStart} to ${reservation.dateEnd} </td>
                    <td class="text-center">${reservation.status}</td>
                    <td class="text-center">
                        <springForm:form method="post" action="${AcceptBooking}">
                            <input type="submit" class="btn btn-outline-info"  value="Accept booking">
                        </springForm:form>
                    </td>
                    <td class="text-center">
                        <springForm:form method="post" action="${RejectBooking}">
                            <input type="submit" class="btn btn-outline-info"  value="Reject booking">
                        </springForm:form>
                    </td>
                    <td class="text-center">
                        <a class="text-dark" href="${message}">Click here !</a>
                    </td>


                </tr>

            </c:forEach>

        </table>
    </c:otherwise>
</c:choose>
