<%-- 
    Document   : aboutus
    Created on : Jun 22, 2021, 1:55:29 PM
    Author     : clickman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
        <!--css-->
        <%@include file="cssfile.jsp" %>

    </head>
    <body>
        <!--navbar-->
        <%@include file="navbar.jsp" %>


        <main class="mar-t">
            <div class="container text-center">
                <div class="card">
                    <div class="card-header">
                        <h1>About Us</h1>
                    </div>
                    <div class="card-body">

                        <p>
                        <h2>Who we Are</h2>
                        </p>

                        <div class="row">
                            
                                <div class="col-md-4">
                                    <div class="card" style="">
                                        <img class="card-img-top" src="dev/atul.jpg" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title">Atul Chaturvedi</h5>
                                            <p class="card-text">
                                                Class Roll No : 64<br>
                                                AKTU Roll No : 1811010904
                                            </p>
                                            <a href="#" class="btn btn-dark">LinkedIn</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card" style="">
                                        <img class="card-img-top" src="dev/sonu.jpg" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title">Sonu Yadav</h5>
                                            <p class="card-text">
                                                Class Roll No : 70<br>
                                                AKTU Roll No : 1811010910
                                            </p>
                                            <a href="#" class="btn btn-dark">LinkedIn</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card" style="">
                                        <img class="card-img-top" src="dev/mithilesh.png" alt="Card image cap">
                                        <div class="card-body">
                                            <h5 class="card-title">Mithilesh Yadav</h5>
                                            <p class="card-text">
                                                Class Roll No : 65<br>
                                                AKTU Roll No : 1811010905
                                            </p>
                                            <a href="#" class="btn btn-dark">LinkedIn</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        

                    </div>
                </div>
            </div>

        </main>
        <br>
        <br>
        <%@include file="footer.jsp" %>

        <%@include file="jsfile.jsp" %>

    </body>
</html>
