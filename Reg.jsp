<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Customer Registration</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>
<body class="index">
	<section class="cr">
	 <form action="Registration.jsp" method="post">
	 <label>Register As:</label> <select name="login">
				<option value="customer">Customer</option>
				<option value="smanager">Store Manager</option>
				<option value="salesman">Salesman</option>
			</select> <br> <br> <br> <br>
			<table align="center">
			<tr>
			<td><label>Email Id</label></td>
			<td>:</td>
			<td><input type="email" name="email" required="required"></td>
			</tr>
			<tr>
			<td><label>New Password</label></td>
			<td>:</td>
			<td><input type="password" name="password" required="required"></td>
			</tr>
			<tr>
			<td><label>Confirm Password</label></td>
			<td>:</td>
			<td><input type="password" name="cpassword" required="required"></td>
			</tr>
			</table>
			<br><br>			
			<input type="submit" value="Create Account">
		</form>
	</section>
</body>
<footer class="foot">
Copyright © www.gamespeed.co.in
</footer>
</html>