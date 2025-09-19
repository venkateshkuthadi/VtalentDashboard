<%@page import="java.util.ArrayList"%>
<%@ page import="com.VtalentDashboard.dao.AttandanceDao" %>
<%@ page import="com.VtalentDashboard.utils.Location" %>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - User Attendance</title>
    <style>
        body { font-family: Arial, sans-serif; background: #eef2f7; }
        .container { max-width: 900px; margin: 30px auto; background: #fff; padding: 20px; border-radius: 10px; }
        h1 { text-align: center; color: #333; }
        form { text-align: center; margin-bottom: 20px; }
        input[type=text] { padding: 8px; width: 250px; border: 1px solid #ccc; border-radius: 5px; }
        button { padding: 8px 15px; background: #3498db; border: none; color: #fff; border-radius: 5px; cursor: pointer; }
        button:hover { background: #2980b9; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 10px; border: 1px solid #ddd; text-align: left; }
        th { background: #3498db; color: #fff; }
        tr:hover { background: #f1f1f1; }
        .error { color: red; text-align: center; }
        header {
      background: #422ea1;   /* ✅ Updated background color */
      color: #ffffff;        /* ✅ White text for better contrast */
      padding: 20px 40px;
      display: flex;
      align-items: center;
      justify-content: space-between;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .logo {
      height: 60px;
      width: auto;
    }

    nav a {
      color: #fff;  /* ✅ Changed to white for visibility */
      margin-left: 20px;
      text-decoration: none;
      font-weight: bold;
    }

    nav a:hover {
      text-decoration: underline;
    }
    </style>
</head>
<body>
<header>
    <div class="logo-box">
      <!-- Replace this with your actual relative image path -->
      <img src="images/logo.jpg.jpg" class="logo" alt="Logo" />
    </div>
    <nav>
      <a href="admin.html">Home</a>
      <a href="admin.html">Back</a>
      
    </nav>
  </header>
<div class="container">
    <h1>Admin - Search User Attendance</h1>

    <!-- Search Form -->
    <form method="post">
        <input type="text" name="searchUser" placeholder="Enter username or SID..." required />
        <button type="submit">Search</button>
    </form>

    <%
        String searchUser = request.getParameter("searchUser");
        if (searchUser != null && !searchUser.trim().isEmpty()) {
            AttandanceDao adao = new AttandanceDao();
            ArrayList<String[]> attendanceList = null;

            try {
                // 🔹 Check if input is a number (SID) or text (username)
                boolean isNumeric = searchUser.matches("\\d+");

                if (isNumeric) {
                    int sid = Integer.parseInt(searchUser);
                    attendanceList = adao.showAttandanceBySID(sid);
                } else {
                    attendanceList = adao.showAttandance(searchUser);
                }

            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p class='error'>Error fetching data: " + e.getMessage() + "</p>");
            }

            if (attendanceList != null && !attendanceList.isEmpty()) {
    %>
                <h2>Attendance Records for <%= searchUser %></h2>
                <table>
                    <thead>
                        <tr>
                        	<th>Name</th>
                            <th>Login Time</th>
                            <th>Logout Time</th>
                            <th>Active Time</th>
                            <th>Location</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        for (String[] record : attendanceList) {
							String name=record[0];
                            String loginTime = record[1];
                            String logoutTime = record[2];
                            String location = record[3];
                            String activeTime = record[4];

                            if (activeTime == null || activeTime.trim().isEmpty()) {
                                activeTime = (logoutTime != null && !"null".equals(logoutTime)) 
                                    ? ((Timestamp.valueOf(logoutTime).getTime() - Timestamp.valueOf(loginTime).getTime()) / 1000 / 60 + " mins") 
                                    : "Active";
                            }
                    %>
                        <tr>
                        	<td><%= name %></td>
                            <td><%= loginTime %></td>
                            <td><%= (logoutTime != null ? logoutTime : "Active") %></td>
                            <td><%= activeTime %></td>
                            <td><%= (location != null ? location : "Unknown") %></td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
    <%
            } else {
                out.println("<p class='error'>No records found for: " + searchUser + "</p>");
            }
        }
    %>
</div>
</body>
</html>