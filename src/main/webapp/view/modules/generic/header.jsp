<h2>This is header</h2>
<a href="login">login</a>|
<form id="logoutForm" method="POST" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
src/main/webapp/view/pages/frontoffice/user/login.jsp