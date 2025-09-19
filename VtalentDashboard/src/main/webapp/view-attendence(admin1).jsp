<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="com.VtalentDashboard.dao.AttandanceDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin - Search User Attendance</title>
</head>
<body>
<div class="container">
    <h1>Admin - Search User Attendance</h1>
    <form method="post">
        <input type="text" name="searchUser" placeholder="Enter username or SID..." required />
        <button type="submit">Search</button>
    </form>
<%
    String searchUser = request.getParameter("searchUser");
	AttandanceDao adao=new AttandanceDao();
    if (searchUser != null && !searchUser.trim().isEmpty()) {
        ArrayList<String[]> attendanceList = null;

        try {
            boolean isNumeric = searchUser.matches("\\d+");
            if (isNumeric) {
            	
                attendanceList = adao.showAttandanceBySID(Integer.parseInt(searchUser));
            } else {
                 attendanceList = adao.showAttandance(searchUser);
            }
        } catch (Exception e) {
            out.println("<p class='error'>Error fetching data: " + e.getMessage() + "</p>");
        }

        request.setAttribute("searchUser", searchUser);

        if (attendanceList != null && !attendanceList.isEmpty()) {
%>
    <h2>Attendance Records for <c:out value="${searchUser}" /></h2>
    <table border="1">
        <thead>
            <tr>
                <th>Login Time</th>
                <th>Logout Time</th>
                <th>Active Time</th>
                <th>Location</th>
            </tr>
        </thead>
        <tbody>
<%
            for (String[] record : attendanceList) {
                String loginTime = record.length > 0 ? record[0] : null;
                String logoutTime = record.length > 21 ? record[21] : null;
                String location = record.length > 22 ? record[22] : null;
                String activeTime = record.length > 23 ? record[23] : null;

                if ((activeTime == null || activeTime.trim().isEmpty())
                        && loginTime != null && logoutTime != null
                        && !"null".equals(logoutTime) && !"null".equals(loginTime)) {
                    try {
                        long ms = Timestamp.valueOf(logoutTime).getTime()
                                  - Timestamp.valueOf(loginTime).getTime();
                        activeTime = (ms / 1000 / 60) + " mins";
                    } catch (Exception ex) {
                        activeTime = "Active";
                    }
                }
%>
            <tr>
                <td><%= loginTime != null ? loginTime : "Unknown" %></td>
                <td><%= (logoutTime != null && !"null".equals(logoutTime)) ? logoutTime : "Active" %></td>
                <td><%= activeTime != null ? activeTime : "Active" %></td>
                <td><%= location != null ? location : "Unknown" %></td>
            </tr>
<%
            }
%>
        </tbody>
    </table>
<%
        } else {
%>
            <p class='error'>No records found for: <c:out value="${searchUser}" /></p>
<%
        }
    }
%>
</div>
</body>
</html>
