<%-- 
    Document   : post
    Created on : Jun 20, 2021, 7:41:57 PM
    Author     : clickman
--%>

<%@page import="web.Category"%>
<%@page import="java.util.List"%>
<%@page import="web.User"%>
<%@page import="web.Post"%>
<%@page import="web.DbManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {

    }
%>

<%
    DbManager db = new DbManager();
    Post post;
//if (request.getParameter("id") != null) {
    int postID = Integer.parseInt(request.getParameter("Id").toString());
    post = db.GetPost(postID);
    //} else {
    //  response.sendError(404, "This Article Not Found... :D");
    //  }


%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View post | Tech Blog</title>
        <!--css-->
        <%@include  file="cssfile.jsp" %>

    </head>
    <body>
        <!--navbar-->
        <%@include  file="navbar.jsp" %>
        <h1>Hello World!</h1>
        <main class="mar-t">
            <div class="container">

                <div class="row">
                    <div class="col-md-9">

                        <!--code here-->

                        <div class="row">
                            <div class="card mb-3">
                                <img class="card-img-top" src="PostImage/<%= post.PostImage%>" alt="Card image cap">
                                <div class="card-body">
                                    <h3 class="card-title"><%= post.PostTitle%></h3>


                                    <p class="card-text m-2 p-2"><strong>Written by : <%= post.PostAuthor%>
                                            <small class="text-muted"><%= post.PublishDate%></small>
                                        </strong>
                                    </p>

                                    <!--code-->

                                    <%
                                        if (user == null) {
                                        } else {
                                            String name = user.getUsername();
                                            if (name.equalsIgnoreCase("Admin")) {
                                    %>
                                    <h1>Admin</h1>
                                    <%
                                        }
                                    %>

                                    <a href="DeleteAPI?id=<%= post.ID%>" class="card-link btn btn-danger">Delete Post</a>
                                    <a href="update.jsp?id=<%= post.ID%>" class="card-link btn btn-success">Update Post</a>

                                    <%

                                        }
                                    %> 

                                    <!--codeend-->

                                    <p class="card-text"><%= post.PostContent%></p>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <h2>Releted Post :</h2>
                        </div>
                        <div class="row">
                            <%
                                List<Post> randompost = db.getRandPost();
                                for (Post rp : randompost) {
                            %>

                            <div class="col-md-4">
                                <div class="card m-2">
                                    <img class="card-img-top" src="PostImage/<%= rp.PostImage %>" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= rp.PostTitle %></h5>
                                        <p class="card-text"><%= rp.PostDescription %> </p>
                                        <a href="post.jsp?Id=<%= rp.ID %>" class="btn btn-dark">View Post</a>
                                    </div>
                                </div>
                            </div>

                            <%
                                }
                            %>


                        </div>
                    </div>


                
                <div class="col-md-3">

                    <div class="row">
                        <div class="container">
                            <div class="card w-100 p2 bg-light">
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

        </div>

    

</main>


<!--footer-->
<%@include  file="footer.jsp" %>

<!--javscript-->
<%@include  file="jsfile.jsp" %>

</body>
</html>
