<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Registration Successful</title>
</head>
<body>
<h1>Registration Successful</h1>
<p>Your registration was successful.</p>

<!-- JavaScript to redirect to another page after a delay -->
<script type="text/javascript">
  setTimeout(function() {
    window.location.href = "authen.jsp"; // Replace with the actual URL
  }, 3000); // Redirect after 3 seconds (adjust as needed)
</script>
</body>
</html>
