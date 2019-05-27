<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
</head>
<body>
<header class="header">
    <div class="header_inner">
        <div class="branding">
            <a class="logo" href="/">
                <img src="/ressources/image/logo.png" alt="logo">
            </a>
        </div>
        <div class="menu">
            <div class="menu_inner">
                <a class="menu_link" href="/">Home</a>
                <a class="menu_link" href="/contact">Contact Us</a>
                <a href="/login">login</a>
                <a href="logout.jsp">logout</a>
            </div>
        </div>
    </div>
    <div class="responsive_menu_inner" id="common_menu">
        <a class="menu_link" href="/">Home</a>
        <a class="menu_link" href="/contact">Contact Us</a>
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </form>

          <a> ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></a>
        </c:if>
    </div>
</header>
