<%-- 
    Document   : register
    Created on : Jun 20, 2021, 7:42:21 PM
    Author     : clickman
--%>

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
        <title>Registration Page</title>
        <!--css-->
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>

        <!--main-->
        <main class="primary-background clip-border mar-t" style="padding-bottom: 100px;">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center bg-dark text-white">
                            <span class="fa fa-3x fa-user-plus"></span>
                            <br>
                            <strong>Register Here</strong>
                        </div>
                        <div class="card-body">
                            <form id="reg-form" action="RegisterAPI" method="POST">
                                <div class="form-group">
                                    <label for="exampleInputName">User Name</label>
                                    <input required name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input required name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input required name="user_pass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Select Gender</label><br>
                                    <input type="radio"  name="user_gender" value="male"> Male
                                    <input type="radio"  name="user_gender" value="female"> Female
                                </div>

                                <div class="form-group">
                                    <textarea required name="user_about" class="form-control" rows="3" placeholder="Something about yourself"></textarea>
                                </div>

                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
                                </div>
                                <br>
                                <div id="loder" class="container text-center" style="display:none;">
                                    <span class="fa fa-refresh fa-3x fa-spin"></span>
                                    <br>
                                    <h3>Please Wait</h3>
                                </div>
                                <button id="submit" type="submit" class="btn text-white bg-dark">Register</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </main>



        <!--footer-->
        <%@include file="footer.jsp" %>

        <!--javascript-->
        <%@include file="jsfile.jsp" %>

    </body>
</html>
