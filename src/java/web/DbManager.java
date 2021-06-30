/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eslam
 */
public class DbManager implements IRepo {

    Connection con;

    public DbManager() {

    }

    @Override
    public User Login(String email, String password) {
        User user = null;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("SELECT * FROM Users WHERE Email=? AND Password=?");
            sql.setString(1, email);
            sql.setString(2, password);

            ResultSet res = sql.executeQuery();
            if (res.next()) {
                user = new User();
                user.setID(res.getInt("ID"));
                user.setUsername(res.getString("Username"));
                user.setEmail(res.getString("Email"));
                user.setPassword(res.getString("Password"));
                user.setIsActive(res.getBoolean("IsActive"));
                user.setIsAdmin(res.getBoolean("IsAdmin"));
                user.setLastLogin(res.getString("LastLogin"));
                user.setGender(res.getString("Gender"));
                user.setAbout(res.getString("About"));
                user.setRegDate(res.getTimestamp("RegDate"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public boolean Register(User user) {
        boolean f = false;
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("INSERT INTO users(Username,Email,Password,IsAdmin,LastLogin,IsActive,Gender,About) VALUES(?,?,?,?,?,?,?,?)");
            sql.setString(1, user.Username);
            sql.setString(2, user.Email);
            sql.setString(3, user.Password);
            sql.setBoolean(4, user.IsAdmin);
            sql.setString(5, user.LastLogin);
            sql.setBoolean(6, user.IsActive);
            sql.setString(7, user.Gender);
            sql.setString(8, user.About);

            sql.execute();

            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

    @Override
    public User GetUser(String byUsername) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            User user = new User();

            PreparedStatement sql = con.prepareStatement("SELECT * FROM Users WHERE Username=?");
            sql.setString(1, byUsername);

            ResultSet res = sql.executeQuery();
            res.next();

            user.ID = res.getInt(1);
            user.Username = res.getString(2);
            user.Email = res.getString(3);
            user.Password = res.getString(4);
            user.IsAdmin = res.getBoolean(5);
            user.LastLogin = res.getString(6);
            user.IsActive = res.getBoolean(7);

            return user;

        } catch (SQLException ex) {
            Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, "ex happened !!!", ex);
            return null;
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (Exception ex) {
            Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, ex.getMessage(), ex);
            return null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DbManager.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public List<Post> GetAllPosts() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post;
            List<Post> posts = new ArrayList<Post>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Posts ORDER BY ID DESC");

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                post = new Post();
                post.ID = res.getInt(1);
                post.PostTitle = res.getString(2);
                post.PostContent = res.getString(3);
                post.PostDescription = res.getString(4);
                post.PostImage = res.getString(5);
                post.PublishDate = res.getTimestamp(6);
                post.PostAuthor = res.getString(7);
                post.IsVisiable = res.getBoolean(8);
                post.AllowComments = res.getBoolean(9);
                post.CatID = res.getInt(10);
                posts.add(post);
            }
            return posts;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public Post GetPost(int ID) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post = new Post();

            PreparedStatement sql = con.prepareStatement("SELECT * FROM Posts WHERE ID=?");
            sql.setInt(1, ID);

            ResultSet res = sql.executeQuery();
            res.next();

            post.ID = res.getInt(1);
            post.PostTitle = res.getString(2);
            post.PostContent = res.getString(3);
            post.PostDescription = res.getString(4);
            post.PostImage = res.getString(5);
            post.PublishDate = res.getTimestamp(6);
            post.PostAuthor = res.getString(7);
            post.IsVisiable = res.getBoolean(8);
            post.AllowComments = res.getBoolean(9);
            post.CatID = res.getInt(10);

            return post;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public int UpdatePost(int ID, Post newPost) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("UPDATE Posts SET PostTitle=?,PostContent=?,PostDescription=?,PostImage=?,CatID=? WHERE ID=?");

            sql.setString(1, newPost.PostTitle);
            sql.setString(2, newPost.PostContent);
            sql.setString(3, newPost.PostDescription);
            sql.setString(4, newPost.PostImage);
            sql.setInt(5, newPost.CatID);

            sql.setInt(6, ID);

            sql.executeUpdate();

            return 1;

        } catch (Exception ex) {
            ex.printStackTrace();;
        }
        return 0;
    }

    @Override
    public int DeletePost(int ID) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post = new Post();

            PreparedStatement sql = con.prepareStatement("DELETE FROM Posts WHERE ID=?");
            sql.setInt(1, ID);

            sql.execute();

            return 1;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Post> SearchPosts(String title) {

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post;
            List<Post> posts = new ArrayList<Post>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Posts WHERE PostTitle LIKE '%" + title + "%' ORDER BY ID DESC");

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                post = new Post();
                post.ID = res.getInt(1);
                post.PostTitle = res.getString(2);
                post.PostContent = res.getString(3);
                post.PostDescription = res.getString(4);
                post.PostImage = res.getString(5);
                post.PublishDate = res.getTimestamp(6);
                post.PostAuthor = res.getString(7);
                post.IsVisiable = res.getBoolean(8);
                post.AllowComments = res.getBoolean(9);
                post.CatID = res.getInt(10);
                posts.add(post);
            }
            return posts;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public int InsertPost(Post post) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("INSERT INTO posts(PostTitle,PostContent,PostDescription,PostImage,PostAuthor,IsVisiable,AllowComments,CatID) VALUES(?,?,?,?,?,?,?,?)");
            sql.setString(1, post.PostTitle);
            sql.setString(2, post.PostContent);
            sql.setString(3, post.PostDescription);
            sql.setString(4, post.PostImage);

            sql.setString(5, post.PostAuthor);
            sql.setBoolean(6, post.IsVisiable);
            sql.setBoolean(7, post.AllowComments);
            sql.setInt(8, post.CatID);

            sql.executeUpdate();

            return 1;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return 0;

    }

