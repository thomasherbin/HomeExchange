<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="main" role="main">
    <div class="main_inner">
        <div class="container">
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <form id="logoutForm" method="POST" action="${contextPath}/logout">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>

                <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>
            </c:if>
        </div>
        <div class="main_title">
            <h2>Welcome to</h2>
            <h1 class="l2h_title">Home Exchange</h1>
        </div>
        <div class="common_page_body">
            <div class="common_item">
                <a class="button" href="/housesView">Your houses</a>
            </div>
            <div class="common_item">
                <a class="button" href="/yourBooking">Your reservations</a>
            </div>
            <div class="common_item">
                <a class="button" href="/housesView">Your profile</a>
            </div>
            <div class="common_item">
                <ul class="home_list">
                    <li><<p class="list_text">Exchange yours homes for a short vacation</p></li>
                    <li><p class="list_text">Choose your services</p></li>
                    <li><p class="list_text">Check bla bla</p></li>
                </ul>
            </div>
        </div>
    </div>
</section>
