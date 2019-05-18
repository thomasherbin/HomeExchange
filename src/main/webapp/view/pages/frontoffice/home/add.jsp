<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adding House Form</title>
</head>
<body>
<h1>Add a house to book</h1>
<springForm:form method="post" modelAttribute="house" action="/view/pages/frontoffice/home/add">
    <table>
        <tr>
            <td>Name:</td>
            <td><springForm:input path="name" /></td>
            <td><springForm:errors path="name"  /></td>
        </tr>
        <tr>
            <td>City:</td>
            <td><springForm:input path="city" /></td>
            <td><springForm:errors path="city"  /></td>
        </tr>
        <tr>
            <td>Address:</td>
            <td><springForm:input path="address" /></td>
            <td><springForm:errors path="address"  /></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td><springForm:input path="description" /></td>
            <td><springForm:errors path="description"  /></td>
        </tr>
        <tr>
            <td>Services:</td>
            <td><springForm:input path="service" /></td>
            <td><springForm:errors path="service"  /></td>
        </tr>
        <tr>
            <td>Constraints:</td>
            <td><springForm:input path="constraintRule" /></td>
            <td><springForm:errors path="constraintRule"  /></td>
        </tr>
        <tr>
            <td>Status:</td>
            <td><springForm:select path="status">
                <springForm:option value="Booked" label="Booked" />
                <springForm:option value="Non Booked" selected="true" label="Non booked" />
            </springForm:select></td>
            <td><springForm:errors path="status"  /></td>
        </tr>
        <tr>
            <td>Availability:</td>
            <td> Start : <springForm:input path="dateStart" type="date" />
            <td><springForm:errors path="dateStart"  /></td>
            <td> End : <springForm:input path="dateEnd" type="date" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>



        <tr>
            <td colspan="3"><input type="submit" value="Save House"></td>
        </tr>
    </table>
</springForm:form>
</body>
</html>