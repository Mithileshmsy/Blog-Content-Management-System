<%@page import="java.util.List"%>
<%@page import="web.Category"%>
<%@page import="web.DbManager"%>
<nav class="navbar navbar-expand-lg navbar-dark text-white bg-dark fixed-top">
    <div class="container p-2">
        <a class="navbar-brand" href="index.jsp">Tech Blog</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="blog.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="blog.jsp">Blog</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="aboutus.jsp">About Us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="contactus.jsp">Contact Us</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Category
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <%
                            DbManager dbm = new DbManager();
                            List<Category> category1 = dbm.GetAllCategory();
                            if (!category1.isEmpty()) {
                                for (Category cat1 : category1) {
                        %>
                        <a class="dropdown-item" href="searchcat.jsp?id=<%= cat1.CatID %>"><%= cat1.CatName %></a>
                        <%
                                }
                            }
                        %>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#Enquiry">Enquiry</a>
                </li>
            </ul>

        </div>
    </div>
</nav>