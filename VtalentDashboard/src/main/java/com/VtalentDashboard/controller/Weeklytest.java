//package com.Weeklytest.controller;
//
//import java.io.IOException;
//
//import com.Weeklytest.bean.*;
//import com.Weeklytest.dao.*;
//import com.Weeklytest.service.WeeklytestMappingImpl;
//import com.Weeklytest.*;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
///**
// * Servlet implementation class RegistrationServlet
// */
//@WebServlet("/Weeklytest Servlet")
//public class Weeklytest extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//	private static final String Contact_No = null;
//
//    /**
//     * Default constructor. 
//     */
//    public Weeklytest() {
//        // TODO Auto-generated constructor stub
//    	super();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//	
//		
//        String Name = request.getParameter("Name");
//        
//       
//        
//        
//        String Mobileno = request.getParameter("Mobileno");
//       
//
//        String ID= request.getParameter("ID");
//        int id1 = 0;
//        id1=Integer.parseInt(ID);
//
//        
//        
//
//      
//        WeeklyEntity r = new WeeklyEntity();
//        r.setName(Name);
//   
//        r.setID(ID);
//        r.setMobileno(Mobileno);  
//        
//
//       
//         WeeklytestMappingImpl Imp = new WeeklytestMappingImpl();
//        int result = Imp.insert(r);
//
//        if (result > 0) {
//            response.getWriter().println("Registration successful!");
//        } else {
//            response.getWriter().println("Registration failed. Please try again.");
//        }
//    }
//}
//package com;

