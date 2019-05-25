<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="UploadPhoto" value="/upload">
    <c:param name="id" value="${house.id}" />
</c:url>

<form action="${UploadPhoto}" enctype="multipart/form-data" method="post">
    <table>
        <tr>
            <td>Photo:</td>
            <td><input type="file" name="file"/></td>
            <td><input type="submit" value="submit  "></td>
        </tr>
    </table>

</form>