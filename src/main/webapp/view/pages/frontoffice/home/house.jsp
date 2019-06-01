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
                    <c:choose>
                        <c:when test="${empty house.photo}"></c:when>
                        <c:otherwise>
                            <div class="carousel-item active">
                                <img class="center-block img-fluid rounded w-50" src="${house.photo}" alt="Not available">
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty house.photo2}"></c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <img class="center-block img-fluid rounded w-50" src="${house.photo2}" alt="Not available">
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <c:choose>
                        <c:when test="${empty house.photo3}"></c:when>
                        <c:otherwise>
                            <div class="carousel-item">
                                <img class="center-block img-fluid rounded w-50" src="${house.photo3}" alt="Not available">
                            </div>
                        </c:otherwise>
                    </c:choose>
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

<div class="d-flex flex-row bd-highlight justify-content-around mb-3 mt-5">
    <div class="p-2 bd-highlight w-100">
        <ul style="list-style:none;" class="pb-3">
            <h4 class="font-weight-bold pb-2">
                Location
            </h4>
            <li class="pb-2">
                <i class="fa fa-map-o" aria-hidden="true"></i>
                &nbsp; <span class="font-weight-bold">City:</span> &nbsp; ${house.city}
            </li>
            <li class="pb-2">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Address:</span> &nbsp; ${house.address}
            </li>
        </ul>
        <hr style="background-color: #416475">
        <ul style="list-style:none;" class="pb-3">
            <h4 class="font-weight-bold pb-2">
                Reservation details
            </h4>
            <li class="pb-2">
                <i class="fa fa-book" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Status:</span> &nbsp; ${house.status}
            </li>
            <li class="pb-2">
                <i class="fa fa-calendar" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Availability:</span> &nbsp; Available from ${house.dateStart} to ${house.dateEnd}
            </li>

        </ul>
    </div>
    <div class="p-2 bd-highlight w-100">
        <ul style="list-style:none;" class="pb-3">
            <h4 class="font-weight-bold pb-2">
                Housing details
            </h4>
            <li class="pb-2">
                <i class="fa fa-list" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Description:</span> &nbsp; ${house.description}
            </li>
            <li class="pb-2">
                <i class="fa fa-television" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Services:</span> &nbsp; ${house.service}
            </li>
            <li class="pb-2">
                <i class="fa fa-ban" aria-hidden="true"></i>
                &nbsp;
                <span class="font-weight-bold">Constraint Rules:</span> &nbsp; ${house.constraintRule}
            </li>
        </ul>
    </div>
</div>
<div class="mt-3 ml-5">
    <a href="${BookHouse}" class="btn btn-outline-info m-3">Book</a>
</div>
