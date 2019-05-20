<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

Create an account</h1>
<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
    <h2 class="form-signin-heading">Create your account</h2>

    <table>
        <tr>
            <td>First Name:</td>
            <td><form:input path="firstName" /></td>
            <td><form:errors path="firstName"  /></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><form:input path="lastName" /></td>
            <td><form:errors path="lastName"  /></td>
        </tr>
        <tr>
            <spring:bind path="userName">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <td>Username:</td>
                    <td><form:input type="text" path="userName" class="form-control" autofocus="true"></form:input></td>
                    <td><form:errors path="userName"></form:errors></td>
                </div>
            </spring:bind>
        </tr><tr>
            <spring:bind path="email">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <td>Email:</td>
                    <td><form:input type="text" path="email" class="form-control" autofocus="true"></form:input></td>
                    <td><form:errors path="email"></form:errors></td>
                </div>
            </spring:bind>
        </tr>
        <tr>
            <spring:bind path="password">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <td>Password:</td>
                    <td><form:input type="password" path="password" class="form-control" autofocus="true"></form:input></td>
                    <td><form:errors path="password"></form:errors></td>
                </div>
            </spring:bind>
        </tr>
        <tr>
            <spring:bind path="passwordConfirm">
                <div class="form-group ${status.error ? 'has-error' : ''}">
                    <td>Confirm your password:</td>
                    <td><form:input type="password" path="passwordConfirm" class="form-control" autofocus="true"></form:input></td>
                    <td><form:errors path="passwordConfirm"></form:errors></td>
                </div>
            </spring:bind>
        </tr>

    </table>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>
