<%@page import="java.util.Locale"%>
<%@page import="java.text.NumberFormat"%>
<%@page import=" com.mongodb.*"%>
<%
	String loginas = request.getParameter("login");
	String uname = request.getParameter("email");
	String upass = request.getParameter("password");
	request.getSession().setAttribute("username", uname);
	MongoClient mg = new MongoClient("localhost", 27017);
	DB mdb = mg.getDB("Assignment3");
	try {
		if (loginas.equals("customer")) {

			DBCollection cdetails = mdb.getCollection("Cdetails");

			BasicDBObject bdo = new BasicDBObject();

			bdo.put("username", uname);
			DBCursor c = cdetails.find(bdo);
			BasicDBObject bd = null;

			if (c.count() == 0) {
				out.println("<html>");
				out.println("<head><title>Invalid</title></head>");
				out.println("<body align='center'>Invalid Username/Password<br>");
				out.println("<br><a href='Log.jsp'>Try again</a>");
				out.println("</html>");
			} else {
				while (c.hasNext()) {
					bd = (BasicDBObject) c.next();
				}

				String Username = bd.getString("username");
				String Password = bd.getString("password");

				if (Username.equals(uname) && Password.equals(upass)) {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Home</title>
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
			<h2>Welcome</h2>

			<%
				DBCollection products = mdb
										.getCollection("Products");
								BasicDBObject bdbo = new BasicDBObject();
								BasicDBObject sort = new BasicDBObject();
								sort.put("field9", -1);
								DBCursor dbc = products.find(bdbo).sort(sort).limit(5);
								NumberFormat formatter = NumberFormat
										.getCurrencyInstance(Locale.US);

								if (dbc.count() == 0) {
									BasicDBObject bdbo1 = new BasicDBObject();
									bdbo1.append("field0", "Xbox1")
											.append("field1", "400")
											.append("field2", "Microsoft")
											.append("field3", "Gaming Console")
											.append("field4", "New")
											.append("field5", "Yes")
											.append("field6", "40")
											.append("field7", "0")
											.append("field8", "Xbox1.jpg")
											.append("field9",
													System.currentTimeMillis());
									BasicDBObject bdbo2 = new BasicDBObject();
									bdbo2.append("field0", "Xbox360")
											.append("field1", "450")
											.append("field2", "Microsoft")
											.append("field3", "Gaming Console")
											.append("field4", "Pre-Owned")
											.append("field5", "Yes")
											.append("field6", "0")
											.append("field7", "50")
											.append("field8", "Xbox360.jpg")
											.append("field9",
													System.currentTimeMillis());
									products.insert(bdbo1);
									products.insert(bdbo2);
									BasicDBObject bdb = new BasicDBObject();
									BasicDBObject sort1 = new BasicDBObject();
									sort1.put("field9", -1);
									DBCursor dbc1 = products.find(bdb).sort(sort1);

									while (dbc1.hasNext()) {

										BasicDBObject bdc = (BasicDBObject) dbc1
												.next();
			%>


			<form action="AddView.jsp" method="post">
				<input type="hidden" value="<%=bdc.getString("field0")%>"
					name="prname"> <input type="hidden"
					value="<%=bdc.getString("field1")%>" name="prprice">
				<table class="table-1" align="center">

					<tr>
						<th><%=bdc.getString("field0")%></th>
						<th>$<%=bdc.getString("field1")%>
						</th>
					</tr>

					<tr>
						<td rowspan="3"><img
							src="Images/<%=bdc.getString("field8")%>" height="200px"
							width="200px"></td>
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
						<th>Product type: <%=bdc.getString("field4")%></th>
						<th>Warranty: <%=bdc.getString("field5")%></th>
					</tr>


				</table>
			</form>

			<%
				}
								}

								else {
									while (dbc.hasNext()) {

										BasicDBObject bdc = (BasicDBObject) dbc
												.next();
			%>


			<form action="AddView.jsp" method="post">
				<input type="hidden" value="<%=bdc.getString("field0")%>"
					name="prname"> <input type="hidden"
					value="<%=bdc.getString("field1")%>" name="prprice">
				<table class="table-1" align="center">

					<tr>
						<th><%=bdc.getString("field0")%></th>
						<th>$<%=bdc.getString("field1")%>
						</th>
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
						<th>Product type: <%=bdc.getString("field4")%></th>
						<th>Warranty: <%=bdc.getString("field5")%></th>
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



		<div class="foo">Copyright © www.gamespeed.co.in</div>
	</div>

</body>
</html>

<%
	}

				else {
					out.println("<html>");
					out.println("<head><title>Invalid</title></head>");
					out.println("<body align='center'>Invalid Username/Password<br>");
					out.println("<br><a href='Log.jsp'>Try again</a>");
					out.println("</html>");
				}
			}
		}

		else if (loginas.equals("smanager")) {

			DBCollection smdetails = mdb.getCollection("Smdetails");

			BasicDBObject bdo = new BasicDBObject();

			bdo.put("username", uname);
			DBCursor c = smdetails.find(bdo);
			BasicDBObject bd = null;

			if (c.count() == 0) {
				out.println("<html>");
				out.println("<head><title>Invalid</title></head>");
				out.println("<body align='center'>Invalid Username/Password<br>");
				out.println("<br><a href='Log.jsp'>Try again</a>");
				out.println("</html>");
			} else {
				while (c.hasNext()) {
					bd = (BasicDBObject) c.next();
				}

				String Username = bd.getString("username");
				String Password = bd.getString("password");

				if (Username.equals(uname) && Password.equals(upass)) {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Store Manager</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>

<nav>
	<ul>
		<li><a href="#" class="home"><font face="Cambria">HOME</font></a></li>
		<li><a href="#" class="microsoft"><font face="Cambria">MICROSOFT</font></a></li>
		<li><a href="#" class="sony"><font face="Cambria">SONY</font></a></li>
		<li><a href="#" class="nintendo"><font face="Cambria">NINTENDO</font></a></li>
	</ul>
	<a href="Log.jsp">SIGN OUT</a> <a href="#">WELCOME</a>

</nav>

<body class="index">

	<section class="cl">
		<form action="StoreManager.jsp" method="post"
			enctype="multipart/form-data">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>

					<td><input type="text" name="pname" required="required"></td>
				</tr>
				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" step="any" name="pprice"
						required="required" min="0"></td>
				</tr>
				<tr>
				<tr>
					<td><label>Manufacturer Name:</label></td>

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
					<td><label>Product Category:</label></td>

					<td><select name="pcat">
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
					<td><label>Product type:</label></td>

					<td><select name="ptype">
							<option value="New">New</option>
							<option value="Pre-Owned">Pre-Owned</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Warranty:</label></td>

					<td><select name="warranty">
							<option value="Yes">Yes</option>
							<option value="No">No</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Manufacturer Rebate:</label></td>

					<td><input type="number" name="manurebate" min="0"
						required="required" step="any"></td>
				</tr>
				<tr>
					<td><label>Retailer Discount:</label></td>

					<td><input type="number" name="rdiscount" min="0"
						required="required" step="any"></td>
				</tr>
				<tr>
					<td><label>Image:</label></td>

					<td><input type="file" name="pimage" accept="image/*"></td>
				</tr>


				<tr>
					<th><input type="submit" value="Add Product"></th>
				</tr>
			</table>


		</form>

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>

		<form action="StoreManager1.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="deldropdown">
							<%
								DBCollection products = mdb
														.getCollection("Products");
												BasicDBObject bdbo = new BasicDBObject();
												DBCursor dbc = products.find(bdbo);

												if (dbc.count() == 0) {
							%>

							<option value="noProducts">No Products</option>

							<%
								}

												else {
													while (dbc.hasNext()) {

														BasicDBObject bdc = (BasicDBObject) dbc
																.next();
							%>

							<option value="<%=bdc.getString("field0")%>"><%=bdc.getString("field0")%>
							</option>

							<%
								}
												}
							%>
					</select></td>
				</tr>
				<tr>
					<th><input type="submit" value="Delete Product" name="delp"></th>
				</tr>
			</table>
		</form>

		<br> <br> <br> <br> <br> <br>

		<form action="StoreManager1.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>

					<td><select name="updropdown">
							<%
								BasicDBObject bdbo1 = new BasicDBObject();
												DBCursor dbc1 = products.find(bdbo1);

												if (dbc.count() == 0) {
							%>

							<option value="noProducts">No Products</option>

							<%
								}

												else {
													while (dbc1.hasNext()) {

														BasicDBObject bdc = (BasicDBObject) dbc1
																.next();
							%>

							<option value="<%=bdc.getString("field0")%>"><%=bdc.getString("field0")%>
							</option>

							<%
								}
												}
							%>
					</select></td>
				</tr>
				<tr>
					<td><label>Product Name:</label></td>
					<td><input type="text" name="pname" required="required">
					</td>
				</tr>
				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" name="pprice" required="required" step="any" min="0"></td>
				</tr>

				<tr>
					<td><label>Product type:</label></td>

					<td><select name="ptype">
							<option value="New">New</option>
							<option value="Pre-Owned">Pre-Owned</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Warranty:</label></td>

					<td><select name="warranty">
							<option value="Yes">Yes</option>
							<option value="No">No</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Manufacturer Rebate:</label></td>

					<td><input type="number" name="manurebate" min="0"
						required="required" step="any"></td>
				</tr>
				<tr>
					<td><label>Retailer Discount:</label></td>

					<td><input type="number" name="rdiscount" min="0"
						required="required" step="any"></td>
				</tr>



				<tr>
					<th><input type="submit" value="Update Product" name="upp"></th>
				</tr>
			</table>


		</form>


	</section>

</body>
<footer class="foot"> Copyright © www.gamespeed.co.in </footer>
</html>

<%
	}

				else {
					out.println("<html>");
					out.println("<head><title>Invalid</title></head>");
					out.println("<body align='center'>Invalid Username/Password<br>");
					out.println("<br><a href='Log.jsp'>Try again</a>");
					out.println("</html>");
				}
			}
		}

		else if (loginas.equals("salesman")) {

			DBCollection sdetails = mdb.getCollection("Sdetails");

			BasicDBObject bdo = new BasicDBObject();

			bdo.put("username", uname);
			DBCursor c = sdetails.find(bdo);
			BasicDBObject bd = null;

			if (c.count() == 0) {
				out.println("<html>");
				out.println("<head><title>Invalid</title></head>");
				out.println("<body align='center'>Invalid Username/Password<br>");
				out.println("<br><a href='Log.jsp'>Try again</a>");
				out.println("</html>");
			} else {
				while (c.hasNext()) {
					bd = (BasicDBObject) c.next();
				}

				String Username = bd.getString("username");
				String Password = bd.getString("password");

				if (Username.equals(uname) && Password.equals(upass)) {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Salesman</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>

<nav>
	<ul>
		<li><a href="#" class="home"><font face="Cambria">HOME</font></a></li>
		<li><a href="#" class="microsoft"><font face="Cambria">MICROSOFT</font></a></li>
		<li><a href="#" class="sony"><font face="Cambria">SONY</font></a></li>
		<li><a href="#" class="nintendo"><font face="Cambria">NINTENDO</font></a></li>
	</ul>
	<a href="Log.jsp">SIGN OUT</a> <a href="#">WELCOME</a>

</nav>

<body class="index">

	<section class="cl">

		<form action="Salesman.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Email Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td><label>New Password:</label></td>

					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td><label>Confirm Password:</label></td>

					<td><input type="password" name="cpassword"
						required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Create Account"
						name="createacc"></td>
				</tr>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								DBCollection products = mdb
														.getCollection("Products");
												BasicDBObject bdbo1 = new BasicDBObject();
												DBCursor dbc1 = products.find(bdbo1);
												if (dbc1.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
													while (dbc1.hasNext()) {

														BasicDBObject bdc1 = (BasicDBObject) dbc1
																.next();
							%>

							<option value="<%=bdc1.getString("field0")%>"><%=bdc1.getString("field0")%></option>


							<%
								}
												}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Quantity:</label></td>

					<td><input type="number" name="quantity" required="required" min="0"></td>
				</tr>


				<tr>
					<td><input type="submit" value="Add Order" name="addorder"></td>
				</tr>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">

				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Order Id:</label></td>

					<td><input type="text" name="orderid" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								BasicDBObject bdbo2 = new BasicDBObject();
												DBCursor dbc2 = products.find(bdbo2);
												if (dbc2.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
													while (dbc2.hasNext()) {

														BasicDBObject bdc2 = (BasicDBObject) dbc2
																.next();
							%>

							<option value="<%=bdc2.getString("field0")%>"><%=bdc2.getString("field0")%></option>


							<%
								}
												}
							%>
					</select></td>
				</tr>

				<tr>
					<td><input type="submit" value="Delete Order" name="delorder"></td>
				</tr>
			</table>
		</form>

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">

				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Order Id:</label></td>

					<td><input type="text" name="orderid" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								BasicDBObject bdbo3 = new BasicDBObject();
												DBCursor dbc3 = products.find(bdbo3);
												if (dbc3.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
													while (dbc3.hasNext()) {

														BasicDBObject bdc3 = (BasicDBObject) dbc3
																.next();
							%>

							<option value="<%=bdc3.getString("field0")%>"><%=bdc3.getString("field0")%></option>


							<%
								}
												}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" name="prprice" required="required" step="any" min="0"></td>
				</tr>

				<tr>
					<td><label>Quantity:</label></td>

					<td><input type="number" name="quantity" required="required" min="0"></td>
				</tr>

				<tr>
					<td><input type="submit" value="Update Order" name="uporder"></td>
				</tr>
			</table>
		</form>

	</section>

</body>
<footer class="foot"> Copyright © www.gamespeed.co.in </footer>
</html>

<%
	}

				else {
					out.println("<html>");
					out.println("<head><title>Invalid</title></head>");
					out.println("<body align='center'>Invalid Username/Password<br>");
					out.println("<br><a href='Log.jsp'>Try again</a>");
					out.println("</html>");
				}
			}
		}
	} catch (Exception e) {
		if (request.getParameter("Back") != null) {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Salesman</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>

<nav>
	<ul>
		<li><a href="#" class="home"><font face="Cambria">HOME</font></a></li>
		<li><a href="#" class="microsoft"><font face="Cambria">MICROSOFT</font></a></li>
		<li><a href="#" class="sony"><font face="Cambria">SONY</font></a></li>
		<li><a href="#" class="nintendo"><font face="Cambria">NINTENDO</font></a></li>
	</ul>
	<a href="Log.jsp">SIGN OUT</a> <a href="#">WELCOME</a>

</nav>

<body class="index">

	<section class="cl">

		<form action="Salesman.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Email Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>
				<tr>
					<td><label>New Password:</label></td>

					<td><input type="password" name="password" required="required"></td>
				</tr>
				<tr>
					<td><label>Confirm Password:</label></td>

					<td><input type="password" name="cpassword"
						required="required"></td>
				</tr>
				<tr>
					<td><input type="submit" value="Create Account"
						name="createacc"></td>
				</tr>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								DBCollection products = mdb.getCollection("Products");
										BasicDBObject bdbo1 = new BasicDBObject();
										DBCursor dbc1 = products.find(bdbo1);
										if (dbc1.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
											while (dbc1.hasNext()) {

												BasicDBObject bdc1 = (BasicDBObject) dbc1.next();
							%>

							<option value="<%=bdc1.getString("field0")%>"><%=bdc1.getString("field0")%></option>


							<%
								}
										}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Quantity:</label></td>

					<td><input type="number" name="quantity" required="required" min="0"></td>
				</tr>


				<tr>
					<td><input type="submit" value="Add Order" name="addorder"></td>
				</tr>
			</table>
		</form>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">

				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Order Id:</label></td>

					<td><input type="text" name="orderid" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								BasicDBObject bdbo2 = new BasicDBObject();
										DBCursor dbc2 = products.find(bdbo2);
										if (dbc2.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
											while (dbc2.hasNext()) {

												BasicDBObject bdc2 = (BasicDBObject) dbc2.next();
							%>

							<option value="<%=bdc2.getString("field0")%>"><%=bdc2.getString("field0")%></option>


							<%
								}
										}
							%>
					</select></td>
				</tr>

				<tr>
					<td><input type="submit" value="Delete Order" name="delorder"></td>
				</tr>
			</table>
		</form>
		
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<form action="Salesman.jsp">
			<table class="query-table" align="left">

				<tr>
					<td><label>User Id:</label></td>

					<td><input type="email" name="email" required="required"></td>
				</tr>

				<tr>
					<td><label>Order Id:</label></td>

					<td><input type="text" name="orderid" required="required"></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="productnamedropdown">
							<%
								BasicDBObject bdbo3 = new BasicDBObject();
												DBCursor dbc3 = products.find(bdbo3);
												if (dbc3.count() == 0) {
							%>

							<option value="noproducts">No Products</option>

							<%
								} else {
													while (dbc3.hasNext()) {

														BasicDBObject bdc3 = (BasicDBObject) dbc3
																.next();
							%>

							<option value="<%=bdc3.getString("field0")%>"><%=bdc3.getString("field0")%></option>


							<%
								}
												}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" name="prprice" required="required" step="any" min="0"></td>
				</tr>

				<tr>
					<td><label>Quantity:</label></td>

					<td><input type="number" name="quantity" required="required" min="0"></td>
				</tr>

				<tr>
					<td><input type="submit" value="Update Order" name="uporder"></td>
				</tr>
			</table>
		</form>
		
		
	</section>

</body>
<footer class="foot"> Copyright © www.gamespeed.co.in </footer>
</html>

<%
	} else {
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Store Manager</title>
</head>

<header>
	<h1>
		<font face="Cambria">GAMESPEED</font>
	</h1>
</header>

<nav>
	<ul>
		<li><a href="#" class="home"><font face="Cambria">HOME</font></a></li>
		<li><a href="#" class="microsoft"><font face="Cambria">MICROSOFT</font></a></li>
		<li><a href="#" class="sony"><font face="Cambria">SONY</font></a></li>
		<li><a href="#" class="nintendo"><font face="Cambria">NINTENDO</font></a></li>
	</ul>
	<a href="Log.jsp">SIGN OUT</a> <a href="#">WELCOME</a>

</nav>

<body class="index">

	<section class="cl">
		<form action="StoreManager.jsp" method="post"
			enctype="multipart/form-data">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>

					<td><input type="text" name="pname" required="required"></td>
				</tr>
				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" step="any" name="pprice"
						required="required" min="0"></td>
				</tr>
				<tr>
				<tr>
					<td><label>Manufacturer Name:</label></td>

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
					<td><label>Product Category:</label></td>

					<td><select name="pcat">
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
					<td><label>Product type:</label></td>

					<td><select name="ptype">
							<option value="New">New</option>
							<option value="Pre-Owned">Pre-Owned</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Warranty:</label></td>

					<td><select name="warranty">
							<option value="Yes">Yes</option>
							<option value="No">No</option>

					</select></td>
				</tr>

				<tr>
					<td><label>Manufacturer Rebate:</label></td>

					<td><input type="number" name="manurebate" min="0"
						required="required" step="any"></td>
				</tr>
				<tr>
					<td><label>Retailer Discount:</label></td>

					<td><input type="number" name="rdiscount" min="0"
						required="required" step="any"></td>
				</tr>

				<tr>
					<td><label>Image:</label></td>

					<td><input type="file" name="pimage" accept="image/*"></td>
				</tr>


				<tr>
					<th><input type="submit" value="Add Product"></th>
				</tr>
			</table>


		</form>

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>

		<form action="StoreManager1.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>
					<td><select name="deldropdown">
							<%
								DBCollection products = mdb.getCollection("Products");
										BasicDBObject bdbo = new BasicDBObject();
										DBCursor dbc = products.find(bdbo);

										if (dbc.count() == 0) {
							%>

							<option value="noProducts">No Products</option>

							<%
								}

										else {
											while (dbc.hasNext()) {

												BasicDBObject bdc = (BasicDBObject) dbc.next();
							%>

							<option value="<%=bdc.getString("field0")%>"><%=bdc.getString("field0")%>
							</option>

							<%
								}
										}
							%>
					</select></td>
				</tr>
				<tr>
					<th><input type="submit" value="Delete Product" name="delp"></th>
				</tr>
			</table>
		</form>

		<br> <br> <br> <br> <br> <br>

		<form action="StoreManager1.jsp">
			<table class="query-table" align="left">
				<tr>
					<td><label>Product Name:</label></td>

					<td><select name="updropdown">
							<%
								BasicDBObject bdbo1 = new BasicDBObject();
										DBCursor dbc1 = products.find(bdbo1);

										if (dbc.count() == 0) {
							%>

							<option value="noProducts">No Products</option>

							<%
								}

										else {
											while (dbc1.hasNext()) {

												BasicDBObject bdc = (BasicDBObject) dbc1.next();
							%>

							<option value="<%=bdc.getString("field0")%>"><%=bdc.getString("field0")%>
							</option>

							<%
								}
										}
							%>
					</select></td>
				</tr>

				<tr>
					<td><label>Product Name:</label></td>
					<td><input type="text" name="pname" required="required">
					</td>
				</tr>
				<tr>
				<tr>
					<td><label>Product Price:</label></td>

					<td><input type="number" name="pprice" required="required" step="any" min="0"></td>
				</tr>

				<tr>
					<td><label>Product type:</label></td>

					<td><select name="ptype">
							<option value="New">New</option>
							<option value="Pre-Owned">Pre-Owned</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Warranty:</label></td>

					<td><select name="warranty">
							<option value="Yes">Yes</option>
							<option value="No">No</option>

					</select></td>
				</tr>
				<tr>
					<td><label>Manufacturer Rebate:</label></td>

					<td><input type="number" name="manurebate" min="0"
						required="required" step="any"></td>
				</tr>
				<tr>
					<td><label>Retailer Discount:</label></td>

					<td><input type="number" name="rdiscount" min="0"
						required="required" step="any"></td>
				</tr>


				<tr>
					<th><input type="submit" value="Update Product" name="upp"></th>
				</tr>
			</table>


		</form>


	</section>

</body>
<footer class="foot"> Copyright © www.gamespeed.co.in </footer>
</html>
<%
	}
	}
%>