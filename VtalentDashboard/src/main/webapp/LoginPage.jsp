<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <title>Vtalent Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #c8dafc; /* slightly darker pale blue */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .container {
      background: #fff;
      padding: 34px 42px 28px 42px;
      border-radius: 18px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.13);
      width: 460px;
      text-align: center;
    }
    .logo-img {
      width: 210px;
      height: auto;
      margin-bottom: 4px;
      margin-top: 7px;
    }
    #loginHeading {
      font-size: 2.2rem;
      color: #1A237E;
      margin: 10px 0 28px 0;
      letter-spacing: 2px;
      font-weight: bold;
    }
    .radio-group {
      margin-bottom: 28px;
      display: flex;
      justify-content: center;
      gap: 36px;
    }
    .radio-group label {
      font-size: 18px;
      cursor: pointer;
    }
     .error-message {
            color: #d9534f;
            text-align: center;
            margin-bottom: 15px;
            font-weight: bold;
        }
    .form-row {
      display: flex;
      align-items: center;
      margin-bottom: 22px;
      text-align: left;
    }
    .form-row label {
      flex: 0 0 115px;
      font-size: 18px;
      color: #444;
      margin-right: 11px;
      text-align: right;
      font-weight: 500;
    }
    .form-row input[type="text"],
    .form-row input[type="password"] {
      flex: 1;
      padding: 10px 12px;
      border: 1px solid #d3d3d3;
      border-radius: 6px;
      font-size: 17px;
      background: #fafbfc;
      transition: border 0.3s;
    }
    .form-row input[type="text"]:focus,
    .form-row input[type="password"]:focus {
      border-color: #1976d2;
      outline: none;
    }
    .btn-group {
      display: flex;
      gap: 23px;
      margin-top: 12px;
    }
    .btn-group button {
      flex: 1 1 0;
      padding: 12px 0;
      border: none;
      border-radius: 6px;
      font-size: 15px;
      font-weight: bold;
      cursor: pointer;
      transition: background 0.22s, transform 0.15s;
    }
    .btn-group .submit {
      background: #4287f5;
      color: #fff;
    }
    .btn-group .cancel {
      background: #e0463e;
      color: #fff;
    }
    .btn-group .submit:hover {
      background: #248c37;
      transform: translateY(-2px) scale(1.03);
    }
    .btn-group .cancel:hover {
      background: #b3312a;
      transform: translateY(-2px) scale(1.03);
    }
  </style>
</head>
<body>
  <div class="container">
    <!-- Logo at the top -->
    <img src="https://vtalent.in/images/vtalentlogo.png" alt="Vtalent Logo" class="logo-img">
    <div id="loginHeading">Student Login</div>
     <div class="error-message">
            <%
                String errorMessage = (String) request.getAttribute("errorMessage");
                if (errorMessage != null) {
                    out.print(errorMessage);
                }
            %>
        </div>
    
    <!-- Fixed: Correct form action -->
    <form id="loginForm" action="LoginServlet" method="post" onsubmit="return validateForm(event)">

      <div class="radio-group">
        <input type="radio" id="student" name="userType" value="student" checked onclick="updateHeading()" />
        <label for="student">Student</label>
        <input type="radio" id="admin" name="userType" value="admin" onclick="updateHeading()" />
        <label for="admin">Admin</label>
      </div>
      <div class="form-row">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" placeholder="Enter your username" required />
      </div>
      <div class="form-row">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required />
      </div>
       <input type="hidden" id="latitude" name="latitude">
            <input type="hidden" id="longitude" name="longitude">
      <div class="btn-group">
        <button type="submit" class="submit"><b>Submit</b></button>
        <button type="reset" class="cancel"><b>Cancel</b></button>
      </div>
    </form>
  </div>
  
  <script>
  // Update heading when switching between Student and Admin
  function updateHeading() {
    const heading = document.getElementById("loginHeading");
    if (document.getElementById("student").checked) {
      heading.textContent = "Student Login";
    } else if (document.getElementById("admin").checked) {
      heading.textContent = "Admin Login";
    }
  }

  document.addEventListener('DOMContentLoaded', updateHeading);

  // Validate form and capture geolocation before submitting
  function validateForm(event) {
    event.preventDefault();

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        function (position) {
          document.getElementById("latitude").value = position.coords.latitude;
          document.getElementById("longitude").value = position.coords.longitude;
          document.getElementById('loginForm').submit(); // submit after getting location
        },
        function (error) {
          console.log("Location access denied, falling back to IP");
          document.getElementById('loginForm').submit(); // submit anyway
        }
      );
    } else {
      document.getElementById('loginForm').submit();
    }

    return false;
  }
</script>

</body>
</html>