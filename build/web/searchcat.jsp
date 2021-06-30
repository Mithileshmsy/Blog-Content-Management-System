<%-- 
    Document   : searchcat
    Created on : Jun 20, 2021, 7:40:59 PM
    Author     : clickman
--%>

<%@page import="web.Category"%>
<%@page import="web.Post"%>
<%@page import="java.util.List"%>
<%@page import="web.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int catId = Integer.parseInt(request.getParameter("id"));
    DbManager db = new DbManager();
    List<Post> post = db.GetAllPostbyCatID(catId);

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Category post | Tech Blog</title>
        <%@include file="cssfile.jsp" %>
        <style>
            .pimg{
                max-height:150px;
            }
        </style>
        <!--css-->
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <!--navbar-->
        <main>


            <div class="container mar-t">
                <div class="row">

                    <div class="col-md-9">
                        <!--left panel-->
                        <!--content-->
                        <div class="container">
                            <%                            for (Post p : post) {
                            %>

                            <div class="row">
                                <div class="card md-12 bg-transparent  border-dark mb-3">
                                    <img class="card-img-top pimg" src="PostImage/<%= p.PostImage%>" alt="Card image cap">
                                    <div class="card-header"><%= p.PostTitle%></div>
                                    <div class="card-body">
                                        <p class="card-text"><%= p.PostDescription%></p>
                                        <a href="post.jsp?Id=<%= p.ID%>" class="btn btn-dark text-right">View Post</a>
                                    </div>
                                </div>
                            </div>

                            <%

                                }
                            %>

                        </div>

                    </div>
                    <!--content close-->

                    <div class="col-md-3">
                        <!--right panel-->


                        <div class="row">
                            <form action="search.jsp" method="GET">
                                <div class="form-group">
                                    <label for="query">Search :</label>
                                    <input name="query" type="text" class="form-control" id="search" placeholder="search here">
                                </div>
                                <button type="submit" class="btn btn-dark">Search</button>
                            </form>
                        </div>
                        <br>
                        <div class="row">

                            <div class="card w-100 bg-light">
                                <div class="card-body">

                                    <h5 class="card-title">Category</h5>
                                    <%
                                        List<Category> category = db.GetAllCategory();
                                        if (!category.isEmpty()) {
                                            for (Category cat : category) {
                                    %>
                                    <a href="searchcat.jsp?id=<%= cat.CatID%>" class="card-link"><%= cat.CatName%></a><br>

                                    <%
                                            }
                                        }
                                    %>
                                </div>
                                <hr>
                                <div class="card-body">
                                    <h5 class="card-title">Social</h5>
                                    <a href="#" class="card-link">Card link</a><br>
                                    <a href="#" class="card-link">Another link</a><br>
                                </div>
                            </div>

                        </div>


                    </div>
                </div>

            </div>

        </main>
        <br>
        <br>
        <br>

        <%@include file="footer.jsp" %>
        <!--javascript-->
        <%@include file="jsfile.jsp" %>
    </body>
</html>
