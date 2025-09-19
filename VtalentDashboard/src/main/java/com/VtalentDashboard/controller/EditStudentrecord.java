package com.VtalentDashboard.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VtalentDashboard.dao.RegistrationDao;
import com.VtalentDashboard.entity.RegistrationEntity;
import com.mysql.cj.Session;

/**
 * Servlet implementation class EditStudentrecord
 */
@WebServlet("/EditStudentrecord")
public class EditStudentrecord extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditStudentrecord() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int sid=Integer.parseInt(request.getParameter("sid"));
		RegistrationDao dao=new RegistrationDao();
		RegistrationEntity result=dao.fatchrecord(sid);
		HttpSession session = request.getSession();
        session.setAttribute("editStu", result);
        System.out.print("result:"+result);
		request.getRequestDispatcher("editStudent.jsp").forward(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int sid = Integer.parseInt(request.getParameter("sid"));
        String name = request.getParameter("username");
        String qualification = request.getParameter("Qualification");
        String email = request.getParameter("email");
        String contactNo = request.getParameter("Contact_no");
        String year = request.getParameter("Year");
        String stream = request.getParameter("Stream");
        String college = request.getParameter("College");
        String location = request.getParameter("Location");
        String preferredLoc = request.getParameter("Prefered_loc");

        // Create entity and update values
        RegistrationEntity updatedEntity = new RegistrationEntity();
        updatedEntity.setSID(sid);
        updatedEntity.setName(name);
        updatedEntity.setQualification(qualification);
        updatedEntity.setEmail_id(email);
        updatedEntity.setContact_no(contactNo);
        updatedEntity.setYear(year);
        updatedEntity.setStream(stream);
        updatedEntity.setCollege(college);
        updatedEntity.setLocation(location);
        updatedEntity.setPrefered_loc(preferredLoc);
        System.out.println("name:"+name+" , Contact_no"+contactNo);
        
        RegistrationDao dao = new RegistrationDao();
        dao.updateStudentRecord(updatedEntity);
		//doGet(request, response);
        request.getRequestDispatcher("/adminStudentdata").forward(request, response);
        //response.sendRedirect("adminStudentdata");
	}

}
