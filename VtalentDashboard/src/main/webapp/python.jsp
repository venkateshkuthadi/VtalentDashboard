<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String homeLink = "index.jsp"; 
	String contactPage="contact.html";
	String courses="courses.html";// default home link
    if (session.getAttribute("student") != null) {
        homeLink = "student.jsp";
        contactPage="Studentcontactpage.html";
        courses="Coursespage.html";
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
      <h2>Python Basics</h2>
      <ul>
        <li>What is Python and its Uses</li>
        <li>Compiler vs Interpreter</li>
        <li>Why Python is a scripting language</li>
        <li>Syntax & Running Programs</li>
        <li>Comments, Print & Input</li>
        <li>Variables, Constants, Literals</li>
        <li>Keywords & Identifiers</li>
        <li>Data Types & Type Conversion</li>
      </ul>

      <h2>Operators</h2>
      <ul>
        <li>Arithmetic Operators</li>
        <li>Assignment Operators</li>
        <li>Comparison Operators</li>
        <li>Logical Operators</li>
        <li>Bitwise Operators</li>
        <li>Membership Operators</li>
        <li>Identity Operators</li>
        <li>Operator Precedence</li>
      </ul>

      <h2>Control Flow</h2>
      <ul>
        <li>Decision Control: if, if-else, elif</li>
        <li>Pass Statement</li>
        <li>Switch (match-case in Python 3.10+)</li>
        <li>Loops: for, while</li>
        <li>Break & Continue</li>
      </ul>

      <h2>Data Types & Collections</h2>
      <ul>
        <li>Numbers (int, float, complex)</li>
        <li>Lists – Creation, Slicing, Methods, Comprehension</li>
        <li>Strings – Indexing, Slicing, Methods</li>
        <li>Sets – Operations, Methods</li>
        <li>Dictionaries – Key-Value Pairs, Methods</li>
        <li>Tuples – Immutable Sequences</li>
      </ul>

      <h2>Functions</h2>
      <ul>
        <li>Defining & Calling Functions</li>
        <li>Arguments & Parameters</li>
        <li>Scope & Lifetime of Variables</li>
        <li>Global Keyword</li>
        <li>Lambda (Anonymous) Functions</li>
        <li>Recursion</li>
        <li>*args and **kwargs</li>
      </ul>

      <h2>Modules & Packages</h2>
      <ul>
        <li>What are Modules & Uses</li>
        <li>Creating & Importing Modules</li>
        <li>Main Function</li>
        <li>What are Packages & Uses</li>
        <li>Creating & Using Packages</li>
        <li>Pip Package Manager</li>
      </ul>

      <h2>File Management</h2>
      <ul>
        <li>Reading & Writing Files</li>
        <li>CSV & JSON Files</li>
      </ul>

      <h2>Exception Handling</h2>
      <ul>
        <li>What are Exceptions</li>
        <li>try-except-finally</li>
        <li>Custom Exceptions</li>
      </ul>

      <h2>OOP in Python</h2>
      <ul>
        <li>Classes & Objects</li>
        <li>Encapsulation</li>
        <li>Inheritance & Types</li>
        <li>Multiple Inheritance Problem</li>
        <li>Polymorphism</li>
        <li>Operator Overloading</li>
      </ul>

      <h2>Advanced Python</h2>
      <ul>
        <li>Generators</li>
        <li>Decorators</li>
        <li>Closures</li>
      </ul>
    </div>
  </div>


</body>
</html>
