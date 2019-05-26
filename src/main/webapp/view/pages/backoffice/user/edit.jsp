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
            <td>Role:</td>
            <td>
                <springForm:select path="role">
                    <c:choose>
                        <c:when test="${userIsAdmin == true}">
                            <springForm:option value="User" label="User"  />
                            <springForm:option value="Admin" label="Admin" selected="true" />
                        </c:when>
                        <c:otherwise>
                            <springForm:option value="User" label="User" selected="true" />
                            <springForm:option value="Admin" label="Admin" />
                        </c:otherwise>
                    </c:choose>
                </springForm:select>
            </td>
            <td><springForm:errors path="role" /></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><springForm:input type="password" path="password" /></td>
            <td><springForm:errors path="password"  /></td>
        </tr>
        <tr>
            <td>Confirm your password:</td>
            <td><springForm:input type="password" path="passwordConfirm"/></td>
            <td><springForm:errors path="passwordConfirm"  /></td>
        </tr>
        <tr>
            <td><input type="submit" value="Save User"></td>
            <td><a href="/userList">Cancel</a></td>
        </tr>
    </table>

</springForm:form>
