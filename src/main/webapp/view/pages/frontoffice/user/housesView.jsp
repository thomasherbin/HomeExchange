<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<h1 class="text-center pb-2">Your houses</h1>


<c:choose>
    <c:when test="${empty houses}">
        <h2 class="text-center m-3"> You have no housing yet.</h2>
    </c:when>
    <c:otherwise>
        <div class="accordion" id="accordionExample">
            <c:forEach items="${houses}" var="home">
                <c:url var="EditHouse" value="/editHouse">
                    <c:param name="id" value="${home.id}"/>
                </c:url>
                <c:url var="DeleteHouse" value="/removeHouse">
                    <c:param name="id" value="${home.id}"/>
                </c:url>
                <c:url var="UploadPhoto" value="/upload">
                    <c:param name="id" value="${home.id}"/>
                </c:url>
                <c:url var="DeletePhoto" value="/deletePhoto">
                    <c:param name="id" value="${home.id}"></c:param>
                </c:url>

                <div class="card">
                    <div class="card-header text-white bg-info text-center" id="heading${home.id}">
                        <h2 class="mb-0">
                            <button class="btn btn-link text-white collapsed font-weight-bold" type="button" data-toggle="collapse" data-target="#collapse${home.id}" aria-expanded="false" aria-controls="collapse${home.id}">
                                <h3><i class="fa fa-home" aria-hidden="true"></i>
                                </h3>
                                <h2>${home.name}</h2>
                            </button>
                        </h2>
                    </div>
                    <div id="collapse${home.id}" class="collapse multi-collapse" aria-labelledby="heading${home.id}" data-parent="#accordionExample">
                        <div class="card-body">
                            <div class="d-flex bd-highlight">
                                <div class="p-2 bd-highlight ">
                                    <ul style="list-style:none;" class="pb-3">
                                        <h4 class="font-weight-bold pb-2">
                                            Location
                                        </h4>
                                        <li class="pb-2">
                                            <i class="fa fa-map-o" aria-hidden="true"></i>
                                            &nbsp; <span class="font-weight-bold">City:</span> &nbsp; ${home.city}
                                        </li>
                                        <li class="pb-2">
                                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                                            &nbsp;
                                            <span class="font-weight-bold">Address:</span> &nbsp; ${home.address}
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
                                            <span class="font-weight-bold">Status:</span> &nbsp; ${home.status}
                                        </li>
                                        <li class="pb-2">
                                            <i class="fa fa-calendar" aria-hidden="true"></i>
                                            &nbsp;
                                            <span class="font-weight-bold">Availability:</span> &nbsp; Available from ${home.dateStart} to ${home.dateEnd}
                                        </li>

                                    </ul>
                                    <hr style="background-color: #416475">
                                    <ul style="list-style:none;" class="pb-3">
                                        <h4 class="font-weight-bold pb-2">
                                            Housing details
                                        </h4>
                                        <li class="pb-2">
                                            <i class="fa fa-list" aria-hidden="true"></i>
                                            &nbsp;
                                            <span class="font-weight-bold">Description:</span> &nbsp; ${home.description}
                                        </li>
                                        <li class="pb-2">
                                            <i class="fa fa-television" aria-hidden="true"></i>
                                            &nbsp;
                                            <span class="font-weight-bold">Services:</span> &nbsp; ${home.service}
                                        </li>
                                        <li class="pb-2">
                                            <i class="fa fa-ban" aria-hidden="true"></i>
                                            &nbsp;
                                            <span class="font-weight-bold">Constraint Rules:</span> &nbsp; ${home.constraintRule}
                                        </li>
                                    </ul>

                                    <ul>
                                        <div class="d-flex flex-row bd-highlight mb-3">
                                            <div class="p-2 bd-highlight">
                                                <a href="${EditHouse}" class="btn btn-outline-info">Edit</a>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <a href="${DeleteHouse}" class="btn btn-outline-info">Remove</a>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <a href="${UploadPhoto}" class="btn btn-outline-info">Upload photo</a>
                                            </div>
                                            <div class="p-2 bd-highlight">
                                                <a href="${DeletePhoto}" class="btn btn-outline-info">Delete Photo</a>
                                            </div>

                                        </div>
                                    </ul>
                                </div>




                                <c:choose>
                                    <c:when test="${empty home.photo && empty home.photo2 && empty home.photo3}">
                                        <div class="p-2 d-flex  bd-highlight">
                                            <div class="p-2 bd-highlight ml-auto ">
                                                <p class="text-danger font-weight-bold">
                                                    <i class="fa fa-picture-o" aria-hidden="true"></i>
                                                    &nbsp; Photos: You have to upload at least one photo to describe your housing. </p>

                                            </div>

                                        </div>
                                    </c:when>
                                </c:choose>


                                <div class="p-2 d-flex bd-highlight">
                                    <div>
                                        <ul style="list-style:none;" class="pb-3">
                                            <li class="pb-2">
                                                <i class="" aria-hidden="true"></i>
                                                &nbsp;
                                                <span class="font-weight-bold"></span> &nbsp;
                                            </li>
                                        </ul>
                                    </div>

                                    <div class=" flex-column  bd-highlight mb-3">
                                        <div class="bd-highlight"><img src="${home.photo}" class="img-fluid rounded w-10"></div>
                                        <div class="bd-highlight"><img src="${home.photo2}" class="img-fluid rounded w-10"></div>
                                        <div class="bd-highlight"><img src="${home.photo3}" class="img-fluid rounded w-10"></div>
                                    </div>
                                </div>

                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<div class="text-center">
    <a href="/addHouse" class="btn btn-outline-info mt-3">Add house</a>
</div>

