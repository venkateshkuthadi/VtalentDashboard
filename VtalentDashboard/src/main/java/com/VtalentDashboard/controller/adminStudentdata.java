package com.VtalentDashboard.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VtalentDashboard.entity.RegistrationEntity;
import com.VtalentDashboard.service.RegistrationMappingImpl;

/**
 * Servlet implementation class adminStudentdata
 */
@WebServlet("/adminStudentdata")
public class adminStudentdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public adminStudentdata() {
        super();
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
		RegistrationMappingImpl service=new RegistrationMappingImpl();
    	System.out.println("servlet");
		List<RegistrationEntity> result=service.fatchrecords();
		
		if (!result.isEmpty()) {
	            request.setAttribute("user", result);
	            RequestDispatcher rd = request.getRequestDispatcher("view-students(admin).jsp");
	            rd.forward(request, response);
	        } else {
	            response.getWriter().println("No records found in database.");
	        }
		 
		//doGet(request, response);
	}

}
