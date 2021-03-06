/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import entities.Seller;
import entities.SellerFacadeLocal;
import entities.Users;
import entities.UsersFacadeLocal;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nth15
 */
public class editSellerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @EJB
    private SellerFacadeLocal sellerFacadeLocal;
    
    @EJB
    private UsersFacadeLocal usersFacadeLocal;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        Users user = (Users) request.getSession().getAttribute("user");
        switch (action) {
            case "updateSellerProfile":
                Seller seller = sellerFacadeLocal.find(user.getUserId());
                seller.setStoreName(request.getParameter("txtStoreName"));
                seller.setIdentityCard(request.getParameter("txtIdentityCard"));
                seller.setApprovedDate(request.getParameter("txtApprovedDate"));
                seller.setApprovedPlace(request.getParameter("txtApprovedPlace"));
                seller.setStoreAddress(request.getParameter("txtStoreAddress"));
                seller.setStoreSummary(request.getParameter("txtStoreSummary"));
                sellerFacadeLocal.edit(seller);
                
                Users users = usersFacadeLocal.find(user.getUserId());
                users.setEmail(request.getParameter("txtEmail"));
                users.setFullname(request.getParameter("txtName"));
                users.setPhone(request.getParameter("txtPhone"));
                usersFacadeLocal.edit(users);
                request.getRequestDispatcher("viewServlet?action=homeSeller").forward(request, response);
                
                break;
            default:
                request.setAttribute("error", "Page not found");
                request.getRequestDispatcher("error.jsp").forward(request, response);
                break;
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
