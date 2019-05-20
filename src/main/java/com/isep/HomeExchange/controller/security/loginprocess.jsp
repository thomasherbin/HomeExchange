<%@page import="com.isep.HomeExchange.controller.security.LoginDao"%>
<jsp:useBean id="obj" class="com.isep.HomeExchange.controller.security.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    boolean status=LoginDao.validate(obj);
    if(status){
        System.out.println("You r successfully logged in");
        session.setAttribute("session","TRUE");
    }
    else
    {
        System.out.print("Sorry, email or password error");
    }
%>