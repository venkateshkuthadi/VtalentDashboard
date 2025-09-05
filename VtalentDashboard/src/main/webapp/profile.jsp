<%@ page import="java.util.ArrayList" %>
<%@ page import="com.VtalentDashboard.dao.AttandanceDao" %>
<%@ page import="com.VtalentDashboard.utils.Location" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-image: linear-gradient(to right, #a9e8b4, #465586);
            min-height: 100vh;
        }
        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 0 10px;
        }
        .profile-card {
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease;
        }
        .profile-card:hover {
            transform: translateY(-5px);
        }
        .profile-card h1 {
            color: #2c3e50;
            text-align: center;
            margin-bottom: 20px;
            font-size: 2em;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }
        .profile-item {
            display: flex;
            justify-content: space-between;
            margin: 15px 0;
            padding: 10px;
            background: #f8f9fa;
            border-radius: 8px;
            transition: background 0.3s;
        }
        .profile-item:hover {
            background: #e9ecef;
        }
        .profile-item span.label {
            font-weight: bold;
            color: #34495e;
        }
        .profile-item span.value {
            color: #7f8c8d;
            font-weight: bold;
        }
        .attendance-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: #f8f9fa;
            border-radius: 8px;
            overflow: hidden;
        }
        .attendance-table th, .attendance-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .attendance-table th {
            background: #3498db;
            color: #fff;
            font-weight: bold;
        }
        .attendance-table tr:hover {
            background: #e9ecef;
        }
        .actions {
            text-align: center;
            margin-top: 20px;
        }
        .actions a {
            text-decoration: none;
            padding: 10px 20px;
            background: #3498db;
            color: #fff;
            border-radius: 5px;
            margin: 0 5px;
            transition: background 0.3s;
        }
        .actions a:hover {
            background: #2980b9;
        }
        .timestamp {
            text-align: center;
            color: #7f8c8d;
            font-size: 0.9em;
            margin-top: 20px;
        }
        .error {
            color: #e74c3c;
            text-align: center;
            margin: 20px 0;
        }
        @media (max-width: 768px) {
            .container {
                padding: 10px;
            }
            .profile-card {
                padding: 15px;
            }
            .profile-card h1 {
                font-size: 1.5em;
            }
            .attendance-table th, .attendance-table td {
                padding: 8px;
                font-size: 0.9em;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="profile-card">
            <h1>User Profile & Attendance</h1>
            <%
                HttpSession sessionObj = request.getSession(false);
                String username = (sessionObj != null && sessionObj.getAttribute("username") != null)
                        ? (String) sessionObj.getAttribute("username") : null;

                if (username == null) {
                    response.sendRedirect("index.jsp");
                } else {
                    AttandanceDao adao = new AttandanceDao();
                    ArrayList<String[]> attendanceList = new ArrayList<>();

                    try {
                        attendanceList = adao.showAttandance(username); // check spelling of DAO method
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<p class='error'>Error fetching user data: " + e.getMessage() + "</p>");
                    }
            %>

            <h2>Attendance Records</h2>
            <%
                if (attendanceList != null && !attendanceList.isEmpty()) {
            %>
            <table class="attendance-table">
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
                        Location locationUtil = new Location();
                        for (String[] record : attendanceList) {
                            String loginTime = record[0];
                            String logoutTime = record[1];
                            String location = record[2];
                            String activeTime = record[3];

                            // Fallback for location if it's Habeeb Nagar
                            if (location != null && location.contains("Habeeb Nagar")) {
                                location = locationUtil.getLocationFromCoordinates(17.4948, 78.3996);
                            }

                            if (activeTime == null || activeTime.trim().isEmpty()) {
                                if (logoutTime != null && !"null".equals(logoutTime)) {
                                    activeTime = ((Timestamp.valueOf(logoutTime).getTime()
                                            - Timestamp.valueOf(loginTime).getTime()) / 1000 / 60) + " mins";
                                } else {
                                    activeTime = "Active";
                                }
                            }
                    %>
                    <tr>
                        <td><%= loginTime != null ? loginTime : "N/A" %></td>
                        <td><%= logoutTime != null ? logoutTime : "N/A" %></td>
                        <td><%= activeTime %></td>
                        <td><%= location != null ? location : "Unknown" %></td>
                    </tr>
                    <%
                        } // end for
                    %>
                </tbody>
            </table>
            <%
                } else {
            %>
                <p class="error">No attendance records found.</p>
            <%
                } // end else
            %>

            <div class="actions">
                <a href="index.jsp">Home</a>
                <a href="logout.jsp">Sign Out</a>
            </div>
            <div class="timestamp">Last updated: <%= new Date() %></div>

            <%
                } // end if session != null
            %>
        </div>
    </div>
</body>
</html>
