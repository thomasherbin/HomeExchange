<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

Create an account</h1>
<div class="container">

    <form:form method="POST" modelAttribute="userForm" class="form-signin">
    <h2 class="form-signin-heading">Create your account</h2>
    <spring:bind path="userName">
    <div class="form-group ${status.error ? 'has-error' : ''}">
        <form:input type="text" path="userName" class="form-control" placeholder="Email" autofocus="true"></form:input>
        <form:errors path="username"></form:errors>
    </div>
    </spring:bind>

    <spring:bind path="password">
    <div class="form-group ${status.error ? 'has-error' : ''}">
        <form:input type="password" path="password" class="form-control" placeholder="Password"></form:input>
        <form:errors path="password"></form:errors>
    </div>
    </spring:bind>

    <spring:bind path="passwordConfirm">
    <div class="form-group ${status.error ? 'has-error' : ''}">
        <form:input type="password" path="passwordConfirm" class="form-control"
                    placeholder="Confirm your password"></form:input>
        <form:errors path="passwordConfirm"></form:errors>

    </div>
    </spring:bind>
    <div>
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
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
    </form:form>
</div>
