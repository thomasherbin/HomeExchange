<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="jumbotron bg-info text-white">
    <div class="container">
        <h1 class="display-3 font-weight-bold text-center">Welcome to Home Exchange !</h1>
        <p class="font-weight-bold text-center">Exchange yours homes for a short vacation. Choose your services. Check your reservations.</p>
    </div>
</div>

<c:choose>
    <c:when test="${pageContext.request.userPrincipal.name != null}">
        <div class="container bg-light text-center">
                <div class="row align-items-center">
                    <div class="col-lg-4">
                        <img src="/ressources/image/key.png" width="50" height="50" alt="">
                        <h2>Are you a owner ?</h2>
                    </div>
                    <div class="col-lg-4">
                        <h3><a class="button text-info" href="/housesView">Your Houses</a></h3>
                        <p class="lead mb-0">Manage your houses and set your rules!</p>
                    </div>
                    <div class="col-lg-4">
                        <h3><a class="button text-info" href="/bookingList">Your booking list</a></h3>
                        <p class="lead mb-0">Accept or refuse reservation request !</p>
                    </div>
            </div>
        </div>
        <p></p>
        <div class="container bg-light text-center">
            <div class="row align-items-center">
                <div class="col-lg-4">
                    <h3><a class="button text-info" href="/search">Search houses</a></h3>
                    <p class="lead mb-0">Find a house you can rent !</p>
                </div>
                <div class="col-lg-4">
                    <h3><a class="button text-info" href="/yourBooking">Your reservations</a></h3>
                    <p class="lead mb-0">Check your reservation !</p>
                </div>
                <div class="col-lg-4">
                    <img src="/ressources/image/house.png" width="50" height="50" alt="">
                    <h2>Are you a renter ?</h2>
                </div>
            </div>
        </div>
        <p></p>
        <div class="container bg-light text-center">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h2>Need Help ?</h2>
                </div>
                <div class="col-lg-6">
                    <h3><a class="button text-info" href="/contact">Contact</a></h3>
                    <p class="lead mb-0">Don't hesitate to contact us!</p>
                </div>
            </div>
        </div>
        <p></p>
        <c:if test="${userIsAdmin == true}">
            <div class="container bg-light text-center ">
                <div class="row align-items-center">
                    <div class="col">
                        <img src="/ressources/image/admin-with-cogwheels.png" width="50" height="50" alt="">
                        <h2>For admin</h2>
                    </div>
                    <div class="col ">
                        <h3><a class="button text-info" href="/userList">User List</a></h3>
                    </div>
                    <div class="col">
                        <h3><a class="button text-info" href="/ticketList">Ticket Support</a></h3>
                    </div>
                </div>
            </div>
        </c:if>
    </c:when>
    <c:otherwise>
        <a  class="btn btn-outline-primary" href="${contextPath}/login">Login</a>
        <a  class="btn btn-outline-primary" href="${contextPath}/registration">SignUp</a>
        <a  class="btn btn-outline-primary" href="/contact">Contact</a>
    </c:otherwise>
</c:choose>


