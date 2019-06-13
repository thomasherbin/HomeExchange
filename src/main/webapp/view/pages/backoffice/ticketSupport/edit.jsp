<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="Confirmed" value="/editTicketConfirmed">
    <c:param name="id" value="${ticket.id}" />
</c:url>

<div class="container">
    <div class="container_small text-center">
        <h1>Close ticket ${ticket.id} ?</h1>
        <p>Are you sure you want to close the ticket ${ticket.id} ?</p>
        <div>
            <a class="btn btn-outline-info m-2" href="${Confirmed}">Yes</a>
            <a  class="btn btn-outline-info m-2" href="/ticketList">No</a>
        </div>
    </div>
</div>
