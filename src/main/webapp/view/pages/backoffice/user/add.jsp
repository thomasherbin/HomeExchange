<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<springForm:form method="POST" modelAttribute="user" action="/addUser">
    <table>
        <tr>
            <td>First Name:</td>
            <td><springForm:input path="firstName" /></td>
            <td><springForm:errors path="firstName"  /></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><springForm:input path="lastName" /></td>
            <td><springForm:errors path="lastName"  /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><springForm:input path="email" /></td>
            <td><springForm:errors path="email"  /></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><springForm:input path="age" /></td>
            <td><springForm:errors path="age"  /></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><springForm:input path="birthday" placeholder="MM/dd/yyyy"/></td>
            <td><springForm:errors path="birthday"  /></td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" value="Save User"></td>
        </tr>
    </table>

</springForm:form>
