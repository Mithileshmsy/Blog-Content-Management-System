<%-- 
    Document   : blog
    Created on : Jun 20, 2021, 7:40:59 PM
    Author     : clickman
--%>

<%@page import="web.Category"%>
<%@page import="java.util.List"%>
<%@page import="web.Post"%>
<%@page import="web.DbManager"%>
<%@page import="web.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {

    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog | tech Blog</title>
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
                        <%
                            DbManager db = new DbManager();
                            List<Post> post = db.GetAllPosts();
                            if (!post.isEmpty()) {
                                for (Post p : post) {
                        %>
                        <div class="container">
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
                        </div>
                        <%
                                }
                            }
                        %>





                        <!--content close-->
                    </div>
                    <div class="col-md-3">
                        <!--right panel-->
                        <%
                            if (user == null) {
                            } else {
                                String name = user.getUsername();
                        %>
                        <h3><%= user.getUsername()%></h3>
                        <%
                            if (name.equalsIgnoreCase("Admin")) {
                        %>
                        <div class="row m-2">
                            <a href="register.jsp" type="button" class="btn btn-dark">Add User</a>
                        </div>
                        <div class="row m-2">
                            <a href="viewenquiries.jsp" type="button" class="btn btn-info">View Enquiry</a>
                        </div>
                        <div class="row m-2">

                            <!--add category code-->
                            <div class="card">

                                <div class="card-header bg-dark text-white">Add Category</div>
                                <div class="card-body">

                                    <form action="CategoryInsertAPI" method="POST">
                                        <div class="form-group">
                                            <label for="Name">Category Name</label>
                                            <input required name="CatName" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Category Name">
                                            
                                        </div>
                                        <div class="form-group">
                                            <label for="description">Category Description</label>
                                            <textarea required name="CatDescription" maxlength="200" type="text" class="form-control" row="2" placeholder="Enter Description(200 character)"></textarea>
                                        </div>
                                        
                                        <button type="submit" class="btn btn-dark">Add Category</button>
                                    </form>

                                </div>
                            </div>

                        </div>
                        <%
                            }
                        %>

                        <div class="row m-2">
                            <a href="newpost.jsp" type="button" class="btn btn-success">Write a Post</a>
                        </div>
                        <div class="row m-2">
                            <a href="LogoutAPI" type="button" class="btn btn-info">Log Out</a>
                        </div>
                        <%
                            }
                        %> 

                        <!--codeend-->




                        <br>
                        <div class="row ">
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

                                <!--category code-->

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
                        <br>
                        <br>
                        <br>
                    </div>
                </div>

            </div>

        </main>

        <%@include file="footer.jsp" %>
        <!--javascript-->
        <%@include file="jsfile.jsp" %>
    </body>
</html>
