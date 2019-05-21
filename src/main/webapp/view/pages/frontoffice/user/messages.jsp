<%@ c:taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springForm" uri="http://www.springframework.org/tags/form" %>


<c:forEach items="${messages}" var="message">
    <p>${message.content}</p>
</c:forEach>

<springForm:form method="post" modelAttribute="message" action="/message">
    <div>
        <springForm:input path="content"/>
        <springForm:errors path="content"/>
    </div>
    <input type="submit" value="send">
</springForm:form>


