<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Checkout</title>
</head>
<body class="home">

	<header>

		<h1>
			<font face="Cambria">GAMESPEED</font>
		</h1>
	</header>

	<nav>
		<ul>
			<li><a href="Home.jsp" class="home"><font face="Cambria">HOME</font></a></li>
			<li><a href="Microsoft.jsp" class="microsoft"><font
					face="Cambria">MICROSOFT</font></a></li>
			<li><a href="Sony.jsp" class="sony"><font face="Cambria">SONY</font></a></li>
			<li><a href="Nintendo.jsp" class="nintendo"><font
					face="Cambria">NINTENDO</font></a></li>
		</ul>
		<a href="Log.jsp">SIGN OUT</a> <a href="ViewCart.jsp">CART</a> <a
			href="MyOrders.jsp">MY ORDERS</a>

	</nav>

	<div id="contain">

		<section id="desc">
			<h1 align="center">Checkout</h1>

			<form action="PlaceOrder.jsp">

				<table class="query-table" align="center">
					<tr>
						<td><label>Name:</label></td>

						<td><input type="text" name="uname" required="required"></td>
					</tr>
					<tr>
						<td><label>Address:</label></td>

						<td><input type="text" name="address" required="required"></td>
					</tr>
					<tr>
						<td><label>Credit Card No:</label></td>

						<td><input type="text" name="cnumber" required="required"></td>
					</tr>
					<tr>
						<td><label>CVV:</label></td>

						<td><input type="password" name="cvv" required="required"></td>
					</tr>

				</table>
				<br>
				<br>
				<br> <input type="submit" value="Place Order">
			</form>

		</section>


		<aside class="vnav">
			<ul>
				<li>
					<h3>Game Makers</h3>
					<ul>
						<li><a href="EA.jsp">Electronic Arts</a></li>
						<li><a href="Activision.jsp">Activision</a></li>
						<li><a href="TTI.jsp">Take-Two Interactive</a></li>
					</ul>
				</li>

				<li>
					<h3>Accessories</h3>
					<ul>
						<li><a href="Xc.jsp">Xbox</a></li>
						<li><a href="Psc.jsp">Play Station</a></li>
						<li><a href="Wiic.jsp">Wii</a></li>
					</ul>
				</li>

				<li>
					<h3>Tablets</h3>
					<ul>
						<li><a href="Tablet.jsp">Tablets</a></li>
					</ul>
				</li>

				<li>
					<h3>Other Products</h3>
					<ul>
						<li><a href="Others.jsp">Others</a></li>
					</ul>
				</li>

			</ul>
		</aside>

		<div class="clear"></div>



		<div class="foo">Copyright © www.gamespeed.co.in</div>
	</div>

</body>
</html>
