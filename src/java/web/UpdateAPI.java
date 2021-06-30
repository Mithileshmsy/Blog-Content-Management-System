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
import javax.servlet.http.Part;

/**
 *
 * @author Eslam
 */
@MultipartConfig
public class UpdateAPI extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        try {


            int id = Integer.parseInt(request.getParameter("id"));
            DbManager db = new DbManager();
            Post newPost = new Post();

            newPost.PostTitle = request.getParameter("PostTitle");
            newPost.PostDescription = request.getParameter("PostDescription");
            
            newPost.PostContent = request.getParameter("PostContent");
            newPost.CatID = Integer.parseInt(request.getParameter("CatID"));
            
            Part part=request.getPart("PostImage");
            newPost.PostImage = part.getSubmittedFileName();
            
            
            if (db.UpdatePost(id, newPost) == 1) {
                String path=request.getRealPath("/")+"PostImage"+File.separator+newPost.PostImage;
                if(Helper.saveFile(part.getInputStream(), path)){
                    
                    out.println("<script>alert('Post Updated Successfully');window.location.href='blog.jsp';</script>");

                }else{
                out.println("<script>alert('Error Ocurred while Updating Post Image');window.location.href='newpost.jsp';</script>");
                }
            } else {
                out.println("<script>alert('Post not Update !');window.location.href='newpost.jsp';</script>");
            }

        }catch(Exception ex){
       
            ex.printStackTrace();
        } finally {
            out.close();
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
