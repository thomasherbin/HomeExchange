<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:url var="BookHouse" value="/bookHouse">
    <c:param name="id" value="${house.id}"/>
</c:url>



<springForm:form class="text-left border border-info p-5" method="post" modelAttribute="reservation" action="${BookHouse}">
      <p class="text-info h4 mb-2">Book a house</p>
       
   
    <table class="table">
        <tr style="border-style:hidden">
            <td class="text-secondary">Number of individuals <springForm:input type="number" min="1" max="1000" path="nbGuests" class="align-text form-control" /></td>
            <td><springForm:errors path="nbGuests"  /></td>
        </tr>
        <tr style="border-style:hidden">
            <td class="text-secondary">Book From <springForm:input path="dateStart"  class="form-control" type="date" />
            <td><springForm:errors path="dateStart"  /></td>
            <td class="text-secondary"> To <springForm:input path="dateEnd" type="date" class="form-control" />
            <td><springForm:errors path="dateEnd"  /></td>
            </td>
        </tr>
        <tr>
            <td colspan="3"><input type="submit" class="btn btn-info btn-lg" value="Book House"></td>
        </tr>
    </table>
</springForm:form>
