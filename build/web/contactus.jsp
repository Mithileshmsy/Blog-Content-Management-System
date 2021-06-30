<%-- 
    Document   : contactus
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
                        <h1>Contact Us</h1>
                    </div>
                    <div class="card-body">


                        <div class="row">
                            <div class="container">
                                <div class="card-deck text-center">

                                    <div class="card" style="">
                                        <div class="card-body">
                                            <h5 class="card-title"><span class="fa fa-map-marker"></span><br>Address</h5>
                                            <p class="card-text">
                                                Institute of Engineering and Rural Technology<br>
                                                26, Chatham line , Prayagraj (Allahabad)<br>
                                                UP - 211002 , INDIA
                                            </p>

                                        </div>
                                    </div>


                                    <div class="card" style="">
                                        <div class="card-body">
                                            <h5 class="card-title"><span class="fa fa-phone"></span><br>Contact No</h5>
                                            <p class="card-text">
                                                Ph & Fax : (+91)-0532-2544810; <br>
                                                (+91)-9956640825 (Assistant Registrar)
                                            </p>

                                        </div>
                                    </div>


                                    <div class="card" style="">
                                        <div class="card-body">
                                            <h5 class="card-title"><span class="fa fa-comment-o"></span><br>Email</h5>
                                            <p class="card-text">
                                                College id- mailedd@iert.ac.in<br>
                                                (Feel Free To Drop Mail)
                                            </p>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <br>
                        <h2><span class="fa fa-map-marker"></span> Location</h2>

                        <p>
                            <!--maps-->
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3601.98207104859!2d81.86770821426998!3d25.4722741267378!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x399aca86aaaaaaab%3A0x7fce282beaac48d1!2sInstitute%20of%20Engineering%20and%20Rural%20Technology!5e0!3m2!1sen!2sin!4v1624361048354!5m2!1sen!2sin" width="800" height="500" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                        </div>
                        </p>

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
