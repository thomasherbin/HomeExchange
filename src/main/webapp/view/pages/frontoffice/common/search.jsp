<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<div>
    <h1>Search houses</h1>
    <table>
        <tr>
            <springForm:form method="post" modelAttribute="house" action="/searchByCity" >
                <td>Search by city: <springForm:input path="city" name="city"></springForm:input></td>
                <td><springForm:errors path="city"/></td>
                <td><input type="submit" value="Search"></td>
            </springForm:form>
        </tr>
        <tr>
            <springForm:form method="post" modelAttribute="house" action="/searchByName" >
                <td>Search by name: <springForm:input path="name" name="name"></springForm:input></td>
                <td><springForm:errors path="name"/></td>
                <td><input type="submit" value="Search"></td>
            </springForm:form>
        </tr>
    </table>
</div>
