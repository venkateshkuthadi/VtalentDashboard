<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Course Feedback</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 50px;
            background-color: #f4f4f4;
        }
        h2 {
            color: #333;
        }
        form {
            background: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        input, textarea, select {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        button {
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 4px;
        }
        button:hover {
            background: #218838;
        }
        .message {
            margin-top: 20px;
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>

<h2>Submit Your Feedback</h2>

<form action="submitFeedback" method="post">
    <label for="course">Course:</label>
    <input type="text" id="course" name="course" required>

    <label for="professor">Professor:</label>
    <input type="text" id="professor" name="professor" required>

    <label for="rating">Rating (1-5):</label>
    <select id="rating" name="rating" required>
        <option value="">--Select--</option>
        <option value="1">1 - Poor</option>
        <option value="2">2 - Fair</option>
        <option value="3">3 - Good</option>
        <option value="4">4 - Very Good</option>
        <option value="5">5 - Excellent</option>
    </select>

    <label for="suggestion">Suggestion:</label>
    <textarea id="suggestion" name="suggestion" rows="4"></textarea>

    <button type="submit">Submit Feedback</button>
</form>

<% 
    String msg = request.getParameter("msg");
    if ("success".equals(msg)) {
%>
    <div class="message">Thank you for your feedback!</div>
<% 
    }
%>

</body>
</html>
