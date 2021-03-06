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
<title>Microsoft</title>
</head>
<body class="microsoft">

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
		<img class = "img-disp" alt="Xbox" src="Images/Xbox.jpg" height="200px" width="100%">

			<%
				MongoClient mg = new MongoClient("localhost", 27017);
				DB mdb = mg.getDB("Assignment3");
				DBCollection products = mdb.getCollection("Products");
				BasicDBObject bdbo = new BasicDBObject();
				bdbo.put("field2", "Microsoft");
				NumberFormat formatter = NumberFormat
						.getCurrencyInstance(Locale.US);
				DBCursor dbc = products.find(bdbo);

				if (dbc.count() == 0) {
			%>
			<h1>No new products available</h1>
			<%
				}

				else {
					while (dbc.hasNext()) {

						BasicDBObject bdc = (BasicDBObject) dbc.next();
			%>


			<form action="AddView.jsp" method="post">
			<input type="hidden" value="<%= bdc.getString("field0")%>" name="prname">
				<input type="hidden" value="<%= bdc.getString("field1")%>" name="prprice">
				<table class="table-1" align="center">

					<tr>
						<th><%= bdc.getString("field0")%> </th>
						<th>$<%= bdc.getString("field1")%> </th>
					</tr>

					<tr>
						<th rowspan="3"><img
							src="Images/<%=bdc.getString("field8")%>" height="200px"
							width="200px"></th>
						<td><input type="submit" name="addtocart" value="Add to Cart"></td>
					</tr>
					<tr>
						<td><input type="submit" name="writerev" value="Write Review"></td>
					</tr>
					<tr>
						<td><input type="submit" name="viewreview"
							value="View Review"></td>
					</tr>
					
					<tr>
						<th>Rebate: $<%=bdc.getString("field6")%></th>
						<th>Discount: $<%=bdc.getString("field7")%></th>
					</tr>
					
					<tr>
					<th>Product type: <%=bdc.getString("field4") %></th>
					<th>Warranty: <%=bdc.getString("field5") %></th>
					</tr>


				</table>
			</form>

			<%
				}
				}
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



		<div class="foo">Copyright � www.gamespeed.co.in</div>
	</div>

</body>
</html>
