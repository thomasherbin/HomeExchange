<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<h1 class="h2 mt-4 mb-2 text-center">Your bookings review </h1>
<c:choose>
    <c:when test="${empty housesName}">
        <p  class="text-secondary  mb-2">You have no reservation !</p>
    </c:when>
    <c:otherwise>
        <table  class="mt-4 table table-hover thead-dark"  style="width:100%">
            <tr class="thead-dark " style="width:100%">
                <th style="width:15%"  class="text-center" scope="col"><i class="fa fa-home" aria-hidden="true"></i> Name</th>
                <th  style="width:10%"  class="text-center" scope="col"><i class="fa fa-user" aria-hidden="true"></i> Individuals</th>
                <th style="width:30%" class="text-center"  scope="col"><i class="fa fa-calendar" aria-hidden="true"></i> Dates</th>
                <th style="width:10%" class="text-center" class="col-xs-1" scope="col"><i class="fa fa-book" aria-hidden="true"></i> Status</th>
                <th class="text-center" scope="col"><i class="fa fa-times" aria-hidden="true"></i> Cancel reservation</th>
                <th class="text-center" scope="col"><i class="fa fa-envelope" aria-hidden="true"></i>
                    Contact the owner</th>
            </tr>

            <c:set var="housesName" value="${housesName}"></c:set>


            <c:forEach items="${reservations}" var="reservation" varStatus="statusVar">
                <c:url  var="CancelBooking" value="/cancelBooking">
                    <c:param name="id"  value="${reservation.id}"></c:param>
                </c:url>
                <c:url var="message" value="/messages">
                    <c:param name="id" value="${reservation.ownerId}"></c:param>
                </c:url>



                <tr class="text-dark">
                    <td class="text-center"> ${housesName[statusVar.index]}</td>
                    <td class="text-center">${reservation.nbGuests}</td>
                    <td class="text-center">From ${reservation.dateStart} to ${reservation.dateEnd} </td>
                    <td class="text-center">${reservation.status}</td>
                    <td class="text-center "><a class="btn btn-outline-info" href="${CancelBooking}">Cancel</a></td>
                    <td class="text-center"><a class="btn btn-outline-info" href="${message}">Message</a></td>
                </tr>

            </c:forEach>


        </table>
    </c:otherwise>
</c:choose>
