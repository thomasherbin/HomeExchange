<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<springForm:form method="POST" modelAttribute="user" action="/updatePassword">
    <table>
        <tr>
            <td>Current Password:</td>
            <td><springForm:input type="password" path="oldPassword"/></td>
            <td><springForm:errors path="oldPassword"  /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><springForm:input type="password" path="password"/></td>
            <td><springForm:errors path="password"  /></td>
        </tr>
        <tr>
            <td>Confirm your password:</td>
            <td><springForm:input type="password" path="passwordConfirm" /></td>
            <td><springForm:errors path="passwordConfirm"  /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save Password"></td>
            <td><a href="/updateUser">Cancel</a></td>
        </tr>
    </table>

</springForm:form>
