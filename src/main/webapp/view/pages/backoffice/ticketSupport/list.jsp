
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>tickets list</h2>

<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Tech Name</th>
        <th>User Message</th>
        <th>Tech Message </th>
        <th>Date</th>
        <th>Ticket Number</th>
    </tr>

    <c:forEach items="${ticket}" ver ="ticket">

        <c:url var="EditTicket" value="/editTicket">
            <c:param ticket="id" value="${ticket.id}" />
        </c:url>
    </c:forEach>
    <c:url var="DeleteTicket" value="/removeTicket">
         <c:param ticket="id" value="${ticket.id}" />
    </c:url>

    <tr>
        <td>${ticket.firstName}</td>
        <td>${ticket.lastName}</td>
        <td>${ticket.techName}</td>
        <td>${ticket.techMessage}</td>
        <td>${ticket.date}</td>
        <td>${ticket.ticketNumber}</td>
        <td><a href="${EditTicket}">Edit</a></td>
        <td><a href="${DeleteTicket}">Delete</a></td>

    </tr>

</table>
