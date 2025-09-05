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

import com.VtalentDashboard.entity.AssessmentDto;
import com.VtalentDashboard.service.WeeklytestMappingImpl;


/**
 * Servlet implementation class AssessmentController
 */
@WebServlet("/AssessmentController")
public class AssessmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssessmentController() {
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
		String type=request.getParameter("testType");
		String course=request.getParameter("course");
		
		WeeklytestMappingImpl service= new WeeklytestMappingImpl();
		ResultSet result=service.fatchAssessmentLinks(course,type);
		
		 List<AssessmentDto> data = new ArrayList<>();
		 
		 if(course.equals("python")) {
			 try {
		            while (result.next()) {
		            	AssessmentDto r1 = new AssessmentDto();
		                r1.setId(Integer.parseInt(result.getString("id")));
		                r1.setCourse(result.getString("course"));
		                r1.setConcept(result.getString("concept"));
		                r1.setLink(result.getString("link"));
		                data.add(r1);
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }

		        if (!data.isEmpty()) {
		            request.setAttribute("user", data);
		            RequestDispatcher rd = request.getRequestDispatcher("PythonAssessmentLinks.jsp");
		            rd.forward(request, response);
		        } else {
		            response.getWriter().println("No records found in database.");
		        }
			
		 }else {
			 try {
		            while (result.next()) {
		            	AssessmentDto r1 = new AssessmentDto();
		                r1.setId(Integer.parseInt(result.getString("id")));
		                r1.setCourse(result.getString("course"));
		                r1.setConcept(result.getString("concept"));
		                r1.setLink(result.getString("link"));
		                data.add(r1);
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }

		        if (!data.isEmpty()) {
		            request.setAttribute("user", data);
		            RequestDispatcher rd = request.getRequestDispatcher("JavaAssessmentLinks.jsp");
		            rd.forward(request, response);
		        } else {
		            response.getWriter().println("No records found in database.");
		        }
			
		 }
	       
	}

}
