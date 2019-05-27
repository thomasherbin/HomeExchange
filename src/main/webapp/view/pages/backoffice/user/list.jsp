<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<h2>User's List</h2>
<table class="table">
    <thead>
        <tr>
            <th scope="col">First Name</th>
            <th scope="col">Last Name</th>
            <th scope="col">Username</th>
            <th scope="col">Email</th>
            <th scope="col">Role</th>
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
                <td><a href="${EditUser}">Edit</a></td>
                <td><a href="${DeleteUser}">Delete</a></td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<a href="/addUser">Add user</a>
