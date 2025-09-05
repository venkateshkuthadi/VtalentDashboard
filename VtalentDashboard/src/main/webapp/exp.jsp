<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*, com.VtalentDashboard.entity.AssessmentDto" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Assessment Results</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f5f7fa 0%, #e4e8f0 100%);
        color: #333;
        line-height: 1.6;
        padding: 20px;
        min-height: 100vh;
    }
    
    .header-container {
        background: white;
        padding: 15px 25px;
        border-radius: 12px;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
        margin-bottom: 30px;
    }
    
    .logo {
        border-radius: 8px;
        transition: transform 0.3s ease;
    }
    
    .logo:hover {
        transform: scale(1.05);
    }
    
    .btn-custom {
        padding: 10px 20px;
        border-radius: 50px;
        font-weight: 600;
        transition: all 0.3s ease;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    
    .btn-home {
        background: linear-gradient(135deg, #ff9c33 0%, #ff8c1a 100%);
        color: white;
        border: none;
    }
    
    .btn-home:hover {
        transform: translateY(-3px);
        box-shadow: 0 6px 12px rgba(255, 156, 51, 0.25);
    }
    
    .btn-back {
        background: #6c757d;
        color: white;
        border: none;
    }
    
    .btn-back:hover {
        background: #5a6268;
        transform: translateY(-3px);
    }
    
    .content-container {
        background: white;
        border-radius: 12px;
        box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
        padding: 25px;
        margin-bottom: 30px;
    }
    
    .page-title {
        color: #422ea1;
        text-align: center;
        margin-bottom: 25px;
        font-weight: 700;
        padding-bottom: 15px;
        border-bottom: 2px solid #f0f0f0;
    }
    
    .assessment-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
        margin-bottom: 25px;
    }
    
    .assessment-table th {
        background: linear-gradient(135deg, #422ea1 0%, #6a53ce 100%);
        color: white;
        padding: 16px;
        text-align: left;
        font-weight: 600;
    }
    
    .assessment-table td {
        padding: 14px 16px;
        border-bottom: 1px solid #f0f0f0;
    }
    
    .assessment-table tr:nth-child(even) {
        background-color: #f9f9fc;
    }
    
    .assessment-table tr:hover {
        background-color: #f1f3ff;
        transition: background-color 0.2s ease;
    }
    
    .assessment-table tr:last-child td {
        border-bottom: none;
    }
    
    .link-cell a {
        color: #422ea1;
        text-decoration: none;
        font-weight: 500;
        transition: all 0.2s ease;
        display: inline-block;
    }
    
    .link-cell a:hover {
        color: #6a53ce;
        text-decoration: underline;
        transform: translateX(3px);
    }
    
    .no-records {
        text-align: center;
        padding: 30px;
        color: #6c757d;
        font-style: italic;
    }
    
    .btn-search-again {
        background: linear-gradient(135deg, #422ea1 0%, #6a53ce 100%);
        color: white;
        padding: 12px 30px;
        border: none;
        border-radius: 50px;
        font-weight: 600;
        cursor: pointer;
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(66, 46, 161, 0.3);
        display: block;
        margin: 0 auto;
        font-size: 1.1rem;
    }
    
    .btn-search-again:hover {
        transform: translateY(-3px);
        box-shadow: 0 8px 20px rgba(66, 46, 161, 0.4);
    }
    
    .btn-search-again i {
        margin-right: 8px;
    }
    
    @media (max-width: 768px) {
        .assessment-table {
            display: block;
            overflow-x: auto;
        }
        
        .header-container .row {
            flex-direction: column;
            text-align: center;
            gap: 15px;
        }
        
        .header-container .d-flex {
            justify-content: center;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <div class="header-container">
            <div class="row align-items-center">
                <div class="col-sm-6">
                    <img src="https://images.jdmagicbox.com/v2/comp/vijayawada/r1/0866px866.x866.230814170023.n3r1/catalogue/vtalent-gurunanak-colony-vijayawada-tutorials-h6zcacjgy9.jpg"
                        alt="vtalent" width="120" class="logo">
                </div>
                <div class="col-sm-6 d-flex justify-content-end">
                    <a href="Weeklytest.html" class="btn btn-home me-2">Home</a>
                    <a href="Weeklytest.html" class="btn btn-back">Back</a>
                </div>
            </div>
        </div>
        
        <div class="content-container">
            <h1 class="page-title">Assessment Results</h1>
            
            <table class="assessment-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Course</th>
                        <th>Concept</th>
                        <th>Assessment Link</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<AssessmentDto> students = (List<AssessmentDto>) request.getAttribute("user");
                        if (students != null && !students.isEmpty()) {
                            for (AssessmentDto s : students) {
                    %>
                    <tr>
                        <td><%= s.getId() %></td>
                        <td><%= s.getCourse() %></td>
                        <td><%= s.getConcept() %></td>
                        <td class="link-cell"><a href="<%= s.getLink() %>" target="_blank"><i class="fas fa-external-link-alt"></i> <%= s.getLink() %></a></td>
                    </tr>
                    <%      }
                        } else {
                    %>
                    <tr>
                        <td colspan="4" class="no-records">
                            <i class="fas fa-search" style="font-size: 2rem; margin-bottom: 15px; display: block;"></i>
                            No assessment records found
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            
            <button class="btn-search-again" onclick="location.href='search1.html'">
                <i class="fas fa-search"></i> Search Again
            </button>
        </div>
    </div>

    <script>
        // Add subtle animation to table rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.assessment-table tr');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateY(10px)';
                setTimeout(() => {
                    row.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateY(0)';
                }, index * 100);
            });
        });
    </script>
</body>
</html>