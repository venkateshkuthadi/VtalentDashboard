<%@ page import="java.util.*, com.VtalentDashboard.entity.WeeklyEntity" %>
<html>
<head>
    <title>WeeklyTest</title>
    
    
</head>
<body>
	
    <h2>WeeklyTest</h2>
    <table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>studentId</th>
            <th>studentName</th>
            <th>studentCourse</th>
            <th>assessment</th>
        </tr>
        <%
            List<WeeklyEntity> students = (List<WeeklyEntity>) request.getAttribute("user");
            if (students != null && !students.isEmpty()) {
                for (WeeklyEntity s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getCourse() %></td>
            <td><%= s.getAssessment() %></td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="4">No records found</td></tr>
        <% } %>
    </table>
</body>
</html>
