<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="EditUser" value="/editUser">
    <c:param name="id" value="${user.id}" />
</c:url>


<springForm:form method="POST" modelAttribute="user" action="${EditUser}">
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
            <td>Email:</td>
            <td><springForm:input path="email" value="${user.email}"/></td>
            <td><springForm:errors path="email"  /></td>
        </tr>
        <tr>
            <td>Age:</td>
            <td><springForm:input path="age" value="${user.age}"/></td>
            <td><springForm:errors path="age"  /></td>
        </tr>
        <tr>
            <td>Birthday:</td>
            <td><springForm:input path="birthday" placeholder="MM/dd/yyyy" value="${user.birthday}"/></td>
            <td><springForm:errors path="birthday"  /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save User"></td>
            <td><a href="/userList">Cancel</a></td>
        </tr>
    </table>

</springForm:form>
