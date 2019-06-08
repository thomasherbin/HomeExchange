<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
<h1 class="text-center pt-2 pb-3">Your profile</h1>
    <hr>
    <div class="container ml-5">
        <table class="table table-borderless table-hover ml-5 pb-2">
            <tr>
                <td class="font-weight-bold">First Name: &nbsp;&nbsp; </td>
                <td>${user.firstName}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Last Name:   </td>
                <td>${user.lastName}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Username:  </td>
                <td>${user.userName}</td>
            </tr>
            <tr>
                <td class="font-weight-bold">Email:  </td>
                <td>${user.email}</td>
            </tr>
        </table>
    </div>
    <div class="container ml-5 pl-5 pt-2">
        <a href="/updateUser" class="btn btn-outline-info">Edit </a>
        &nbsp;&nbsp;&nbsp;<a href="/updatePassword" class="btn btn-outline-info">Change Password</a>
    </div>
    <br>

</div>
