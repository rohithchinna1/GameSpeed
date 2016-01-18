<%@page import="com.mongodb.DBCursor"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%
	String prname = request.getParameter("prname");
	String prprice = request.getParameter("prprice");
	if (request.getParameter("writerev") != null) {
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Write Review</title>
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


		<section class="wrev">
			<form action="Writerev.jsp">
				<table align="center">
					<tr>
						<td><label>Product Name</label></td>
						<td>:</td>
						<td><input type="text" value="<%=prname%>" name="pmodel"
							required="required"></td>
					</tr>
					<tr>
						<td><label>Product Category</label></td>
						<td>:</td>
						<td><select name="pcategory">
								<option value="Gaming Console">Gaming Console</option>
								<option value="Game">Game</option>
								<option value="Xbox Accessory">Accessory - Xbox</option>
								<option value="PS Accessory">Accessory - Play Station</option>
								<option value="Wii Accessory">Accessory - Wii</option>
								<option value="Tablet">Tablet</option>
								<option value="Other">Other</option>
						</select></td>
					</tr>
					<tr>
						<td><label>Product Price</label></td>
						<td>:</td>
						<td><input type="text" value="<%=prprice%>" name="pprice"
							required="required"></td>
					</tr>
					<tr>
						<td><label>Retailer Name</label></td>
						<td>:</td>
						<td><input type="text" name="retailer" required="required"></td>
					</tr>
					<tr>
						<td><label>Retailer Zip</label></td>
						<td>:</td>
						<td><input type="text" name="rzip" required="required"></td>
					</tr>
					<tr>
						<td><label>Retailer City</label></td>
						<td>:</td>
						<td><input type="text" name="rcity" required="required"></td>
					</tr>
					<tr>
						<td><label>Retailer State</label></td>
						<td>:</td>
						<td><input type="text" name="rstate" required="required"></td>
					</tr>
					<tr>
						<td><label>Product On Sale</label></td>
						<td>:</td>
						<td><input type="radio" name="pos" value="Yes"
							checked="checked">Yes <input type="radio" name="pos"
							value="No" required="required">No</td>
					</tr>
					<tr>
						<td><label>Manufacturer Name</label></td>
						<td>:</td>
						<td><select name="mname">
								<option value="Microsoft">Microsoft</option>
								<option value="Sony">Sony</option>
								<option value="Nintendo">Nintendo</option>
								<option value="Electronic Arts">Electronic Arts</option>
								<option value="Activision">Activision</option>
								<option value="Take-Two Interactive">Take-Two
									Interactive</option>
								<option value="Other">Other</option>
						</select></td>
					</tr>
					<tr>
						<td><label>Manufacturer Rebate</label></td>
						<td>:</td>
						<td><input type="radio" name="mrebate" value="Yes">Yes
							<input type="radio" name="mrebate" value="No" checked="checked">No</td>
					</tr>
					<tr>
						<td><label>User Id</label></td>
						<td>:</td>
						<td><input type="text" name="userid" required="required"
							value="<%=request.getSession().getAttribute("username")%>"></td>
					</tr>
					<tr>
						<td><label>Age</label></td>
						<td>:</td>
						<td><input type="text" name="uage" required="required"></td>
					</tr>
					<tr>
						<td><label>Gender</label></td>
						<td>:</td>
						<td><input type="radio" name="gender" value="Male"
							checked="checked">Male <input type="radio" name="gender"
							value="Female">Female</td>
					</tr>
					<tr>
						<td><label>Occupation</label></td>
						<td>:</td>
						<td><input type="text" name="occu" required="required"></td>
					</tr>
					<tr>
						<td><label>Rating</label></td>
						<td>:</td>
						<td><input type="radio" name="rating" value="1">1 <input
							type="radio" name="rating" value="2">2 <input
							type="radio" name="rating" value="3">3 <input
							type="radio" name="rating" value="4">4 <input
							type="radio" name="rating" value="5" checked="checked">5</td>
					</tr>
					<tr>
						<td><label>Date</label></td>
						<td>:</td>
						<td><input type="date" placeholder="mm/dd/yyyy" name="rdate"
							required="required"></td>
					</tr>
					<tr>
						<td><label>Review Text</label></td>
						<td>:</td>
						<td><textarea rows="5" cols="50" name="reviewt"
								placeholder="Your Review..."></textarea></td>
					</tr>
				</table>
				<br> <br> <input type="submit" value="Submit Review">
			</form>
		</section>



		<div class="clear"></div>



		<div class="foo">Copyright © www.gamespeed.co.in</div>
	</div>

</body>
</html>

<%
	}

	else if (request.getParameter("viewreview") != null) {
		MongoClient mg = new MongoClient("localhost", 27017);
		DB mdb = mg.getDB("Assignment3");

		DBCollection creviews = mdb.getCollection("CustomerReviews");

		BasicDBObject bdo = new BasicDBObject();
		bdo.put("productName", prname);

		DBCursor c = creviews.find(bdo);
%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>User Reviews</title>
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

		<section id="desc">
			<h2>
				User Reviews:
				<%=prname%></h2>

			<%
				if (c.count() == 0) {
			%>

			<h1>No one has reviewed this product</h1>


			<%
				} else {
			%>

			<table class="query-table" align="left">
				<%
					while (c.hasNext()) {
								BasicDBObject bd = (BasicDBObject) c.next();
				%>

				<tr>
					<td>Product Name</td>
					<td>:</td>
					<td><%=bd.getString("productName")%></td>
				</tr>

				<tr>
					<td>Product Category</td>
					<td>:</td>
					<td><%=bd.getString("productCategory")%></td>
				</tr>

				<tr>
					<td>Product Price</td>
					<td>:</td>
					<td><%=bd.getDouble("productPrice")%></td>
				</tr>

				<tr>
					<td>Retailer</td>
					<td>:</td>
					<td><%=bd.getString("retailerName")%></td>
				</tr>

				<tr>
					<td>Zip Code</td>
					<td>:</td>
					<td><%=bd.getString("retailerZipcode")%></td>
				</tr>

				<tr>
					<td>City</td>
					<td>:</td>
					<td><%=bd.getString("retailerCity")%></td>
				</tr>

				<tr>
					<td>State</td>
					<td>:</td>
					<td><%=bd.getString("retailerState")%></td>
				</tr>

				<tr>
					<td>Product on Sale</td>
					<td>:</td>
					<td><%=bd.getString("productOnSale")%></td>
				</tr>

				<tr>
					<td>Manufacturer Name</td>
					<td>:</td>
					<td><%=bd.getString("consoleManufacturer")%></td>
				</tr>

				<tr>
					<td>Manufacturer Rebate</td>
					<td>:</td>
					<td><%=bd.getString("manufacturerRebate")%></td>
				</tr>

				<tr>
					<td>User Id</td>
					<td>:</td>
					<td><%=bd.getString("userID")%></td>
				</tr>

				<tr>
					<td>Age</td>
					<td>:</td>
					<td><%=bd.getInt("userAge")%></td>
				</tr>

				<tr>
					<td>Gender</td>
					<td>:</td>
					<td><%=bd.getString("userGender")%></td>
				</tr>

				<tr>
					<td>Occupation</td>
					<td>:</td>
					<td><%=bd.getString("userOccupation")%></td>
				</tr>

				<tr>
					<td>Review Rating</td>
					<td>:</td>
					<td><%=bd.getInt("reviewRating")%></td>
				</tr>

				<tr>
					<td>Review Date</td>
					<td>:</td>
					<td><%=bd.getString("reviewDate")%></td>
				</tr>

				<tr>
					<td>Review Text</td>
					<td>:</td>
					<td><%=bd.getString("reviewText")%></td>
				</tr>


				<%
					}
				%>
			</table>
			<%
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



		<div class="foo">Copyright © www.gamespeed.co.in</div>
	</div>

</body>
</html>
<%
	} else if (request.getParameter("addtocart") != null) {
		String userid = (String) request.getSession().getAttribute(
				"username");
		String productName = request.getParameter("prname");
		double productPrice = Double.parseDouble(request
				.getParameter("prprice"));
		

		MongoClient mg = new MongoClient("localhost", 27017);
		DB mdb = mg.getDB("Assignment3");

		DBCollection products = mdb.getCollection("Products");
		BasicDBObject bdo = new BasicDBObject();
		bdo.put("field0", productName);
		DBCursor c = products.find(bdo);
		BasicDBObject bd = null;
		while (c.hasNext()) {
			bd = (BasicDBObject) c.next();
		}
		String imageName = bd.getString("field8");
		String manrebate = bd.getString("field6");
		String retdiscount = bd.getString("field7");
		double rebate = Double.parseDouble(manrebate);
		double discount = Double.parseDouble(retdiscount);

		productPrice = productPrice - (rebate + discount);

		double quantity = 1;
		double total = (productPrice * quantity);

		DBCollection ccart = mdb.getCollection("CustomerCart");
		BasicDBObject bdo1 = new BasicDBObject("name", "value")
				.append("userName", userid)
				.append("imageName", imageName)
				.append("productName", productName)
				.append("productPrice", productPrice)
				.append("productQuantity", quantity)
				.append("totalCost", total);

		BasicDBObject bdo2 = new BasicDBObject();
		bdo2.put("productName", prname);
		bdo2.put("userName", userid);
		DBCursor c1 = ccart.find(bdo2);
		BasicDBObject bd2 = null;
		if (c1.count() == 0) {
			ccart.insert(bdo1);
			response.sendRedirect("ViewCart.jsp");
		} else {
			while (c1.hasNext()) {
				bd2 = (BasicDBObject) c1.next();
			}
			double updatedQuan = bd2.getDouble("productQuantity") + 1;
			double updatedTot = (bd2.getDouble("productPrice") * updatedQuan);
			BasicDBObject bdo3 = new BasicDBObject().append(
					"$set",
					new BasicDBObject().append("productQuantity",
							updatedQuan)
							.append("totalCost", updatedTot));
			BasicDBObject bdo4 = new BasicDBObject().append("userName",
					userid).append("productName", prname);
			ccart.update(bdo4, bdo3);
			response.sendRedirect("ViewCart.jsp");
		}

	}
%>