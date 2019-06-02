<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="jumbotron bg-info text-white">
    <div class="container ">
        <h1 class="display-3 text-center font-weight-bold">Welcome to Home Exchange !</h1>
        <p class="text-center font-weight-bold">Exchange your houses for a short vacation. Choose your services. Check your reservations.</p>
    </div>
</div>


<div class="container bg-light text-center">
    <div class="row align-items-center">
        <div class="col-lg-4">
            <img src="/ressources/image/key.png" width="50" height="50" alt="">
            <h2>Are you an owner ?</h2>
        </div>
        <div class="col-lg-4">
            <h3><a class="button text-info" href="/housesView">Your Houses</a></h3>
            <p class="lead mb-0">Manage your houses and set your rules !</p>
        </div>
        <div class="col-lg-4">
            <h3><a class="button text-info" href="/bookingList">Your booking list</a></h3>
            <p class="lead mb-0">Accept or refuse reservation requests !</p>
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
            <p class="lead mb-0">Check your reservations !</p>
        </div>
        <div class="col-lg-4">
            <img src="/ressources/image/house.png" width="50" height="50" alt="">
            <h2>Are you a renter ?</h2>
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
                <h3><a class="button" href="/userList">User List</a></h3>
            </div>
            <div class="col">
                <h3><a class="button" href="/">Ticket Support</a></h3>
            </div>
        </div>
    </div>
</c:if>

