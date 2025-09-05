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
import javax.servlet.http.HttpSession;

import com.VtalentDashboard.entity.WeeklyEntity;
import com.VtalentDashboard.service.WeeklytestMappingImpl;

/**
 * Servlet implementation class python
 */
@WebServlet("/PythonServlet")
public class PythonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PythonServlet() {
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
    String studentname = request.getParameter("uname");

    WeeklytestMappingImpl Imp = new WeeklytestMappingImpl();
    
    ResultSet result = Imp.fatchpython(studentname);
    List<WeeklyEntity> data = new ArrayList<>();

    try {
        while(result.next()) {
            WeeklyEntity r1 = new WeeklyEntity();
            r1.setId(result.getString("studentid"));
            r1.setCourse(result.getString("studentcourse"));
            r1.setName(result.getString("studentname"));
            r1.setAssessment(result.getString("assessment"));
            data.add(r1);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    if (!data.isEmpty()) {
        request.setAttribute("user", data);
        System.out.print(data);
        RequestDispatcher rd = request.getRequestDispatcher("python.jsp");
        rd.forward(request, response);
    } else {
        response.getWriter().println("No records found in database.");
    }
}


}
