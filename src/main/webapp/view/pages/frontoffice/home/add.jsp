<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-center pd-5">Add a house to book</h1>
<springForm:form method="post" modelAttribute="house" action="/addHouse" cssClass="text-center ml-5 p-3" >
    <table class="table table-hover ml-5">
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp; Name</td>
            <td><springForm:input path="name" /></td>
            <td><springForm:errors path="name"  /></td>

        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-o" aria-hidden="true"></i>
                &nbsp; City</td>
            <td><springForm:input path="city" /></td>
            <td><springForm:errors path="city"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp; Address</td>
            <td><springForm:input path="address"/></td>
            <td><springForm:errors path="address"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-list" aria-hidden="true"></i>
                &nbsp; Description</td>
            <td><springForm:textarea path="description"/></td>
            <td><springForm:errors path="description"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-television" aria-hidden="true"></i>
                &nbsp; Services</td>
            <td><springForm:textarea path="service"/></td>
            <td><springForm:errors path="service"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-ban" aria-hidden="true"></i>
                &nbsp; Constraints Rules</td>
            <td><springForm:textarea path="constraintRule" /></td>
            <td><springForm:errors path="constraintRule"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-book" aria-hidden="true"></i>
                &nbsp; Status</td>
            <td><springForm:select path="status">
                <springForm:option value="Booked" label="Booked"  />
                <springForm:option value="Non Booked" selected="true" label="Non Booked" />
            </springForm:select></td>
            <td><springForm:errors path="status"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-calendar" aria-hidden="true"></i>
                &nbsp; Availability</td>
            <td class="font-weight-bold"> Start : <springForm:input path="dateStart" type="date" />
            <td><springForm:errors path="dateStart"  /></td>
            <td class="font-weight-bold"> End : <springForm:input path="dateEnd" type="date" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
    </table>
    <input type="submit" value="Save House" class="btn btn-outline-info">
</springForm:form>

