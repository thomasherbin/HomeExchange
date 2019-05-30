<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<h1 class="text-center pd-5">Add a house to book</h1>
<springForm:form method="post" modelAttribute="house" action="/addHouse" >
    <table class="table table-hover table-borderless ">
        <tr>
            <td class="font-weight-bold">Name:</td>
            <td><springForm:input path="name" /></td>
            <td><springForm:errors path="name"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">City:</td>
            <td><springForm:input path="city" /></td>
            <td><springForm:errors path="city"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Address:</td>
            <td><springForm:input path="address"/></td>
            <td><springForm:errors path="address"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Description:</td>
            <td><springForm:textarea path="description"/></td>
            <td><springForm:errors path="description"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Services:</td>
            <td><springForm:textarea path="service"/></td>
            <td><springForm:errors path="service"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Constraints:</td>
            <td><springForm:textarea path="constraintRule" /></td>
            <td><springForm:errors path="constraintRule"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Status:</td>
            <td><springForm:select path="status">
                <springForm:option value="Booked" label="Booked"  />
                <springForm:option value="Non Booked" selected="true" label="Non Booked" />
            </springForm:select></td>
            <td><springForm:errors path="status"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Availability:</td>
            <td class="font-weight-bold"> Start : <springForm:input path="dateStart" type="date" />
            <td><springForm:errors path="dateStart"  /></td>
            <td class="font-weight-bold"> End : <springForm:input path="dateEnd" type="date" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
    </table>
    <input type="submit" value="Save House" class="btn btn-outline-info">
</springForm:form>

