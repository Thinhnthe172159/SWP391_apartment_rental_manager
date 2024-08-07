/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.dal.ContractDao;
import vn.fpt.edu.model.Contract;
import vn.fpt.edu.model.User;

/**
 *
 * @author thinh
 */
@WebServlet(name = "contractList", urlPatterns = {"/contractList"})
public class contractList extends HttpServlet {

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
            out.println("<title>Servlet contractList</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet contractList at " + request.getContextPath() + "</h1>");
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
        ContractDao cd = new ContractDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");
        if (user == null) {
            response.sendRedirect("Login");
            return;
        }
        String fullName = request.getParameter("fullName");
        String tenant_id = request.getParameter("tenant_id");
        String check = request.getParameter("check");
        int checks = (check == null || check.isEmpty()) ? 0 : Integer.parseInt(check);

        if (fullName == null || fullName.isEmpty()) {
            fullName = null;
        }
        int tenaId = (tenant_id == null || tenant_id.isEmpty()) ? 0 : Integer.parseInt(tenant_id);

        List<User> listTenant = cd.listTenant(user.getId());
        List<Contract> contractList = new ArrayList<>();
        if (checks != 1) {
            contractList = cd.listContract(fullName, user.getId(), tenaId);
        }
        if (checks == 1) {
            contractList = cd.listContract(fullName, 0, tenaId);
        }

        request.setAttribute("contractList", contractList);
        request.setAttribute("listTenant", listTenant);
        request.getRequestDispatcher("contractList.jsp").forward(request, response);
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
    }

}
