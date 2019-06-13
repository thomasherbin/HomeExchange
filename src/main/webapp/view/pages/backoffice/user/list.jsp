<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="container">

    <h2 class="text-center mt-2 mb-3">Users List</h2>
    <table class="table text-center">
        <thead>
        <tr>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
            <th scope="col">Edit user</th>
            <th scope="col">Banish user</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach  items="${users}" var ="user">

            <c:url var="EditUser" value="/editUser">
                <c:param name="id" value="${user.id}" />
            </c:url>
            <c:url var="DeleteUser" value="/removeUser">
                <c:param name="id" value="${user.id}" />
            </c:url>


            <tr>
                <td>${user.firstName}</td>
                <td>${user.lastName}</td>
                <td>${user.userName}</td>
                <td>${user.email}</td>
                <td>${user.role}</td>
                <td><a class="btn btn-outline-info" href="${EditUser}">Edit</a></td>
                <td><a class="btn btn-outline-info" href="${DeleteUser}">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <a class="btn btn-outline-info" href="/addUser">Add user</a>
</div>
