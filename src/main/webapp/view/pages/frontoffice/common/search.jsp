<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>

<script type="text/javascript" src="/../../ressources/js/script.js"></script>
<link rel="stylesheet" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.3/themes/flick/jquery-ui.css" />

<div>
    <h1 class="text-center pb-4">Search houses</h1>
    <div class="container">
        <div class="pb-4">
            <springForm:form method="post" modelAttribute="house" action="/searchByCity">
                <p class="text-center font-weight-bold"> Search by city &nbsp;
                    <i class="fa fa-search" aria-hidden="true"></i>
                    &nbsp;
                     <springForm:input path="city" name="city" class="ff_elem"  id="f_elem_city"></springForm:input>
                    <input type="submit" value="Search" class="btn btn-outline-info"></p>
                <p><springForm:errors path="city"/></p>
            </springForm:form>
        </div>
        <div class="pb-4">
            <springForm:form method="post" modelAttribute="house" action="/searchByName">
                <p class="text-center font-weight-bold"> Search by name &nbsp;
                    <i class="fa fa-search" aria-hidden="true"></i>
                    &nbsp;
                    <springForm:input path="name" name="name"></springForm:input>
                    <input type="submit" value="Search" class="btn btn-outline-info"></p>
                <p><springForm:errors path="name"/></p>
                <p></p>
            </springForm:form>
        </div>
    </div>

</div>
