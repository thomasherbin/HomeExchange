<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="RemoveHouseConfirmed" value="/RemoveHouseConfirmed">
    <c:param name="id" value="${house.id}" />
</c:url>



<h1 class="text-center pb-3">Confirmation to remove housing</h1>
<h3 class="text-center pb-3">Are you sure you want to remove this housing ?</h3>
<div class="text-center pb-3">
    <p>If you remove this housing, you'll lose all the bookings related to. </p>
</div>
<div class="text-center">
    <a  href="${RemoveHouseConfirmed}" class="btn btn-outline-info ml-2 mr-2">Yes</a>
    <a  href="/index" class="btn btn-outline-info ml-2 mr-2">No</a>
</div>
