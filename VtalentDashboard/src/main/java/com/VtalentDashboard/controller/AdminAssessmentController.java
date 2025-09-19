package com.VtalentDashboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VtalentDashboard.service.WeeklytestMappingImpl;


/**
 * Servlet implementation class AdminAssessmentController
 */
@WebServlet("/AdminAssessmentController")
public class AdminAssessmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminAssessmentController() {
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
		String concept=request.getParameter("concept");
		String course=request.getParameter("course");
		String link=request.getParameter("link");
		String type=request.getParameter("type");
		System.out.println(concept+" "+course+" "+link);
		
		//sevice
		WeeklytestMappingImpl service=new WeeklytestMappingImpl();
		int result=service.addAssessment(course,concept,link,type);
		if(result>0) {
		response.sendRedirect("admin.html");
		}
		else {
			response.sendRedirect("admin.html");
		}
		doGet(request, response);
	}

}
