package com.VtalentDashboard.controller;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VtalentDashboard.dao.AttandanceDao;
import com.VtalentDashboard.entity.LoginEntity;
import com.VtalentDashboard.entity.StudentEntity;
import com.VtalentDashboard.service.LoginService;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("pages/login.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("userType");
     
        String ipAddress = request.getHeader("X-Forwarded-For") != null ? request.getHeader("X-Forwarded-For") : request.getRemoteAddr();

        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty() || role == null || role.trim().isEmpty()) {
            request.setAttribute("errorMessage", "All fields are required.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            return;
        }

        

        LoginEntity login = new LoginEntity();
        login.setUsername(username);
        login.setPassword(password);
        login.setRole(role);

        LoginService loginService = new LoginService();
        StudentEntity student = loginService.verifylogin(login);
        boolean isAuthenticated = student != null && student.getsName() != null;

        HttpSession session = request.getSession();
        session.setAttribute("login", login);
        session.setAttribute("student", student);

        if (isAuthenticated) {
            if (role.equalsIgnoreCase("student")) {
            	System.out.println("student login..!!");
            	
                AttandanceDao attendanceDao = new AttandanceDao();
                try {
                    if (attendanceDao.hasLoggedInToday(username)) {
                    	session.setAttribute("username", username);
                         request.getRequestDispatcher("student.jsp").forward(request, response);
                    } else {
                        session.setAttribute("username", username);
                        attendanceDao.saveLogInTime(username);
                        response.sendRedirect("student.jsp");
                    }
                } catch (SQLException e) {
                    request.setAttribute("errorMessage", "Database error occurred. Please try again later.");
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("errorMessage", "An unexpected error occurred.");
                    request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
                }
            } else if (role.equalsIgnoreCase("admin")) {
            	session.setAttribute("admin", student);
            	System.out.println("admin session created...");
            	response.sendRedirect("admin.jsp");
            } else {
                request.setAttribute("errorMessage", "Invalid role specified.");
                request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Invalid username or password.");
            request.getRequestDispatcher("LoginPage.jsp").forward(request, response);
        }
    }
}