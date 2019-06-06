<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">

    <table>
        <tr>
            <td>First Name: &nbsp;&nbsp; </td>
            <td>${user.firstName}</td>
        </tr>
        <tr>
            <td>Last Name:   </td>
            <td>${user.lastName}</td>
        </tr>
        <tr>
            <td>Username:  </td>
            <td>${user.userName}</td>
        </tr>
        <tr>
            <td>Email:  </td>
            <td>${user.email}</td>
        </tr>
    </table><br>
<a href="/updateUser">Edit </a>
    &nbsp;&nbsp;&nbsp;<a href="/updatePassword">Change Password</a>
</div>
