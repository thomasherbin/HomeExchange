<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
    <tr>
        <td>First Name: </td>
        <td>${user.firstName}</td>
    </tr>
    <tr>
        <td>Last Name: </td>
        <td>${user.lastName}</td>
    </tr>
    <tr>
        <td>Username:</td>
        <td>${user.userName}</td>
    </tr>
    <tr>
        <td>Email:</td>
        <td>${user.email}</td>
    </tr>
</table>

<a href="/updateUser">Edit</a>
<a href="/updatePassword">Change Password</a>