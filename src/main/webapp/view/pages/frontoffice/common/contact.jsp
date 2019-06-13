<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${isSubmit}">
        <div>
            <p>Your message has been sent ! </p>
            <a class="btn btn-outline-primary" href="/home">Go back to home page</a>
        </div>
    </c:when>
    <c:otherwise>
        <springform:form method="POST" modelAttribute="ticket" action="/contact">
                <div>
                    <div>
                        <springform:input path="description" type="text" placeholder="Type a message" />
                        <springform:errors path="description"/>
                    </div>
                    <div>
                        <springform:input path="senderEmail" type="text"  placeholder="Enter your email" />
                        <springform:errors path="senderEmail"/>
                    </div>
                    <input class="btn btn-outline-success" type="submit" value="Submit Message">
                    <a class="btn btn-outline-danger" href="/home">Cancel</a>
                </div>
        </springform:form>
    </c:otherwise>
</c:choose>
