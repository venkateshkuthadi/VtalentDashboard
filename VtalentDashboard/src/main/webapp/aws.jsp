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

      <h2>Version Control</h2>
      <ul>
        <li>Git – Basics & Commands</li>
        <li>GitHub – Repositories, Branching, Pull Requests</li>
        <li>Collaboration with GitHub</li>
      </ul>

      <h2>AWS Basics</h2>
      <ul>
        <li>Introduction to Cloud Computing</li>
        <li>AWS Account Setup</li>
        <li>EC2 – Elastic Compute Cloud</li>
        <li>S3 – Simple Storage Service</li>
        <li>IAM – Identity & Access Management</li>
        <li>RDS – Relational Database Service</li>
      </ul>

      <h2>AWS Advanced</h2>
      <ul>
        <li>VPC – Virtual Private Cloud</li>
        <li>Elastic Load Balancer (ELB)</li>
        <li>Auto Scaling</li>
        <li>CloudFront & Route 53</li>
        <li>Lambda & Serverless Functions</li>
        <li>Monitoring with CloudWatch</li>
      </ul>

      <h2>Cloud Development</h2>
      <ul>
        <li>Cloud Architecture Principles</li>
        <li>Developing Applications on AWS</li>
        <li>Integration with Databases & APIs</li>
        <li>Security Best Practices</li>
      </ul>

      <h2>Pipeline Structure (CI/CD)</h2>
      <ul>
        <li>Introduction to DevOps</li>
        <li>CI/CD Pipelines Overview</li>
        <li>CodeCommit, CodeBuild, CodeDeploy, CodePipeline</li>
        <li>Automated Testing & Deployment</li>
        <li>End-to-End Pipeline Implementation</li>
      </ul>

    </div>
  </div>

</body>
</html>
