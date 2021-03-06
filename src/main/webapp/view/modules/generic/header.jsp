<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="/">
                <img src="/ressources/image/logo.png" width="100" height="50" alt="">
            </a>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="/contact">Contact <span class="sr-only">(current)</span></a>
                    </li>
                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                        <li class="nav-item">
                            <a class="nav-link" href="/yourProfile">Profile</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/housesView">My Houses</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/search">Search</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/yourBooking">Reservations</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="/bookingList">Booking List</a>
                        </li>
                        <c:if test="${userIsAdmin == true}">
                            <li class="nav-item">
                                <a class="nav-link" href="/userList">User List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/ticketList">Support Tickets</a>
                            </li>
                        </c:if>
                    </c:if>
                </ul>
            </div>
        <c:choose>
            <c:when test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <button class="btn btn-outline-danger" type="submit">Log out</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </c:when>
            <c:otherwise>
                <a  class="btn btn-outline-info m-2" href="${contextPath}/login">Log In</a>
                <a  class="btn btn-outline-info m-2" href="${contextPath}/registration">Sign Up</a>
            </c:otherwise>
        </c:choose>
        </div>
    </nav>


</header>


