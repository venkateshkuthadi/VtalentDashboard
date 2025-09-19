<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Remove the 'admin' attribute from the session
    session.removeAttribute("admin");

    // Optionally, invalidate the whole session (uncomment if needed)
    // session.invalidate();

    // Redirect to login page or home page
    response.sendRedirect("index.jsp");
%>
