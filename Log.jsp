<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Login</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>
<body class="index">
	<section class="cl">
	 <form action="Login.jsp" method="post">
			<label>Login As:</label> <select name="login">
				<option value="customer">Customer</option>
				<option value="smanager">Store Manager</option>
				<option value="salesman">Salesman</option>
			</select> <br> <br> <br> <br>
			<ul>
				<li><label>Email</label> <input type="email"
					name="email" placeholder="Email" required="required"></li>
				<li><label>Password</label> <input
					type="password" name="password" placeholder="Password" required="required"></li>
				<li><input type="submit" value="Login"></li>
			</ul>
		</form>
		<p class="signup"><a href="Reg.jsp"> Create Account</a> </p>
	</section>

</body>
<footer class="foot">
Copyright © www.gamespeed.co.in
</footer>
</html>