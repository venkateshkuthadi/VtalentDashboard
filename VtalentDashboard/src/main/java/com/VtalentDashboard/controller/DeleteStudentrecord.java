package com.VtalentDashboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VtalentDashboard.dao.RegistrationDao;

/**
 * Servlet implementation class DeleteStudentrecord
 */
@WebServlet("/DeleteStudentrecord")
public class DeleteStudentrecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentrecord() {
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
		int  sid=Integer.parseInt(request.getParameter("sid"));
		RegistrationDao dao=new RegistrationDao();
		dao.deleterecord(sid);
		request.getRequestDispatcher("/adminStudentdata").forward(request, response);
		//doGet(request, response);
	}

}
