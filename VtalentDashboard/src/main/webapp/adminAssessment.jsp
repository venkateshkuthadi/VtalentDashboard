<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Weekly Test</title>

    <!-- CSS Styling -->
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
        }

        /* Header Styling */
        .header {
            background-color: #4b2ca0;
            color: white;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
        }

        .header img {
            height: 50px;
            border-radius: 6px;
        }

        .header-buttons {
            display: flex;
            gap: 10px;
        }

        .header-buttons a {
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .header-buttons a:hover {
            opacity: 0.9;
        }

        .header-buttons a.home {
            background-color: #fbbc05;
            color: black;
        }

        .header-buttons a.back {
            background-color: #6c757d;
            color: white;
        }

        /* Container */
        .container {
            max-width: 600px;
            margin: 40px auto;
            background-color: white;
            padding: 30px 40px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        /* Form Styling */
        form label {
            display: block;
            margin-bottom: 6px;
            font-weight: 500;
            color: #333;
        }

        form input, form select {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        button[type="submit"] {
            background-color: #4b2ca0;
            color: white;
            padding: 10px 20px;
            border: none;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button[type="submit"]:hover {
            background-color: #3c2384;
        }
    </style>
</head>
<body>

<!-- Header Section -->
<div class="header">
    <div class="logo">
        <img src="images/talent logo.jpg" alt="Vtalent Logo"> <!-- Replace with actual image path -->
    </div>
    <div class="header-buttons">
        <a href="admin.jsp" class="home">Home</a>
        <a href="javascript:history.back()" class="back">Back</a>
    </div>
</div>

<!-- Form Section -->
<div class="container">
    <h2 style="text-align:center; color:#4b2ca0; margin-bottom:30px;">Add Weekly Test</h2>
    <form action="AdminAssessmentController" method="post">
        
        <!-- Course Dropdown -->
        <label for="course">Course</label>
        <select id="course" name="course" required>
            <option value="">-- Select Course --</option>
            <option value="python">Python</option>
            <option value="java">Java</option>
        </select>

        <!-- Concept Field -->
        <label for="concept">Concept</label>
        <input type="text" id="concept" name="concept" required />

        <!-- Link Field -->
        <label for="link">Link</label>
        <input type="text" id="link" name="link" required />

        <!-- Type Dropdown -->
        <label for="type">Type</label>
        <select id="type" name="type" required>
            <option value="">-- Select Type --</option>
            <option value="codeing">Coding</option>
            <option value="Aptitude">Aptitude</option>
        </select>

        <!-- Submit Button -->
        <button type="submit">Submit</button>
    </form>
</div>

</body>
</html>
