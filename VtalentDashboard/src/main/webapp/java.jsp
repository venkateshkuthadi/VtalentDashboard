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
      <h2>Java Basics</h2>
      <ul>
        <li>Installations / Eclipse Usage</li>
        <li>Class, static & non-static</li>
        <li>Return types & constructors</li>
        <li>new keyword functionality</li>
        <li>This keyword</li>
        <li>System.out.println()</li>
        <li>Nested Object creation</li>
        <li>Strings</li>
        <li>Arrays</li>                                                                                                                                      
      </ul>

      <h2>OOP Concepts</h2>
      <ul>
        <li>Encapsulation</li>
        <li>Inheritance</li>
        <li>Polymorphism</li>
        <li>Abstraction</li>
        <li>Purpose of Interface</li>
        <li>Implementation / Extends</li>
      </ul>

      <h2>Exceptions & Threads</h2>
      <ul>
        <li>Exception Handling Fundamentals</li>
        <li>Types of Exceptions</li>
        <li>try-catch blocks</li>
        <li>throw and throws keywords</li>
        <li>Command line arguments</li>
        <li>Multi-Threading</li>
      </ul>

      <h2>Collections</h2>
      <ul>
        <li>List interface & classes</li>
        <li>Set interface & classes</li>
        <li>Queue</li>
        <li>Map interface & classes</li>
      </ul>

      <h2>JDBC & Servlets</h2>
      <ul>
        <li>JDBC Operations</li>
        <li>SQL Connection & Execution</li>
        <li>Servlets & Lifecycle</li>
        <li>Request & Response Handling</li>
        <li>Sessions</li>
        <li>JSP Implicit Objects</li>
        <li>Serialization & Deserialization</li>
        <li>Inner Classes</li>
      </ul>

      <h2>Spring & Microservices</h2>
      <ul>
        <li>Spring IOC</li>
        <li>Spring JDBC</li>
        <li>Spring MVC</li>
        <li>Spring Boot</li>
        <li>Microservices (Architecture & Advantages)</li>
      </ul>

      <h2>SQL</h2>
      <ul>
        <li>Database Basics</li>
        <li>SQL Queries</li>
        <li>Joins</li>
        <li>DDL Commands</li>
      </ul>
    </div>
  </div>


</body>
</html>
