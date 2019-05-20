<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>

<c:url var="EditHouse" value="/editHouse">
    <c:param name="id" value="${house.id}" />
    <c:param name="owner" value="${house.owner}" />
</c:url>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editing House Form</title>
</head>
<body>
<h1>Edit a house</h1>
<springForm:form method="post" modelAttribute="house" action="${EditHouse}">
    <table>
        <tr>
            <td>Name:</td>
            <td><springForm:input path="name" value="${house.name}" /></td>
            <td><springForm:errors path="name"  /></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><springForm:input path="city" value="${house.city}" /></td>
            <td><springForm:errors path="city"  /></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><springForm:input path="address" value="${house.address}" /></td>
            <td><springForm:errors path="address"  /></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><springForm:input path="description" value="${house.description}" /></td>
            <td><springForm:errors path="description"  /></td>
        </tr>
        <tr>
            <td>Services:</td>
            <td><springForm:input path="service" value="${house.service}" /></td>
            <td><springForm:errors path="service"  /></td>
        </tr>
        <tr>
            <td>Constraints:</td>
            <td><springForm:input path="constraintRule" value="${house.constraintRule}" /></td>
            <td><springForm:errors path="constraintRule"  /></td>
        </tr>
        <tr>

            <td>Status:</td>
            <c:set var="statusVar" value="${house.status}"></c:set>

            <td><springForm:select path="status">
                <c:choose>
                    <c:when test="${statusVar == 'Booked'}">
                        <springForm:option value="Booked" label="Booked" selected="true" />
                        <springForm:option value="Non Booked" label="Non booked"/>
                    </c:when>
                    <c:when test="${statusVar == 'Non Booked'}">
                        <springForm:option value="Booked" label="Booked" />
                        <springForm:option value="Non Booked" label="Non booked" selected="true"/>
                    </c:when>
                </c:choose>


            </springForm:select></td>
            <td><springForm:errors path="status"  /></td>
        </tr>
        <tr>
            <td>Availability:</td>
            <td> Start : <springForm:input path="dateStart" type="date" value="${house.dateStart}"/>
            <td><springForm:errors path="dateStart"  /></td>
            <td> End : <springForm:input path="dateEnd" type="date" value="${house.dateEnd}" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="Save"></td>
        </tr>
    </table>
</springForm:form>
</body>
</html>