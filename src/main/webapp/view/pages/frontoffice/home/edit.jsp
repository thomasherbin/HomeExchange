<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="html" uri="http://www.springframework.org/tags/form" %>

<c:url var="EditHouse" value="/editHouse">
    <c:param name="id" value="${house.id}" />
    <c:param name="owner" value="${house.owner}" />
</c:url>

<script type="text/javascript" src="/../../ressources/js/script.js"></script>
<link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/flick/jquery-ui.css" />

<body>
<h1 class="text-center pb-2">Edit a house</h1>
<springForm:form method="post" modelAttribute="house" action="${EditHouse}" cssClass="text-center ml-5 p-3">
    <table class="table table-hover ml-5 pl-5" >
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp; Name</td>
            <td><springForm:input path="name" value="${house.name}" cssClass="form-control"/></td>
            <td><springForm:errors path="name" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-o" aria-hidden="true"></i>
                &nbsp; City</td>
            <td><springForm:input path="city" value="${house.city}" cssClass="form-control" class="ff_elem bg-dark" name="ff_nm_from[]"  id="f_elem_city"/></td>
            <td><springForm:errors path="city" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp; Address</td>
            <td><springForm:input path="address" value="${house.address}" cssClass="form-control"/></td>
            <td><springForm:errors path="address" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-list" aria-hidden="true"></i>
                &nbsp; Description</td>
            <td><springForm:textarea path="description" value="${house.description}" cssClass="form-control" /></td>
            <td><springForm:errors path="description" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-television" aria-hidden="true"></i>
                &nbsp; Services</td>
            <td><springForm:textarea path="service" value="${house.service}" cssClass="form-control"/></td>
            <td><springForm:errors path="service" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-ban" aria-hidden="true"></i>
                &nbsp; Constraints</td>
            <td><springForm:textarea path="constraintRule" value="${house.constraintRule}" cssClass="form-control" /></td>
            <td><springForm:errors path="constraintRule" cssClass="form-control" /></td>
        </tr>
        <tr>

            <td class="font-weight-bold"> <i class="fa fa-book" aria-hidden="true"></i>
                &nbsp; Status</td>
            <c:set var="statusVar" value="${house.status}"></c:set>

            <td><springForm:select path="status" cssClass="custom-select">
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