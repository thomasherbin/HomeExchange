<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="BookHouse" value="/bookHouse">
    <c:param name="id" value="${house.id}"/>
</c:url>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adding House Form</title>
</head>
<body>
<h1>Book a house</h1>
<springForm:form method="post" modelAttribute="reservation" action="${BookHouse}">
    <table>
        <tr>
            <td>Number of individuals:</td>
            <td><springForm:input type="number" min="1" max="1000" path="nbGuests" /></td>
            <td><springForm:errors path="nbGuests"  /></td>
        </tr>
        <tr>
            <td>Book From: <springForm:input path="dateStart" type="date" />
            <td><springForm:errors path="dateStart"  /></td>
            <td> To: <springForm:input path="dateEnd" type="date" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="Book House"></td>
        </tr>
    </table>
</springForm:form>
</body>