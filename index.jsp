<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Form</title>
</head>
<body>
	<form method="post" action="./LoginServlet">
		<table border="1" align="center" width="25%">
			<tr>
				<th>Email</th>
				<th><input type="text" name="email" value=""></th>
			</tr>
			<tr>
				<th>Pass</th>
				<th><input type="password" name="pass" value=""></th>
			</tr>
			<tr>
				<th><input type="submit" name="submit" value="Login"></th>
				<th><input type="reset" name="reset" value="Clear Form"></th>
			</tr>
		</table>
		<center><p><a href="Register.html">SignUp</a></p></center>
		<center><div style="color:red;font-size:28px"><%=request.getAttribute("error")%></div></center>
	</form>
</body>
</html>
