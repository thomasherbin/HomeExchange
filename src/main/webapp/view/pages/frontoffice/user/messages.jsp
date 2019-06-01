<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="springform" uri="http://www.springframework.org/tags/form" %>

<c:url var="messagePost" value="/messages">
    <c:param name="id" value="${user.id}"></c:param>
</c:url>

<p></p>
<div class="container">
    <h3 class=" text-center">Messages</h3>
    <div class="messaging">
        <div class="inbox_msg">
            <div class="mesgs">
                <div class="msg_history">
                    <c:choose>
                        <c:when test="${empty messages}">
                            <p>Start the conversation by sending a message !</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${messages}" var="message">
                                <c:if test="${message.senderId == user.id}">
                                    <div class="incoming_msg">
                                        <div class="incoming_msg_img"> <img src="https://ptetutorials.com/images/user-profile.png" alt="sunil"> </div>
                                        <div class="received_msg">
                                            <div class="received_withd_msg">
                                                <p>${message.content}</p>
                                                <span class="time_date">${user.firstName} ${user.lastName} at ${message.sentDate}</span></div>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${message.senderId == sessionUser.id}">
                                    <div class="outgoing_msg">
                                        <div class="sent_msg">
                                            <p>${message.content}</p>
                                            <span class="time_date"> ${sessionUser.firstName} ${sessionUser.lastName} at ${message.sentDate}</span> </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>
                <springform:form method="POST" modelAttribute="message" action="${messagePost}">
                    <div class="type_msg">
                        <div class="input_msg_write">
                            <springform:input path="content" type="text" class="write_msg" placeholder="Type a message" />
                            <springform:errors path="content"/>
                            <button class="msg_send_btn" type="submit"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </springform:form>
            </div>
        </div>
    </div>
</div>


