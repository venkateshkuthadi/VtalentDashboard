package com.VtalentDashboard.controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.VtalentDashboard.dao.RegistrationDao;
import com.VtalentDashboard.entity.RegistrationEntity;
import com.google.protobuf.ByteString.Output;
import com.mysql.cj.protocol.Resultset;


/**
 * Servlet implementation class RegistrationServlet
 */
//@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegistrationServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String Name = request.getParameter("username");
        String Qualification = request.getParameter("Qualification");
        String Email_id = request.getParameter("email");
        String Contact_no = request.getParameter("Contact_no");
        String yr = request.getParameter("Year");
        String Stream = request.getParameter("Stream");
        String College = request.getParameter("College");
        String Location = request.getParameter("Location");
        String Technology = request.getParameter("technology");
        String Prefered_loc = request.getParameter("Prefered_loc");
        String Password = request.getParameter("password");

        RegistrationEntity r = new RegistrationEntity();
        r.setName(Name);
        r.setQualification(Qualification);
        r.setEmail_id(Email_id);
        r.setContact_no(Contact_no);
        r.setYear(yr);
        r.setStream(Stream);
        r.setCollege(College);
        r.setLocation(Location);
        r.setTechnology(Technology);
        r.setPrefered_loc(Prefered_loc);
        r.setPassword(Password);
        String sid = request.getParameter("sid");
        System.out.println("SID: " + sid);


        RegistrationDao dao = new RegistrationDao();

        //Check uniqueness before inserting
        if (dao.isEmailExists(Email_id)) {
            response.getWriter().println("<script>alert('Email ID already exists!'); window.history.back();</script>");
        } else if (dao.isContactExists(Contact_no)) {
            response.getWriter().println("<script>alert('Contact Number already exists!'); window.history.back();</script>");
        } else {
            int result = dao.insert(r);
            if (result > 0) {
            	HttpSession session = request.getSession();
            	RegistrationEntity rs= dao.fatchdata(r);
            	System.out.println("sid  after storing.."+r.getSID());
            	session.setAttribute("user", r);
            	request.getRequestDispatcher("success.jsp").forward(request, response);

            } else {
                response.getWriter().println("<script>alert('Registration failed. Please try again.'); window.history.back();</script>");
            }
        }
    }
}