<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="/ressources/image/logo.png" width="100" height="50" alt="">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/yourProfile">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/housesView">Your houses</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/search">Search</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/bookingList">Booking List</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/yourBooking">Reservations</a>
                    </li>
                    <c:if test="${userIsAdmin == true}">
                        <li class="nav-item">
                            <a class="nav-link" href="/userList">User List</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/">Ticket Support</a>
                        </li>
                    </c:if>
                </ul>
            </div>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <button class="btn btn-outline-danger" type="submit">Logout</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:when>
            <c:otherwise>
                <form id="logoutForm" method="POST" action=${contextPath}/registration">
                    <button class="btn btn-outline-primary" type="submit">SignUp</button>
                </form>
            </c:otherwise>
        </c:choose>
        </div>
    </nav>


</header>


