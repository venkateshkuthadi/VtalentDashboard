<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.VtalentDashboard.entity.StudentEntity" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Dashboard</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f6f9;
      margin: 0;
      padding: 20px;
    }
    header {
      background: #422ea1;
      color: #ffffff;
      padding: 20px;
    }

    .header-container {
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
    }

    .logo-box {
      position: absolute;
      left: 20px;
      background-color:#fff;
    }

    .logo {
      height: 60px;
      width: auto;
    }

    .content {
      text-align: center;
    }

    .content h1 {
      margin: 0;
      font-size: 2em;
    }

    nav {
      margin-top: 10px;
    }

    nav a {
      color: white;
      margin: 0 15px;
      text-decoration: none;
      font-weight: bold;
    }

    nav a:hover {
      text-decoration: underline;
    }

    .card-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 20px;
      max-width: 1000px;
      margin: auto;
    }

    .card {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
      text-align: center;
      transition: transform 0.2s, box-shadow 0.2s;
      cursor: pointer;
    }

    /* Hover effect only for normal cards */
    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 12px rgba(0,0,0,0.15);
    }

    /* Remove hover effect for student details */
    .student-card {
      cursor: default;
      transition: none;
      margin: 40px auto; /* spacing above and below */
    }
    .student-card:hover {
      transform: none;
      box-shadow: 0 4px 6px rgba(0,0,0,0.1);
    }

    /* Layout for student details */
    .student-info {
      display: flex;
      justify-content: space-between; /* places text left, center, right */
      margin-top: 15px;
    }

    .student-info p {
      flex: 1;
      margin: 0;
      font-weight: bold;
    }

    .student-info p:nth-child(1) {
      text-align: left;
    }
    .student-info p:nth-child(2) {
      text-align: center;
    }
    .student-info p:nth-child(3) {
      text-align: right;
    }

    /* Add margin between sections */
    .section {
      margin-top: 40px;
      margin-bottom: 40px;
    }
  </style>
</head>
<body>
  <header>
    <div class="header-container">
      <!-- Logo at left -->
      <div class="logo-box">
        <img src="https://vtalent.in/images/vtalentlogo.png" class="logo" alt="Logo" />
      </div>

      <!-- Content at center -->
      <div class="content">
        <h1>Student Dashboard</h1>
        <nav>
          <a href="#">Home</a>
          <a href="Coursespage.html">Courses</a>
          <a href="Studentcontactpage.html">Contact</a>
          <a href = "logout.jsp">Logout</a>
        </nav>
      </div>
    </div>
  </header>

  <!-- Student Details Card with spacing -->
  
    <div class="card student-card">
      <h2>Student Details</h2>
      <div class="student-info">
      <%
		  StudentEntity student = (StudentEntity) session.getAttribute("student");
		  if (student != null) {
		%>
		    <p>Name: <%= student.getsName() %></p>
		    <p>ID: <%= student.getSid() %></p>
		    <p>Course: <%= student.getCourse() %></p>
		<%
		  }
		%>
      
       
      </div>
    </div>
  

  <!-- Other Cards with spacing -->
  <div class="card-container section">
    <div class="card"><a href="Weeklytest.html">
      <h2>Assessments</h2>
      <p>Check quizzes, tests, and assignments.</p>
      </a>
    </div>

    <div class="card">
    	<a href="profile.jsp">
      <h2>Attendance</h2>
      <p>Track class attendance and records.</p>
      </a>
    </div>

    <div class="card"><a href="practicehome.html">
      <h2>Sample Programs</h2>
      <p>View and practice programming examples.</p>
      </a>
    </div>

    <div class="card">
      <h2>Resources</h2>
      <p>Extra study materials and guides.</p>
    </div>
    <div class="card">
  <h2>Resume</h2>
  <p>Upload and manage your resume.</p>
</div>
  </div>

</body>
</html>