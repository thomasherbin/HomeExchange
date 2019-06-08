<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="text-center pt-2 pb-3">Change your password</h1>

<springForm:form method="POST" modelAttribute="user" action="/updatePassword" cssClass="text-center ml-5 p-3">
    <table class="table table-hover ml-5">
        <tr>
            <td class="font-weight-bold">Current Password:</td>
            <td><springForm:input type="password" class="form-control" path="oldPassword"/></td>
            <td><springForm:errors path="oldPassword"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Password:</td>
            <td><springForm:input type="password" class="form-control" path="password"/></td>
            <td><springForm:errors path="password"  /></td>
        </tr>
        <tr>
            <td class="font-weight-bold">Confirm your password:</td>
            <td><springForm:input type="password" class="form-control" path="passwordConfirm" /></td>
            <td><springForm:errors path="passwordConfirm"  /></td>
        </tr>
        <tr>
            <td><input class="btn btn-outline-info" type="submit" value="Save Password"></td>
            <td><a class="btn btn-outline-info" href="/updateUser">Cancel</a></td>
        </tr>
    </table>

</springForm:form>
