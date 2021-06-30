<%-- 
    Document   : enquiry
    Created on : Jun 21, 2021, 7:24:13 PM
    Author     : clickman
--%>

<%@page import="web.Enquiry"%>
<%@page import="java.util.List"%>
<%@page import="web.DbManager"%>
<%@page import="web.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("blog.jsp");
    }else{
    String name = user.Username;
    if (!name.equalsIgnoreCase("Admin")) {
        response.sendRedirect("blog.jsp");
    }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Enquiries Page</title>
        <!--css-->
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        
        <main class="mar-t">
            <div class="container">
                <h1>Enquiries </h1>
            <%
            DbManager db=new DbManager();
            List<Enquiry> enq = db.getAllEnquiry();
            
                for(Enquiry e:enq){
            %>
            
            <div class="card">
                <div class="card-body">
                    <div class="card-title"><b>Name :<span><%= e.Name %> </b><i>Email :<%= e.Email %></i></span></div>
                    <p class="card-text">Question :<%= e.Question %></p>
                    
                </div>
                
            </div>
            
            <%
                
            }
            
            %>
            </div>
            
        </main>
        
        <!--javascript-->
        <%@include file="jsfile.jsp" %>
    </body>
</html>
