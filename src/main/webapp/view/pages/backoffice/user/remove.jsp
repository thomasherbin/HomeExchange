

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="RemoveUserConfirmed" value="/removeUserConfirmed">
    <c:param name="id" value="${user.id}" />
</c:url>

<div class="container">
    <div class="container_small">
        <h1>Remove ${user.firstName}?</h1>
        <p>Are you sure you want to remove the user ${user.firstName}?</p>
        <div>
            <a class="btn btn-outline-success" href="${RemoveUserConfirmed}">Yes</a>
            <a  class="btn btn-outline-danger" href="/userList">No</a>
        </div>
    </div>
</div>
