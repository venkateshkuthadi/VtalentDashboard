<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.VtalentDashboard.entity.RegistrationEntity" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Records</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f4f4f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .container-fluid {
            background-color: #422ea1;
            color: white;
            padding: 15px;
        }

        .btn {
            margin: 5px;
        }

        .table-container {
            padding: 30px;
        }

        table {
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #422ea1;
            color: white;
        }

        td, th {
            vertical-align: middle !important;
            text-align: center;
        }

        .action-buttons form {
            display: inline-block;
        }

        .action-buttons button {
            margin: 2px;
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="container-fluid">
        <div class="row align-items-center">
            <div class="col-sm-6">
                <img src="https://images.jdmagicbox.com/v2/comp/vijayawada/r1/0866px866.x866.230814170023.n3r1/catalogue/vtalent-gurunanak-colony-vijayawada-tutorials-h6zcacjgy9.jpg"
                     alt="vtalent" width="120">
            </div>
            <div class="col-sm-6 d-flex justify-content-end">
                <a href="admin.jsp" class="btn btn-warning">Home</a>
                <a href="admin.jsp" class="btn btn-light">Back</a>
            </div>
        </div>
    </div>

    <!-- Table -->
    <div class="container table-container">
        <h3 class="mb-4 text-center">Student Records</h3>
        <div class="table-responsive">
            <table class="table table-bordered table-striped table-hover align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>College</th>
                        <th>Qualification</th>
                        <th>Contact No</th>
                        <th>Email ID</th>
                        <th>Year</th>
                        <th>Stream</th>
                        <th>Location</th>
                        <th>Technology</th>
                        <th>Preferred Location</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    List<RegistrationEntity> students = (List<RegistrationEntity>) request.getAttribute("user");
                    if (students != null && !students.isEmpty()) {
                        for (RegistrationEntity s : students) {
                %>
                    <tr>
                        <td><%= s.getSID() %></td>
                        <td><%= s.getName() %></td>
                        <td><%= s.getCollege() %></td>
                        <td><%= s.getQualification() %></td>
                        <td><%= s.getContact_no() %></td>
                        <td><%= s.getEmail_id() %></td>
                        <td><%= s.getYear() %></td>
                        <td><%= s.getStream() %></td>
                        <td><%= s.getLocation() %></td>
                        <td><%= s.getTechnology() %></td>
                        <td><%= s.getPrefered_loc() %></td>
                        <td class="action-buttons">
                            <form method="get" action="EditStudentrecord">
                                <input type="hidden" name="sid" value="<%= s.getSID() %>"/>
                                <button class="btn btn-sm btn-primary">Edit</button>
                            </form>
                            <form method="post" action="DeleteStudentrecord">
                                <input type="hidden" name="sid" value="<%= s.getSID() %>"/>
                                <button class="btn btn-sm btn-danger">Delete</button>
                            </form>
                        </td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="12" class="text-center">No records found</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Bootstrap JS (optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
