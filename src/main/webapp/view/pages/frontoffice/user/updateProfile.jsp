<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <h1 class="text-center pb-2 pt-2">Edit your profile</h1>

<springForm:form method="POST" modelAttribute="user" action="/updateUser" cssClass="text-center ml-5 p-3">
    <table class="table table-hover ml-5">
        <tr>
            <td class="font-weight-bold">First Name: </td>
            <td><springForm:input path="firstName" class="form-control"  value="${user.firstName}"/></td>
            <td><springForm:errors path="firstName"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Last Name: </td>
            <td><springForm:input path="lastName" class="form-control"  value="${user.lastName}"/></td>
            <td><springForm:errors path="lastName"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Username:</td>
            <td><springForm:input path="userName" class="form-control"  value="${user.userName}"/></td>
            <td><springForm:errors path="userName"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Email:</td>
            <td><springForm:input path="email" class="form-control"  value="${user.email}"/></td>
            <td><springForm:errors path="email"  /></td>
        </tr>
        <tr>
            <td><button class="btn btn-outline-info" type="submit"/>Update User </td>
            <td>&nbsp;&nbsp; <a class="btn btn-outline-info" href="/yourProfile">Cancel</a>
        </tr>
    </table>
</springForm:form>
</div>