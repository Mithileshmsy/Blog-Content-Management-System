
<%-- 
    Document   : login
    Created on : Jun 20, 2021, 7:41:16 PM
    Author     : clickman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css-->
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
       <!--navbar-->
       <%@include file="navbar.jsp" %>
        <!--login form-->
        <main class="d-flex align-items-center primary-background clip-border" style="height:80vh"> 
            <div class="container">

                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header text-center bg-dark text-white">
                                <span class="fa fa-user fa-3x"></span><br>
                                <strong>Login Here</strong>
                            </div>
                            <div class="card-body">
                                <form action="LoginAPI" method="POST">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="pass" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>
                                    <div class="container text-center">
                                        <button name="btnLogin" type="submit" class="btn btn-dark">Log In</button>
                                    </div>

                                </form>
                            </div>

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
