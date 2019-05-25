<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



<h2>User's List</h2>
<table>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Age</th>
        <th>birthDate</th>

    </tr>
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
            <td><a href="${EditUser}">Edit</a></td>
            <td><a href="${DeleteUser}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<a href="/addUser">Add user</a>
