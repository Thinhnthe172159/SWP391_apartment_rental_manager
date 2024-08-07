/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package vn.fpt.edu.controller;

import vn.fpt.edu.dal.CommunityPostDao;
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
import vn.fpt.edu.model.CommunityPost;
import vn.fpt.edu.model.LikePost;
import vn.fpt.edu.model.User;

/**
 *
 * @author DuyThai
 */
@WebServlet(name = "ListCommunityPost", urlPatterns = {"/CommunityPostList"})
public class CommunityPostList extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ListCommunityPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ListCommunityPost at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CommunityPostDao cpd = new CommunityPostDao();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user_Data");

        int page = 3;

        List<LikePost> likePosts = new ArrayList<>();

        String post_id_raw = request.getParameter("post_id");
        String title = request.getParameter("title");
        String selection_raw = request.getParameter("selection");
        String page_index = request.getParameter("page_index");
        title = (title == null || title.isEmpty()) ? null : title;

        int post_id = (post_id_raw == null || post_id_raw.isEmpty()) ? 0 : Integer.parseInt(post_id_raw);
        if (request.getParameter("checkNull") != null && user != null) {
            processLike(cpd, post_id, user);
        }
        int selection = (selection_raw == null || selection_raw.isEmpty()) ? 0 : Integer.parseInt(selection_raw);
        int user_id = 0;
        if (user != null && selection == 2) {
            user_id = user.getId();
        }
        if (selection == 0) {
            user_id = 0;
        }

        int totalSize = cpd.getSizeOfListSearch(title, user_id);
        int pageIndex = (page_index == null || page_index.isEmpty()) ? 1 : Integer.parseInt(page_index);
        int pageSize = 6;
        int totalPages = (int) Math.ceil((double) totalSize / pageSize);
        List<Integer> pagelist = new ArrayList<>();
        for (int i = 1; i <= totalPages; i++) {
            pagelist.add(i);
        }
        List<CommunityPost> postList = cpd.searchCommunityPostsList(title, user_id, pageIndex, pageSize);
        likePosts = cpd.getListLIkedPost((user == null) ? 0 : user.getId());
        List<Integer> listPostIdLiked = new ArrayList<>();
        for (LikePost index : likePosts) {
            listPostIdLiked.add(index.getPost_id().getId());
        }
        request.setAttribute("selection", selection);
        request.setAttribute("title", title);
        request.setAttribute("pageList", pagelist);
        request.setAttribute("postList", postList);
        request.setAttribute("scrollToPost", post_id);
        request.setAttribute("likePost", listPostIdLiked);
        request.setAttribute("page", page);
        request.setAttribute("page_index", pageIndex);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("CommunityPostList.jsp").forward(request, response);
    }

    private void processLike(CommunityPostDao cpd, int post_id, User user) {

        LikePost likePost = cpd.chechLikePost(post_id, user.getId());
        CommunityPost cp = cpd.getCommunityPost(post_id);

        if (likePost == null) {
            LikePost newLikePost = new LikePost(0, cp, user);
            cpd.addLikePost(newLikePost);
            cp.setNum_of_like(cpd.countLikedPost(post_id));
            cpd.updatePost(cp);

        } else {
            cpd.deleteLikePost(likePost.getId(), user.getId());
            cp.setNum_of_like(cpd.countLikedPost(post_id));
            cpd.updatePost(cp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    public String getServletInfo() {
        return "Short description";

    }

}
