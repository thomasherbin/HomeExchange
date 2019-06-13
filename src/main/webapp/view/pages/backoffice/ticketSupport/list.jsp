<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">

    <h2>Ticket's List</h2>
    <table class="table text-center">
        <thead>
        <tr>
            <th scope="col">Date</th>
            <th scope="col">Email</th>
            <th scope="col">Description</th>
            <th scope="col">Status</th>
            <th scope="col">Action</th>
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
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

