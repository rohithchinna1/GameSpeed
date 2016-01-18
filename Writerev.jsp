<%@page import="com.mongodb.DB"%>
<%@page import="com.mongodb.MongoClient"%>
<%@page import="com.mongodb.DBCollection"%>
<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="com.mongodb.MongoException"%>
<%
	try {
		String pmodel = request.getParameter("pmodel");
		String pcategory = request.getParameter("pcategory");
		double pprice = Double.parseDouble(request
				.getParameter("pprice"));
		String retailer = request.getParameter("retailer");
		String rzip = request.getParameter("rzip");
		String rcity = request.getParameter("rcity");
		String rstate = request.getParameter("rstate");
		String pos = request.getParameter("pos");
		String mname = request.getParameter("mname");
		String mrebate = request.getParameter("mrebate");
		String userid = request.getParameter("userid");
		int uage = Integer.parseInt(request.getParameter("uage"));
		String gender = request.getParameter("gender");
		String occu = request.getParameter("occu");
		int rating = Integer.parseInt(request.getParameter("rating"));
		String rdate = request.getParameter("rdate");
		String reviewt = request.getParameter("reviewt");

		MongoClient mg = new MongoClient("localhost", 27017);
		DB mdb = mg.getDB("Assignment3");

		DBCollection creviews = mdb.getCollection("CustomerReviews");

		BasicDBObject bdo = new BasicDBObject("name", "value")
				.append("productName", pmodel)
				.append("productCategory", pcategory)
				.append("productPrice", pprice)
				.append("retailerName", retailer)
				.append("retailerZipcode", rzip)
				.append("retailerCity", rcity)
				.append("retailerState", rstate)
				.append("productOnSale", pos)
				.append("consoleManufacturer", mname)
				.append("manufacturerRebate", mrebate)
				.append("userID", userid).append("userAge", uage)
				.append("userGender", gender)
				.append("userOccupation", occu)
				.append("reviewRating", rating)
				.append("reviewDate", rdate)
				.append("reviewText", reviewt);

		creviews.insert(bdo);
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="StyleSheet.css">
<title>Write Review</title>
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

			<h1 align="center">
				Thank You <br> Your Review has been successfully submitted
			</h1>
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
<%} catch (MongoException m) {
		m.printStackTrace();
	}
%>