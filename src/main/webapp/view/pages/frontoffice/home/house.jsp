<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="BookHouse" value="/BookHouse">
    <c:param name="id" value="${house.id}"/>
</c:url>


<h1 class="text-center pb-2">${house.name}</h1>


<div class="text-center">
    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel" data-intervall="10000">
        <div class="carousel-inner">
            <c:choose>
                <c:when test="${empty house.photo && empty house.photo2 && empty house.photo3}">
                    <h4 class="text-center">No photo available</h4>
                </c:when>
                <c:otherwise>
                    <div class="carousel-item active">
                        <img class="center-block img-fluid rounded w-50" src="${house.photo}" alt="Not available">
                    </div>
                    <div class="carousel-item">
                        <img class="center-block img-fluid rounded w-50" src="${house.photo2}" alt="Not available">
                    </div>

                    <div class="carousel-item">
                        <img class="center-block img-fluid rounded w-50" src="${house.photo3}" alt="Not available">
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon text-white bg-dark" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next " href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon text-white bg-dark " aria-hidden="true"></span>
            <span class="sr-only ">Next</span>
        </a>
    </div>
</div>

<table class="table table-hover m-3">
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-home" aria-hidden="true"></i>
            &nbsp; Name</td>
        <td>${house.name}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-map-o" aria-hidden="true"></i>
            &nbsp; City</td>
        <td>${house.city}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-map-marker" aria-hidden="true"></i>
            &nbsp; Address</td>
        <td> ${house.address}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-book" aria-hidden="true"></i>
            &nbsp; Status</td>
        <td>${house.status}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-list" aria-hidden="true"></i>
            &nbsp; Description</td>
        <td>${house.description}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-television" aria-hidden="true"></i>
            &nbsp; Services</td>
        <td>${house.service}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-ban" aria-hidden="true"></i>
            &nbsp; Constraint Rules</td>
        <td>${house.constraintRule}</td>
    </tr>
    <tr>
        <td class="font-weight-bold"> <i class="fa fa-calendar" aria-hidden="true"></i>
            &nbsp; Availability</td>
        <td>Available from ${house.dateStart} to ${house.dateEnd} </td>
    </tr>

</table>
<a href="${BookHouse}" class="btn btn-outline-info">Book</a>
