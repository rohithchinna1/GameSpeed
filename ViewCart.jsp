<%@page import="Beans.Update"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBCollection"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Cart</title>
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
			<!-- 			<li><a href="Tablet.html" class="tablet"><font -->
			<!-- 					face="Cambria">TABLETS</font></a></li> -->
		</ul>
		<a href="Log.jsp">SIGN OUT</a> <a href="ViewCart.jsp">CART</a> <a
			href="MyOrders.jsp">MY ORDERS</a>

	</nav>

	<div id="contain">

		<section id="desc1">


			<%
				Update up = new Update();
				MongoClient mg = new MongoClient("localhost", 27017);
				DB mdb = mg.getDB("Assignment3");
				String userid = (String) request.getSession().getAttribute(
						"username");
				String qty = request.getParameter("qty");
				String proname = request.getParameter("proname");
				String uname = request.getParameter("uname");
				double quantity = 0;
				try {
					quantity = Double.parseDouble(qty);
				} catch (Exception e) {

				}

				if (request.getParameter("update") != null) {
					up.setUserId(uname);
					up.setProductName(proname);
					up.setQuantity(quantity);

					DBCollection ccart = mdb.getCollection("CustomerCart");
					BasicDBObject bdo2 = new BasicDBObject();
					bdo2.put("productName", up.getProductName());
					bdo2.put("userName", up.getUserId());
					DBCursor c1 = ccart.find(bdo2);
					BasicDBObject bd2 = null;
					while (c1.hasNext()) {
						bd2 = (BasicDBObject) c1.next();
					}
					if(up.getQuantity()== 0){
						ccart.remove(bdo2);
					}
					else{
					double updatedTot = (bd2.getDouble("productPrice") * up
							.getQuantity());
					BasicDBObject bdo3 = new BasicDBObject().append(
							"$set",
							new BasicDBObject().append("productQuantity",
									up.getQuantity()).append("totalCost",
									updatedTot));
					BasicDBObject bdo4 = new BasicDBObject().append("userName",
							up.getUserId()).append("productName",
							up.getProductName());
					ccart.update(bdo4, bdo3);
					}
				}

				else if (request.getParameter("remove") != null) {
					up.setUserId(uname);
					up.setProductName(proname);
					up.setQuantity(quantity);

					DBCollection ccart = mdb.getCollection("CustomerCart");
					BasicDBObject bdo = new BasicDBObject();
					bdo.put("userName", up.getUserId());
					bdo.put("productName", up.getProductName());
					ccart.remove(bdo);

				}

				DBCollection ccart = mdb.getCollection("CustomerCart");
				BasicDBObject bdbo = new BasicDBObject();
				bdbo.put("userName", userid);
				DBCursor dbc = ccart.find(bdbo);
				NumberFormat formatter = NumberFormat
						.getCurrencyInstance(Locale.US);

				if (dbc.count() == 0) {
			%>
			<h1 align="center">Your cart is empty</h1>
			<%
				} else {
			%>
			<h1 align="center">Your Cart</h1>

			<table class="table-2" align="center">
				<tr>
					<th>Product</th>
					<th>Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total Cost</th>

				</tr>
				<%
					while (dbc.hasNext()) {

							BasicDBObject bdc = (BasicDBObject) dbc.next();
							double proprice = bdc.getDouble("productPrice");
					%>


				<tr>
					<td><img src="Images/<%=bdc.getString("imageName")%>"
						height="70px" width="70px"></td>
					<td><%=bdc.getString("productName")%></td>

					<td><%=formatter.format(bdc.getDouble("productPrice"))%></td>

					<td><form action="#">
							<input type="number" min="0"
								value="<%=(int) bdc.getDouble("productQuantity")%>" name="qty">
							<input type="hidden" value="<%=bdc.getString("userName")%>"
								name="uname"> <input type="hidden"
								value="<%=bdc.getString("productName")%>" name="proname">
							<input type="submit" value="Update" name="update"> | <input
								type="submit" value="Remove" name="remove">
						</form></td>
					<td><%=formatter.format(bdc.getDouble("totalCost"))%></td>
				</tr>

				<%
					}%>

			</table>
			<br> <br> <br> <br>
			<form class="form1" action="Checkout.jsp" align="center">
				<input type="submit" value="Procced to checkout">
			</form>
			<%} %>
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
