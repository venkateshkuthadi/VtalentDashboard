<%@ page import="com.VtalentDashboard.entity.RegistrationEntity" %>
<%
    RegistrationEntity user = (RegistrationEntity) session.getAttribute("user");
%>
<html>
<head><title>Success</title></head>
<body style="text-align:center;">
<hr style="width:80%; margin:auto; border:2px solid #0077c5;">

  <h2>Welcome <%= user.getName() %>! Your registration is successful.</h2>
  <p>SID: <%= user.getSID() %></p>
  <p>Email: <%= user.getEmail_id() %></p>
  <p>Contact: <%= user.getContact_no() %></p>
  <p>Technology: <%= user.getTechnology() %></p>
  <p>Year:<%= user.getYear() %></p>
  <p>Stream: <%= user.getStream() %></p>
  <p>College: <%= user.getCollege() %></p>
  <p>Location: <%= user.getLocation() %></p>
  <p>Preferred Location: <%= user.getPrefered_loc() %></p>
  <p>Password: <%= user.getPassword() %></p>
  <br>
 <hr style="width:80%; margin:auto; border:2px solid #0077c5;">
 
  <button onclick ="window.location.href='LoginPage.jsp'">login</button>
</body>
</html>

        