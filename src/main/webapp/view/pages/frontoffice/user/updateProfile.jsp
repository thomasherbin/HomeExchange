<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<springForm:form method="POST" modelAttribute="user" action="/updateUser">
    <table>
        <tr>
            <td>First Name: </td>
            <td><springForm:input path="firstName" value="${user.firstName}"/></td>
            <td><springForm:errors path="firstName"  /></td>
        </tr>
        <tr>
            <td>Last Name: </td>
            <td><springForm:input path="lastName" value="${user.lastName}"/></td>
            <td><springForm:errors path="lastName"  /></td>
        </tr>
        <tr>
            <td>Username:</td>
            <td><springForm:input path="userName" value="${user.userName}"/></td>
            <td><springForm:errors path="userName"  /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><springForm:input path="email" value="${user.email}"/></td>
            <td><springForm:errors path="email"  /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save User"></td>
            <td><a href="/yourProfile">Cancel</a>
        </tr>
    </table>
</springForm:form>
