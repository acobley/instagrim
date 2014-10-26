/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.lib.Convertors;
import uk.ac.dundee.computing.aec.instagrim.models.User;
import uk.ac.dundee.computing.aec.instagrim.stores.UserProfile;
import uk.ac.dundee.computing.aec.instagrim.models.PicModel;
import uk.ac.dundee.computing.aec.instagrim.stores.CommentStore;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;

/**
 *
 * @author Shaun Smith
 */
@WebServlet(urlPatterns = {"/Comments/*"})
public class Comments extends HttpServlet {
private Cluster cluster;
    
    
public void init(ServletConfig config) throws ServletException 
    {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }
    
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
       
        String args[] = Convertors.SplitRequestPath(request);
        String imageUUID = args[2];
        
        createCommentList(imageUUID, request, response);
    
    
    }
    
    private void createCommentList(String imageUUID, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException
    {
        PicModel pm = new PicModel();
        pm.setCluster(cluster);
        java.util.LinkedList<CommentStore> commentList = pm.getComments(imageUUID);
        RequestDispatcher rd = request.getRequestDispatcher("/commentsPage.jsp");
        request.setAttribute("pic", imageUUID);
        request.setAttribute("commentList", commentList);
        rd.forward(request, response);  
    
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
            throws ServletException, IOException 
    {
        String comment = request.getParameter ("comment");
        String pUUID = request.getParameter ("picid");
        String user = request.getParameter ("user");
        System.out.println("info:----------------" + comment + pUUID + user);
        PicModel pm = new PicModel();
        pm.setCluster(cluster);
        pm.submitComment(comment, pUUID, user);
        response.sendRedirect("/Instagrim/Comments/"+pUUID);
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
