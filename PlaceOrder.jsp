<%@page import="java.util.Calendar"%>
<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="java.util.Random"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Order Placed</title>
</head>
<body>

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

		<section id="desc">

			<%
				String userid = (String) request.getSession().getAttribute(
						"username");
				MongoClient mg = new MongoClient("localhost", 27017);
				DB mdb = mg.getDB("Assignment3");
				DBCollection orders = mdb.getCollection("Orders");
				Calendar c = Calendar.getInstance();
				c.add(Calendar.DATE, 14);
				Random r = new Random(System.currentTimeMillis());
				Long orderid = (long) (10000 + r.nextInt(20000));
				DBCollection ccart = mdb.getCollection("CustomerCart");
				BasicDBObject bdbo = new BasicDBObject();
				bdbo.put("userName", userid);
				DBCursor dbc = ccart.find(bdbo);
				while (dbc.hasNext()) {

					BasicDBObject bdc = (BasicDBObject) dbc.next();
					String userName = bdc.getString("userName");
					String imageName = bdc.getString("imageName");
					String productName = bdc.getString("productName");
					double productPrice = bdc.getDouble("productPrice");
					double productQuantity = bdc.getDouble("productQuantity");
					double totalCost = bdc.getDouble("totalCost");

					BasicDBObject bdo1 = new BasicDBObject("name", "value")
							.append("userName", userName)
							.append("orderId", orderid)
							.append("imageName", imageName)
							.append("productName", productName)
							.append("productPrice", productPrice)
							.append("productQuantity", productQuantity)
							.append("totalCost", totalCost)
							.append("deliveryDate",c.getTime());
					orders.insert(bdo1);
				}
			%>
			<h1>
			Order Placed Successfully
			<br>
			Your Order id is: <%=orderid %>
			<br>
			Expected delivery date is: <%=c.getTime() %>
			</h1>
			<%
			ccart.remove(bdbo);
			%>
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