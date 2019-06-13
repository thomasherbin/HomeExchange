<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <h2 class="text-center mt-2 mb-3">Support Tickets List</h2>
    <table class="table text-center table-bordered">
        <thead>
        <tr>
            <th scope="col"> <i class="fa fa-calendar" aria-hidden="true"></i>
                Date</th>
            <th scope="col"><i class="fa fa-address-book" aria-hidden="true"></i>
                 Email</th>
            <th scope="col"><i class="fa fa-envelope" aria-hidden="true"></i>
                 Description</th>
            <th scope="col"><i class="fa fa-check-square-o" aria-hidden="true"></i>
                 Status</th>
            <th scope="col"><i class="fa fa-window-close" aria-hidden="true"></i>
                 Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  items="${tickets}" var ="ticket">

            <c:url var="closeTicket" value="/editTicket">
                <c:param name="id" value="${ticket.id}" />
            </c:url>



            <tr>
                <td>${ticket.sentDate}</td>
                <td>${ticket.senderEmail}</td>
                <td>${ticket.description}</td>
                <td>${ticket.status}</td>
                <c:if test="${ticket.status == 'OPEN'}">
                    <td><a class="btn btn-outline-danger" href="${closeTicket}">Close</a></td>
                </c:if>
                <c:if test="${ticket.status == 'CLOSED'}">
                    <td class="text-info font-weight-bold">Processed</td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

