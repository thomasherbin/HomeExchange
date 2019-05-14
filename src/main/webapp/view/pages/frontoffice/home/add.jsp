<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Adding House Form</title>
</head>
<body>
<h1>Add a house to book</h1>
<springForm:form method="post" modelAttribute="house" action="/addHouse">
    <table>
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
            <td colspan="3"><input type="submit" value="Save House"></td>
        </tr>
    </table>
</springForm:form>
</body>
</html>