/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dataDAO.DataConfig;
import dataDAO.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;
import pagger.Pagger;

/**
 *
 * @author Hp-Pc
 */
public class HomeController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {
        try {
            //loat data
            ProductDAO prodb = new ProductDAO();
           
            
            request.setAttribute("active", "home");

            String proId = request.getParameter("id");
            
            if (proId != null) {
                int id = Integer.parseInt(proId);
                Product pro = prodb.getProById(id);
                request.setAttribute("item", pro);
                request.getRequestDispatcher("public/detail.jsp").forward(request, response);
            } else {
                int pageSize = DataConfig.getPageSize();
                String rawPIndex = request.getParameter("page");

                if (rawPIndex == null) {
                    rawPIndex = "1";
                }
                int pageIndex = Integer.parseInt(rawPIndex);
                int pgap = DataConfig.getPageGap();

                ArrayList<Product> arrList = prodb.getPros(pageSize, pageIndex);
                request.setAttribute("product", arrList);

                int total = prodb.getTotalPros();
                String rs = "";
                if (pageIndex <= total) {
                    rs = Pagger.generate(pageIndex, pageSize, total, "?page=", pgap);
                } else {
                    rs = "Nothing!!!";
                }

                request.setAttribute("pagger", rs);
                request.getRequestDispatcher("public/home.jsp").forward(request, response);
   
            }
        } catch (Exception ex) {
            request.getRequestDispatcher("public/error.jsp").forward(request, response);
            System.out.println("Error here!!!");
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