    @Override
    public List<Category> GetAllCategory() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Category cat;
            List<Category> category = new ArrayList<Category>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Category");

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                cat = new Category();
                cat.CatID = res.getInt(1);
                cat.CatName = res.getString(2);
                cat.CatDescription = res.getString(3);
                category.add(cat);

            }
            return category;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public List<Post> GetAllPostbyCatID(int Id) {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post;
            List<Post> posts = new ArrayList<Post>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Posts WHERE CatID = ? ORDER BY ID DESC");
            sql.setInt(1, Id);

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                post = new Post();
                post.ID = res.getInt(1);
                post.PostTitle = res.getString(2);
                post.PostContent = res.getString(3);
                post.PostDescription = res.getString(4);
                post.PostImage = res.getString(5);
                post.PublishDate = res.getTimestamp(6);
                post.PostAuthor = res.getString(7);
                post.IsVisiable = res.getBoolean(8);
                post.AllowComments = res.getBoolean(9);
                post.CatID = res.getInt(10);
                posts.add(post);
            }
            return posts;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public int addCategory(Category cat) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("INSERT INTO Category(CatName,CatDescription) values(?,?)");
            sql.setString(1, cat.CatName);
            sql.setString(2, cat.CatDescription);

            sql.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
        
    }

    @Override
    public int saveEnquiry(Enquiry enquiry) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            PreparedStatement sql = con.prepareStatement("INSERT INTO enquiry(Name,Email,Question) values(?,?,?)");
            sql.setString(1, enquiry.Name);
            sql.setString(2, enquiry.Email);
            sql.setString(3, enquiry.Question);

            sql.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public List<Enquiry> getAllEnquiry() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Enquiry enq;
            List<Enquiry> enquiry = new ArrayList<Enquiry>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Enquiry ORDER BY EnquiryId DESC");

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                enq = new Enquiry();
                enq.EnquiryId = res.getInt(1);
                enq.Name = res.getString(2);
                enq.Email = res.getString(3);
                enq.Question = res.getString(4);
                enq.EnquiryDate = res.getTimestamp(5);
                enquiry.add(enq);

            }
            return enquiry;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
    @Override
     public List<Post> getRandPost() {
        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog2", "root", "root");

            Post post;
            List<Post> posts = new ArrayList<Post>();
            PreparedStatement sql = con.prepareStatement("SELECT * FROM Posts ORDER BY RAND() LIMIT 3");

            ResultSet res = sql.executeQuery();
            while (res.next()) {
                post = new Post();
                post.ID = res.getInt(1);
                post.PostTitle = res.getString(2);
                post.PostContent = res.getString(3);
                post.PostDescription = res.getString(4);
                post.PostImage = res.getString(5);
                post.PublishDate = res.getTimestamp(6);
                post.PostAuthor = res.getString(7);
                post.IsVisiable = res.getBoolean(8);
                post.AllowComments = res.getBoolean(9);
                post.CatID = res.getInt(10);
                posts.add(post);
            }
            return posts;

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

}
