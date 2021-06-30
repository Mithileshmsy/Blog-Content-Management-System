<%-- 
    Document   : update
    Created on : Jun 20, 2021, 7:41:40 PM
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

<% DbManager db = new DbManager();
    Post post;
//if (request.getParameter("id") != null) {
    int postID = Integer.parseInt(request.getParameter("id").toString());
    post = db.GetPost(postID);
    //} else {
    //  response.sendError(404, "This Article Not Found... :D");
    //  }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Post | Tech Blog</title>
        <!--css--> 
        <%@include file="cssfile.jsp" %>
    </head>
    <body>
        <!--        navbar-->
        <%@include file="navbar.jsp" %>
        <main class="mar-t">
            <div class="container">
                <div class="card m-2 p-2">
                    <div class="card-header bg-dark text-white text-">
                        <h3>Update Post <span class="fa fa-pencil"></span></h3>
                    </div>
                    <div class="card-body">

                        <!--create post form-->

                        <form action="UpdateAPI?id=<%= post.ID %>" method="POST" enctype="multipart/form-data">
                            <div class="form-group">
                                <label>Post Name</label>
                                <input name="PostTitle" type="text" class="form-control" id=""  value="<%= post.PostTitle%>" placeholder="Enter post name">
                            </div>

                            <div class="form-group">
                                <label>Post Description</label>
                                <input name="PostDescription" type="text" class="form-control" id="" value="<%= post.PostDescription%>" placeholder="Enter post description">
                            </div>

                            <div class="form-group">
                                <label>Post Image</label>
                                <input name="PostImage" type="file" class="form-control" >
                            </div>

                            <div class="form-group">
                                <label>Post Content</label>
                                <textarea name="PostContent" class="form-control" placeholder="Write Content" rows="5"><%= post.PostContent%>"</textarea>
                            </div>

                            <!--                            <div class="form-group">
                                                            <label>Post Code</label>
                                                            <textarea class="form-control" placeholder="Write code (if any)" rows="5"></textarea>
                                                        </div>-->

                            <div class="form-group">
                                <label>Post Category</label>
                                <select name="CatID" class="form-control">
                                    <option selcted disabled >---Select---</option>
                                    <%

                                        List<Category> category = db.GetAllCategory();
                                        if (!category.isEmpty()) {
                                            for (Category cat : category) {
                                    %>

                                    <option value="<%= cat.CatID%>"><%= cat.CatName%></option>

                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-dark btn-block">Update Post</button>
                        </form>


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
