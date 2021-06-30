<%-- 
    Document   : logintest
    Created on : Jun 21, 2021, 7:39:36 AM
    Author     : clickman
--%>

<%@page import="web.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        if(user ==null){
        
            %>
        <h1>Your Name</h1>
        <%
        }
        else{
        %>
        <h1><%= user.getUsername()%></h1>
        <%
        }
        %> 
        
        
        
    </body>
</html>
