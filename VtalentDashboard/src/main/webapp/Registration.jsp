<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String cancleLink = "index.jsp"; 
    if (session.getAttribute("admin") != null) {
        cancleLink = "admin.jsp";
        
    }
%>

<html>
<head>
  <meta charset="UTF-8">
  <title>Registration Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f3f3f3;
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: flex-start;
      min-height: 100vh;
      padding: 20px;
    }

    .form-box {
      background-color: #fff;
      padding: 30px 40px;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 700px;
      box-sizing: border-box;
    }

    .logo-section {
      text-align: center;
      margin-bottom: 0px;
      height: 100px;
      width: 100px;
      margin-left: 200px;
    }

    .main-logo {
      height: 100px;
      width: 200px;
      margin-bottom: 17px;
      text-align: center;
    }

    h2 {
      margin-top: 0;
      font-size: 20px;
      color: #333;
      font-family: Times New Roman;
    }

    label {
      display: block;
      margin-top: 15px;
      margin-bottom: 5px;
      font-weight: bold;
      font-size: 16px;
      color: #333;
      font-family: Times New Roman;
    }

    input {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 14px;
      margin-bottom: 10px;
    }

    .button-group {
      display: flex;
      gap: 10px;
      margin-top: 10px;
    }

    .button-group button {
      flex: 1;
      padding: 12px;
      font-size: 16px;
      font-weight: bold;
      border-radius: 4px;
      border: none;
      cursor: pointer;
      font-family: Times New Roman;
    }

    .button-group button[type="submit"] {
      background-color: #0077c5;
      color: #fff;
    }

    .button-group button[type="submit"]:hover {
      background-color: #005fa3;
    }

    .button-group button[type="button"] {
      background-color: #ccc;
      color: #333;
    }

    .button-group button[type="button"]:hover {
      background-color: #bbb;
    }

    .radio-group {
      display: flex;
      gap: 60px;
      align-items: center;
    }

    .radio-group label {
    display:flex;
    align-item: center;
    gap: 5px;
    margin: 0;
    }
    .radio-group input{
    margin:0;
    }

    .required {
      color: red;
    }
  </style>

  <script>
    function validateForm() {
      const pwd = document.getElementById("password").value;
      const cpwd = document.getElementById("confirmpassword").value;

      const pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,}$/;

      if (!pattern.test(pwd)) {
        alert("Password must be at least 6 characters long and include an uppercase letter, lowercase letter, and a number.");
        return false;
      }

      if (pwd !== cpwd) {
        alert("Passwords do not match.");
        return false;
      }

      return true;
    }
  </script>
</head>
<body>
  <div class="container">
    <div class="form-box">
      <div class="logo-section">
        <img src="images/vtalentlogo.png.jpg" alt="logo" class="main-logo">
      </div>
      <br>
      <h2>Registration Form</h2>

      <!-- REGISTRATION FORM -->
      <form action="RegistrationServlet" method="post" onsubmit="return validateForm();">
        <label>User Name <span class="required">*</span></label>
        <input type="text" name="username" required>

        <label>Qualification <span class="required">*</span></label>
        <input type="text" name="Qualification" required>

        <label>Email <span class="required">*</span></label>
        <input type="email" name="email" required>

        <label>Contact No <span class="required">*</span></label>
        <input type="tel" name="Contact_no" required pattern="[0-9]{10}" title="Enter 10-digit phone number">

        <label>Higher Degree/ Year <span class="required">*</span></label>
        <input type="text" name="Year" required>

        <label>Stream <span class="required">*</span></label>
        <input type="text" name="Stream" required>

        <label>College/Institute Name <span class="required">*</span></label>
        <input type="text" name="College" required>

        <label>Location <span class="required">*</span></label>
        <input type="text" name="Location" required>

        <label>Technology Interested <span class="required">*</span></label><br>
        <div class="radio-group">
          <label><input type="radio" id="java" name="technology" value="Java" required>Java</label>

          <label><input type="radio" id="python" name="technology" value="Python">Python</label>
        </div>

        <label>Preferred Location <span class="required">*</span></label><br>
        <div class="radio-group">
          <label><input type="radio" id="hyd" name="Prefered_loc" value="Hyderabad" required>Hyderabad</label>

        <label><input type="radio" id="vijayawada" name="Prefered_loc" value="Vijayawada">Vijayawada</label>

        <label><input type="radio" id="vizag" name="Prefered_loc" value="Vizag">Vizag</label>
        </div>

        <label>Password <span class="required">*</span></label>
        <input type="password" name="password" id="password" required>

        <label>Confirm Password <span class="required">*</span></label>
        <input type="password" name="confirmpassword" id="confirmpassword" required>

        <div class="button-group">
          <button type="submit">Register</button>
          <button type="button"  onclick="window.location.href='<%= cancleLink %>'">Cancel</button>
        </div>
      </form>
    </div>
  </div>
</body>
</html>