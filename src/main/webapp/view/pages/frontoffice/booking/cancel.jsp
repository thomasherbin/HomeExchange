<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="CancelBokingConfirmed" value="/CancelBookingConfirmed">
    <c:param name="id" value="${reservation.id}" />
</c:url>



<h1 class="text-info h2 mt-4 mb-2 text-center pb-3 font-weight-bold">Confirm to cancel reservation</h1>
<p class="text-secondary  mb-2 text-center">Are you sure you want to cancel this reservation ?</p>
<div class="text-center mt-4">
    <a class="btn btn-outline-info btn-xs" href="${CancelBokingConfirmed}">Yes</a>
    <a  class="btn btn-outline-info btn-xs" href="/index">No</a>
</div>
