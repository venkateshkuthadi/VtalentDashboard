<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Weekly Test</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
    }
    .header {
        background-color: #4b2ca0; /* Purple bar */
        color: white;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 10px 20px;
    }
    .header img {
        height: 40px;
    }
    .header-buttons {
        display: flex;
        gap: 10px;
    }
    .header-buttons a {
        background-color: #fbbc05; /* Yellow for Home */
        color: black;
        text-decoration: none;
        padding: 6px 14px;
        border-radius: 6px;
        font-weight: bold;
    }
    .header-buttons a.back {
        background-color: gray; /* Gray for Back */
        color: white;
    }
    .container {
        padding: 30px;
    }
</style>
</head>
<body>

<!-- Header Section -->
<div class="header">
    <div class="logo">
        <img src="images/talent logo.jpg" alt="Vtalent Logo"> <!-- Replace with your actual logo path -->
    </div>
    <div class="header-buttons">
        <a href="home.html">Home</a>
        <a href="javascript:history.back()" class="back">Back</a>
    </div>
</div>

<!-- Page Content -->
<div class="container">
    <form action="AdminAssessmentController" method="post">
        <label>course:</label>
        <input type="text" name="course"/><br><br>

        <label>concept:</label>
        <input name="concept"/><br><br>

        <label>link:</label>
        <input name="link"/><br><br>

        <label>type:</label>
        <input name="type"/><br><br>

        <button type="submit">submit</button>
    </form>
</div>

</body>
</html>
