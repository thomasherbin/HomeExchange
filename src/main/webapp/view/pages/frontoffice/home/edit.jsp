<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>

<c:url var="EditHouse" value="/editHouse">
    <c:param name="id" value="${house.id}" />
    <c:param name="owner" value="${house.owner}" />
</c:url>

<body>
<h1 class="text-center pb-2">Edit a house</h1>
<springForm:form method="post" modelAttribute="house" action="${EditHouse}" cssClass="text-center ml-5 p-3">
    <table class="table table-hover ml-5 pl-5" >
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp; Name</td>
            <td><springForm:input path="name" value="${house.name}" /></td>
            <td><springForm:errors path="name"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-o" aria-hidden="true"></i>
                &nbsp; City</td>
            <td><springForm:input path="city" value="${house.city}" /></td>
            <td><springForm:errors path="city"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp; Address</td>
            <td><springForm:input path="address" value="${house.address}" /></td>
            <td><springForm:errors path="address"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-list" aria-hidden="true"></i>
                &nbsp; Description</td>
            <td><springForm:textarea path="description" value="${house.description}" /></td>
            <td><springForm:errors path="description"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-television" aria-hidden="true"></i>
                &nbsp; Services</td>
            <td><springForm:textarea path="service" value="${house.service}" /></td>
            <td><springForm:errors path="service"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-ban" aria-hidden="true"></i>
                &nbsp; Constraints</td>
            <td><springForm:textarea path="constraintRule" value="${house.constraintRule}" /></td>
            <td><springForm:errors path="constraintRule"  /></td>
        </tr>
        <tr>

            <td class="font-weight-bold"> <i class="fa fa-book" aria-hidden="true"></i>
                &nbsp; Status</td>
            <c:set var="statusVar" value="${house.status}"></c:set>

            <td><springForm:select path="status">
                <c:choose>
                    <c:when test="${statusVar == 'Booked'}">
                        <springForm:option value="Booked" label="Booked" selected="true" />
                        <springForm:option value="Non Booked" label="Non Booked"/>
                    </c:when>
                    <c:when test="${statusVar == 'Non Booked'}">
                        <springForm:option value="Booked" label="Booked" />
                        <springForm:option value="Non Booked" label="Non Booked" selected="true"/>
                    </c:when>
                </c:choose>


            </springForm:select></td>
            <td><springForm:errors path="status"/></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-calendar" aria-hidden="true"></i>
                &nbsp; Availability</td>
            <td class="font-weight-bold"> Start : <springForm:input path="dateStart" type="date" value="${house.dateStart}"/>
            <td><springForm:errors path="dateStart"  /></td>
            <td class="font-weight-bold"> End : <springForm:input path="dateEnd" type="date" value="${house.dateEnd}" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
    </table>
    <input type="submit" value="Save" class="btn btn-outline-info ml-1">
</springForm:form>
</body>