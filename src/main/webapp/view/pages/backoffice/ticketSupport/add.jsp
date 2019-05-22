<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<springForm:form method="POST" modelAttribute="ticket" action="/addTicket">
<table>
    
    <tr>
    <td>First Name</td>
        <td><springForm:input path="firstName" /></td>
        <td><springForm:errors path="firstName"  /></td>
    </tr>

    <tr>
        <td>Last Name:</td>
        <td><springForm:input path="lastName" /></td>
        <td><springForm:errors path="lastName"  /></td>
    </tr>

    <tr>
        <td>User Message</td>
        <td><springForm:input path="usermessage" /></td>
        <td><springForm:errors path="usermessage"  /></td
    </tr>

    <tr>
        <td>Last Name:</td>
        <td><springForm:input path="lastName" /></td>
        <td><springForm:errors path="lastName"  /></td>
    </tr>

    <tr>
        <td>Date</td>
        <td><springForm:input path="date" /></td>
        <td><springForm:errors path="date"  /></td
    </tr>

    <tr>
        <td>Ticket Number</td>
        <td><springForm:input path="ticketNumber" /></td>
        <td><springForm:errors path="ticketNumber"  /></td
    </tr>

    <tr>
        <td colspan="3"><input type="submit" value="Save Message"></td>
    </tr>
</table>


</springForm:form>
