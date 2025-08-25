package com.VtalentDashboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VtalentDashboard.dao.FeedbackDAO;
import com.VtalentDashboard.entity.Feedback;



@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    // <-- DAO, not servlet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String course = request.getParameter("course");
        String professor = request.getParameter("professor");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String suggestion = request.getParameter("suggestion");
        FeedbackDAO dao = new FeedbackDAO(); 
        Feedback fb = new Feedback();
        
        fb.setCourse(course);
        fb.setProfessor(professor);
        fb.setRating(rating);
        fb.setSuggestion(suggestion);
        dao.saveFeedback(fb);

        // ✅ Instead of forwarding to JSP, just show Thank You message
        response.setContentType("text/html");
        response.getWriter().println("<h2>Thank you for your feedback!</h2>");
    }
}

