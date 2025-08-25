package com.VtalentDashboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VtalentDashboard.entity.LoginEntity;
import com.VtalentDashboard.entity.StudentEntity;
import com.VtalentDashboard.service.LoginService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public LoginServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String role=request.getParameter("userType");
		System.out.println(username+":"+password);
		
		LoginEntity L = new LoginEntity();
		L.setUsername(username);
		L.setPassword(password);
        L.setRole(role);
		 LoginService ls=new LoginService();
		StudentEntity s=ls.verifylogin(L);
		boolean output=s.getsName()!=null?true:false;
		System.out.println(s.getCourse());
		System.out.println(s.getSid());
		System.out.print(s.getsName());
		HttpSession session=request.getSession();
		session.setAttribute("student", s);
		if(output) {
			if(role.equals("student"))
			response.sendRedirect("student.jsp");
			else {
				response.sendRedirect("admin.html");	
			}
		}
		else {
			response.sendRedirect("index.jsp");
		}
		System.out.println(output);
		
		doGet(request, response);
	}

}
