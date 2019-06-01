<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="/../../ressources/js/script.js"></script>

<h1 class="text-center pd-5">Add a house to book</h1>
<springForm:form method="post" modelAttribute="house" action="/addHouse" cssClass="text-center ml-5 p-3" >
    <table class="table table-hover ml-5">
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-home" aria-hidden="true"></i>
                &nbsp; Name</td>
            <td><springForm:input path="name" cssClass="form-control"  /></td>
            <td><springForm:errors path="name" cssClass="form-control" /></td>

        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-o" aria-hidden="true"></i>
                &nbsp; City</td>
            <td><springForm:input path="city" cssClass="form-control" class="ff_elem" name="ff_nm_from[]"  id="f_elem_city"/></td>
            <td><springForm:errors path="city" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp; Address</td>
            <td><springForm:input path="address" cssClass="form-control"/></td>
            <td><springForm:errors path="address" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-list" aria-hidden="true"></i>
                &nbsp; Description</td>
            <td><springForm:textarea path="description" cssClass="form-control"/></td>
            <td><springForm:errors path="description" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-television" aria-hidden="true"></i>
                &nbsp; Services</td>
            <td><springForm:textarea path="service" cssClass="form-control"/></td>
            <td><springForm:errors path="service" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-ban" aria-hidden="true"></i>
                &nbsp; Constraints Rules</td>
            <td><springForm:textarea path="constraintRule" cssClass="form-control" /></td>
            <td><springForm:errors path="constraintRule" cssClass="form-control" /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-book" aria-hidden="true"></i>
                &nbsp; Status</td>
            <td><springForm:select path="status" cssClass="custom-select">
                <springForm:option value="Booked" label="Booked"  />
                <springForm:option value="Non Booked" selected="true" label="Non Booked" />
            </springForm:select></td>
            <td><springForm:errors path="status"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold"> <i class="fa fa-calendar" aria-hidden="true"></i>
                &nbsp; Availability</td>
            <td class="font-weight-bold"> Start : <springForm:input path="dateStart" type="date" />
            <td><springForm:errors path="dateStart" cssClass="form-control"  /></td>
            <td class="font-weight-bold"> End : <springForm:input path="dateEnd" type="date"  />
            <td><springForm:errors path="dateEnd" cssClass="form-control" /></td>
            </td>
        </tr>
    </table>
    <input type="submit" value="Save House" class="btn btn-outline-info">
</springForm:form>

