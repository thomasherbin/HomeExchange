<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url var="CancelBokingConfirmed" value="/CancelBookingConfirmed">
    <c:param name="id" value="${reservation.id}" />
</c:url>


<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cancel reservation</title>
</head>
<body>
<h1>Confirm to cancel reservation</h1>
<p>Are you sure you want to cancel this reservation ?</p>
<div>
    <a  href="${CancelBokingConfirmed}">Yes</a>
    <a  href="/index">No</a>
</div>
</body>