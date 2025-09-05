<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.VtalentDashboard.entity.AssessmentDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <title>Weekly Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background:#f4f4f9; padding-top:20px; }
        .card-img-top { height:200px; object-fit:cover; }
    </style>
    <style>
    .container-fluid{
      background: #422ea1;
    }
    </style>
</head>
<body>
	<div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-sm-6"> <img
                    src="https://images.jdmagicbox.com/v2/comp/vijayawada/r1/0866px866.x866.230814170023.n3r1/catalogue/vtalent-gurunanak-colony-vijayawada-tutorials-h6zcacjgy9.jpg"
                    alt="vtalent" width="120">

            </div>
            <div class="col-sm-6 d-flex justify-content-end">
                <a href="Weeklytest.html" class="btn btn-warning me-2" style="margin-top: 20px;">Home</a>
                <a href="Weeklytest.html" class="btn btn-secondary " style="margin-top:20px;">Back</a>
            </div>
    
        </div>
    </div>
	<table border="1" cellpadding="5" cellspacing="0">
        <tr>
            <th>Id</th>
            <th>course</th>
            <th>concept</th>
            <th>assessmentLink</th>
        </tr>
        <%
            List<AssessmentDto> students = (List<AssessmentDto>) request.getAttribute("user");
            if (students != null && !students.isEmpty()) {
                for (AssessmentDto s : students) {
        %>
        <tr>
            <td><%= s.getId() %></td>
            <td><%= s.getCourse() %></td>
            <td><%= s.getConcept() %></td>
            <td><a href="<%= s.getLink() %>"><%= s.getLink() %></a></td>
        </tr>
        <%      }
            } else {
        %>
        <tr><td colspan="4">No records found</td></tr>
        
        <% } %>
        
    </table>
    <button onclick="location.href='search1.html'">Search result</button>
</body>
</html>