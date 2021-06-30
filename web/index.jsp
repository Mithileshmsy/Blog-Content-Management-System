<%-- 
    Document   : index
    Created on : Jun 20, 2021, 7:40:36 PM
    Author     : clickman
--%>

<%@page import="web.DbManager"%>
<%@page import="web.Category"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog 2.0</title>
        <!--css-->
        <style>
            .cimg{
                max-height: 600px;
                max-width: box;
            }
        </style>
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <!--navbaar-->

        <%@include file="navbar.jsp" %>

        <!--navbar close-->

        <!--slider-->
        <div class="cantainer-fluid" Max-height="500px" Max-width="100%">

            <div id="carouselExampleIndicators" class="carousel slide" style="" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100 cimg" src="img/1.jpg" alt="First slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 cimg" src="img/2.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100 cimg" src="img/3.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
        <!--slider close-->

        <main>
            <div class="row">
                <div class="container-fluid">
                    <div class="jumbotron">
                        <div class="container text-center">
                            <h2 class="">Ready to start with</h2>
                            <h1>Tech Blog</h1> <br>
                            <p>Sign up for your risk-free Tech Blog account today!</p>
                        </div>
                    </div>
                </div>
            </div>

            <!--first container-->
            <div class="row bg-light p-2">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <img src="img/4.png" class="img-fluid"/>
                        </div>
                        <div class="col-md-6">

                            <div class="card ">

                                <div class="card-body">
                                    <h5 class="card-title display-4">Tech Blog </h5>
                                    <p class="card-text">
                                       Tech Blog is an online journal or informational website displaying 
                                       information in reverse chronological order, 
                                       with the latest posts appearing first, at the top.
                                    </p>
                                    <p>
                                       It is a platform where a writer or a group of writers 
                                       share their views on an individual subject.
                                    </p>
                                    <a href="blog.jsp" class="btn btn-dark">Explore</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--cards-->
            <!--category cards-->
            <div class="container">
                <div class="row m-2">
                    <%
                        DbManager db = new DbManager();
                        List<Category> category = db.GetAllCategory();
                        if (!category.isEmpty()) {
                            for (Category cat : category) {
                    %>
                    <div class="col-md-4">
                        <div class="card m-2" >
                            <div class="card-body">
                                <h5 class="card-title"><%= cat.CatName %></h5>
                                <p class="card-text"><%= cat.CatDescription %></p>
                                <a href="searchcat.jsp?id=<%= cat.CatID %>" class="btn btn-dark">Explore</a>
                            </div>
                        </div>
                    </div>
                    <%
                            }
                        }
                    %>


                    <!--category card close-->


                </div>

            </div>


        </main>

        <footer>
            <!--feedbacks-->
            <div class="row">
                <div class="container-fluid">
                    <div class="jumbotron">
                        <div class="container text-center">

                            <h2 class="display-4">Important Links</h2>
                            <br>
                            <p> 
                                <button type="button" class="btn btn-outline-dark">Facebook</button>
                                <button type="button" class="btn btn-outline-dark">Twitter</button>
                                <button type="button" class="btn btn-outline-dark">LinkedIn</button>
                                <button type="button" class="btn btn-outline-dark">Github</button>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!--footer-->
            <%@include file="footer.jsp" %>
        </footer>

        <!--javascript-->
        <%@include file="jsfile.jsp" %>
    </body>
</html>
