
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="EditTicket" value="/editTicket">
    <c:param name="id" value="${ticket.id}" />
</c:url>

<springForm:form method="POST" modelAttribute="ticket" action="${EditTicket}">
    <table>
        <tr>
            <td>First Name: </td>
            <td><springForm:input path="firstName" value="${ticket.firstName}"/></td>
            <td><springForm:errors path="firstName"  /></td>
        </tr>
        <tr>
            <td>Last Name: </td>
            <td><springForm:input path="lastName" value="${ticket.lastName}"/></td>
            <td><springForm:errors path="lastName"  /></td>
        </tr>
        <tr>
            <td>User Message:</td>
            <td><springForm:input path="usermessage" value="${ticket.usermessage}"/></td>
            <td><springForm:errors path="usermessage"  /></td>
        </tr>
        <tr>
            <td>Date:</td>
            <td><springForm:input path="date" placeholder="MM/dd/yyyy" value="${ticket.date}"/></td>
            <td><springForm:errors path="date"  /></td>
        </tr>
        <tr>
            <td>Ticket Number:</td>
            <td><springForm:input path="ticketNumber" value="${ticket.ticketNumber}" /></td>
            <td><springForm:errors path="ticketNumber"  /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save ticket"></td>
            <td><a href="/ticketList">Cancel</a></td>
        </tr>
    </table>

</springForm:form>
