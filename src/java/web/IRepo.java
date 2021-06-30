/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.util.List;

/**
 *
 * @author Eslam
 */
public interface IRepo {
    
     User Login(String username,String password);
     boolean Register(User user);
     User GetUser(String byUsername);
     List<Post> GetAllPosts();
     List<Post> SearchPosts(String title);
     Post GetPost(int ID);
     int InsertPost(Post post);
     int UpdatePost(int ID,Post newPost);
     int DeletePost(int ID);
     List<Category> GetAllCategory();
     List<Post> GetAllPostbyCatID( int Id);
     int saveEnquiry(Enquiry enquiry);
     List<Enquiry> getAllEnquiry();
     int addCategory(Category cat);
     public List<Post> getRandPost();
}
