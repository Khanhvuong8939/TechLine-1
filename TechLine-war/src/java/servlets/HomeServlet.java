/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlets;


import entities.Categories;
import entities.CategoriesFacadeLocal;
import entities.Products;
import entities.ProductsFacadeLocal;

import java.io.IOException;

import java.util.List;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.TechLineUtils;


public class HomeServlet extends HttpServlet {
    @EJB
    private CategoriesFacadeLocal categoriesFacade;
    @EJB
    private ProductsFacadeLocal productsFacade;

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
            List<Products> listProduct;
            listProduct = productsFacade.getListProductByDatePost();
            if (listProduct != null) {
                request.setAttribute("ListProductByDatePost1", TechLineUtils.buidProductIndexModel(listProduct.subList(0, 4)));
                request.setAttribute("ListProductByDatePost2", TechLineUtils.buidProductIndexModel(listProduct.subList(5, 9)));
            }
            listProduct = productsFacade.getListProductByDiscount();
            if (listProduct != null) {
                request.setAttribute("ListProductByDiscount1", TechLineUtils.buidProductIndexModel(listProduct.subList(0, 4)));
                request.setAttribute("ListProductByDiscount1", TechLineUtils.buidProductIndexModel(listProduct.subList(5, 9)));
            }
            List<Categories> listCategorieses = categoriesFacade.findAll();
            if (listCategorieses != null) {
                request.setAttribute("listCategories", categoriesFacade.findAll());
            }
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
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
