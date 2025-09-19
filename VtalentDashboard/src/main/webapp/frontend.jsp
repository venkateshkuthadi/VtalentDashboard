<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String homeLink = "index.jsp"; 
	String contactPage="contact.html";
	String courses="courses.html";// default home link
    if (session.getAttribute("student") != null) {
        homeLink = "student.jsp";
        contactPage="Studentcontactpage.html";
        courses="CoursesPage.html";
    }
%>

<!-- The content below won't be displayed due to redirect logic above -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Python Course Content</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      background: #f4f6f8;
      color: #333;
    }

    header {
      background: #422ea1;
      color: #ffffff;
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
      color: #fff;
      margin-left: 20px;
      text-decoration: none;
      font-weight: bold;
    }

    nav a:hover {
      text-decoration: underline;
    }

    .course-title {
      text-align: center;
      margin-top: 20px;
    }

    .course-title h1 {
      font-size: 2.5em;
      color: #333;
      margin: 0;
      text-decoration: underline;
    }

    .container {
      display: flex;
      justify-content: center;
      padding: 40px;
    }

    .box {
      background: #fff;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
      width: 70%;
      max-width: 900px;
    }

    h2 {
      margin-top: 25px;
      color: #2c3e50;
      border-bottom: 2px solid #422ea1;
      padding-bottom: 6px;
    }

    ul {
      margin-left: 20px;
      line-height: 1.7;
    }

    li {
      margin-bottom: 6px;
    }
  </style>
</head>
<body>

  <header>
    <div class="logo-box">
      <img src="images/logo.jpg.jpg" class="logo" alt="Logo" />
    </div>
    <nav>
      <a href="<%= homeLink %>">Home</a>
      <a href="<%= courses %>">Courses</a>
      <a href="<%= contactPage %>">Contact</a>
    </nav>
  </header>

  <div class="course-title">
    <h1>Course Content</h1>
  </div>

  <div class="container">
    <div class="box">
      <h2>Frontend</h2>
      <ul>
        <li>HTML + CSS + SCSS + JavaScript</li>
        <li>Angular Basics</li>
        <li>Angular to Backend Connectivity</li>
        <li>React Basics</li>
      </ul>
    </div>
  </div>
</body>
</html>
