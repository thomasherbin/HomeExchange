<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1 class="text-center mb-3 mt-2">Contact Form</h1>
<div class="container text-center">
    <h3 class="mb-3">Please feel free to contact us if you have any question !</h3>
    <c:choose>
        <c:when test="${isSubmit}">
            <div>
                <p>Your message has been sent ! </p>
                <a class="btn btn-outline-info" href="/home">Go back to home page</a>
            </div>
        </c:when>
        <c:otherwise>
            <springform:form method="POST" modelAttribute="ticket" action="/contact">
                <div>
                    <div class="mb-3 font-weight-bold">
                        <p class="text-left">Your email :</p>
                        <springform:input path="senderEmail" type="text"  placeholder="Enter your email" cssClass="form-control" />
                        <springform:errors path="senderEmail"/>
                    </div>
                    <div class="mb-2 font-weight-bold">
                        <p class="text-left">Your message :</p>
                        <springform:textarea path="description" placeholder="Type a message" cssClass="form-control" />
                        <springform:errors path="description"/>
                    </div>
                    <input class="btn btn-outline-info" type="submit" value="Submit Message">
                    <a class="btn btn-outline-info" href="/home">Cancel</a>
                </div>
            </springform:form>
        </c:otherwise>
    </c:choose>
</div>

