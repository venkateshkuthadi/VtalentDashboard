
<%@page import="java.io.DataOutput"%>
<%@ page import="com.VtalentDashboard.dao.AttandanceDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Invalidate the session
    HttpSession session1 = request.getSession(false);
    if (session1 != null) {
        String username=(String) session1.getAttribute("username");
        if(username!=null){
        
         AttandanceDao adao=new AttandanceDao();
         adao.saveLogOutTime(username);
        }
        session1.invalidate(); // Clear the session
    }
    // Redirect to login page or home page
    response.sendRedirect("index.jsp");
%>