<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>



<h1>Messages</h1>

<c:choose>
    <c:when test="${empty messages}">
        <p>Start the conversation by sending a message !</p>
    </c:when>
    <c:otherwise>
        <c:forEach items="${messages}" var="message">
            <c:if test="${message.senderId == user.id}">
                <p>${user.firstName} ${user.lastName} at ${message.sentDate}</p>
                <p>${message.content}</p>
            </c:if>
            <c:if test="${message.senderId == sessionUser.id}">
                <p>${sessionUser.firstName} ${sessionUser.lastName} at ${message.sentDate}</p>
                <p>${message.content}</p>
            </c:if>
        </c:forEach>
    </c:otherwise>
</c:choose>

<c:url var="messagePost" value="/messages">
    <c:param name="id" value="${user.id}"></c:param>
</c:url>


<springform:form method="POST" modelAttribute="message" action="${messagePost}">
    <div>
        <springform:input path="content" />
        <springform:errors path="content"/>
    </div>
    <input type="submit" value="send">
</springform:form>






