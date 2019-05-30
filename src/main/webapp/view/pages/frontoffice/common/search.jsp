<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<div>
    <h1 class="text-center pb-4">Search houses</h1>
    <div class="container">
        <div class="pb-4">
            <springForm:form method="post" modelAttribute="house" action="/searchByCity">
                <p class="text-center">Search by city: <springForm:input path="city" name="city"></springForm:input>
                    <input type="submit" value="Search" class="btn btn-outline-info"></p>
                <p><springForm:errors path="city"/></p>
            </springForm:form>
        </div>
        <div class="pb-4">
            <springForm:form method="post" modelAttribute="house" action="/searchByName">
                <p class="text-center">Search by name: <springForm:input path="name" name="name"></springForm:input>
                    <input type="submit" value="Search" class="btn btn-outline-info"></p>
                <p><springForm:errors path="name"/></p>
                <p></p>
            </springForm:form>
        </div>
    </div>

</div>
