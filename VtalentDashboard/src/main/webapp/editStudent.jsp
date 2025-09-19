<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.VtalentDashboard.entity.RegistrationEntity" %>
<%
    RegistrationEntity user = (RegistrationEntity) session.getAttribute("editStu");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student Record</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7f8;
            margin: 0;
            padding: 0;
        }

        .header {
            background-color: #422ea1;
            color: white;
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header img {
            height: 60px;
        }

        .header-buttons {
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 8px 16px;
            font-size: 14px;
            border: none;
            border-radius: 4px;
            text-decoration: none;
            color: white;
            cursor: pointer;
        }

        .btn-warning {
            background-color: #ffc107;
            color: black;
        }

        .btn-light {
            background-color: #f8f9fa;
            color: black;
        }

        .container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
        }

        form {
            background: white;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 8px 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="header">
        <div class="logo">
            <img src="https://images.jdmagicbox.com/v2/comp/vijayawada/r1/0866px866.x866.230814170023.n3r1/catalogue/vtalent-gurunanak-colony-vijayawada-tutorials-h6zcacjgy9.jpg"
                 alt="vtalent">
        </div>
        <div class="header-buttons">
            <a href="admin.html" class="btn btn-warning">Home</a>
            <a href="admin.html" class="btn btn-light">Back</a>
        </div>
    </div>

    <!-- Form Container Below Header -->
    <div class="container">
        <form action="EditStudentrecord" method="post">
            <h2>Edit Student</h2>

            <label for="sid">SID:</label>
            <input type="text" name="sid" value="<%= user.getSID() %>" readonly />

            <label for="username">Name:</label>
            <input type="text" name="username" value="<%= user.getName() %>" />

            <label for="Qualification">Qualification:</label>
            <input type="text" name="Qualification" value="<%= user.getQualification() %>" />

            <label for="email">Email:</label>
            <input type="email" name="email" value="<%= user.getEmail_id() %>" />

            <label for="Contact_no">Contact No:</label>
            <input type="text" name="Contact_no" value="<%= user.getContact_no() %>" />

            <label for="Year">Year:</label>
            <input type="text" name="Year" value="<%= user.getYear() %>" />

            <label for="Stream">Stream:</label>
            <input type="text" name="Stream" value="<%= user.getStream() %>" />

            <label for="College">College:</label>
            <input type="text" name="College" value="<%= user.getCollege() %>" />

            <label for="Location">Location:</label>
            <input type="text" name="Location" value="<%= user.getLocation() %>" />

            <label for="Prefered_loc">Preferred Location:</label>
            <input type="text" name="Prefered_loc" value="<%= user.getPrefered_loc() %>" />

            <button type="submit">Update</button>
        </form>
    </div>

</body>
</html>
