<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="UploadPhoto" value="/upload">
    <c:param name="id" value="${house.id}" />
</c:url>

<h1 class="text-center pb-3">Upload a photo to describe your housing</h1>


<form action="${UploadPhoto}" enctype="multipart/form-data" method="post" class="text-center">
    <div class="form-group d-flex flex-row mb-3 justify-content-center">
        <div class="p-2 bd-highlight font-weight-bold ml-2">
            <i class="fa fa-picture-o" aria-hidden="true"></i>
            &nbsp;
            Photo:</div>
        <div class="p-2 bd-highlight ml-2 "><input type="file" name="file" class="form-control-file custom-file"/></div>
    </div>
    <input type="submit" value="Submit" class="btn btn-outline-info">
</form>