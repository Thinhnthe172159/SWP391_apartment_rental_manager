/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.DBContext;
import dal.IncidentReportDao;
import dal.UserDao;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Date;
import model.Incident;
import model.User;

/**
 *
 * @author vumin
 */
public class AddIncidentReport extends HttpServlet {

    private IncidentReportDao incidentReportDao;

    private UserDao userDao;

    public void init() throws ServletException {
        DBContext dbContext = new DBContext();
        this.incidentReportDao = new IncidentReportDao(dbContext);
        this.userDao = new UserDao();

    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddIncidentReportServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddIncidentReportServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int tenant_id = Integer.parseInt(request.getParameter("tenantId"));
        int landlord_id = Integer.parseInt(request.getParameter("landlordId"));
        String context = request.getParameter("context");
        String image = request.getParameter("image");
        String status = request.getParameter("status");
        java.util.Date date = java.sql.Date.valueOf(request.getParameter("date"));

        try {
            User tenant = userDao.getUser(tenant_id);
            User landlord = userDao.getUser(landlord_id);

            if (tenant == null || landlord == null) {
                request.setAttribute("Error Message", "Invalid tenant or landlord ID");
                request.getRequestDispatcher("Error.jsp").forward(request, response);
                return;
            }
            Incident report = new Incident(0, tenant, landlord, context, image, status, (Date) date);

            incidentReportDao.addIncidentReport(report);
            response.sendRedirect("IncidentReport.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("Error Message","Database error ocurred while adding the incident report");
            request.getRequestDispatcher("Error.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
