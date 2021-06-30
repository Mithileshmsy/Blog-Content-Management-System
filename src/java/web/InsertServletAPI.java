/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author clickman
 */
@MultipartConfig
public class InsertServletAPI extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InsertServletAPI</title>");            
            out.println("</head>");
            out.println("<body>");
            
             DbManager db = new DbManager();
            Post newPost = new Post();
            HttpSession s = request.getSession();
            User user =(User) s.getAttribute("currentUser");

            newPost.PostTitle = request.getParameter("PostTitle");
            newPost.PostDescription = request.getParameter("PostDescription");
            
            newPost.PostContent = request.getParameter("PostContent");
            newPost.PostAuthor = user.getUsername();
            newPost.CatID = Integer.parseInt(request.getParameter("CatID"));
            
            Part part=request.getPart("PostImage");
            newPost.PostImage = part.getSubmittedFileName();

            if (db.InsertPost(newPost) == 1) {
                
                String path=request.getRealPath("/")+"PostImage"+File.separator+newPost.PostImage;
                if(Helper.saveFile(part.getInputStream(), path)){
                    
                    out.println("<script>alert('Post Saved Successfully');window.location.href='blog.jsp';</script>");

                }else{
                out.println("<script>alert('Error Ocurred while Saving Post Image');window.location.href='newpost.jsp';</script>");
                }
                
            } else {
               out.println("<script>alert('Post not Saved !');window.location.href='newpost.jsp';</script>");
            }
            
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
