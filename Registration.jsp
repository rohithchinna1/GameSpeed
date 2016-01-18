<%@page import=" com.mongodb.*"%>
<%
String loginas = request.getParameter("login");
String uname = request.getParameter("email");
String upass = request.getParameter("password");
String cpass = request.getParameter("cpassword");

if(loginas.equals("customer")){
MongoClient mg = new MongoClient("localhost", 27017);
DB mdb = mg.getDB("Assignment3");

DBCollection cdetails = mdb.getCollection("Cdetails");
if(upass.equals(cpass)){
	
BasicDBObject bdo = new BasicDBObject("name", "pass").append("username", uname)
.append("password", upass);

cdetails.insert(bdo);
response.sendRedirect("Log.jsp");
}
else{
	out.println("<html>");
	out.println("<head><title>Wrong Password</title></head>");
	out.println("<body align='center'>Passwords do not match<br>");
	out.println("<br><a href='Reg.jsp'>Back</a>");
	out.println("</html>");
}
}

else if(loginas.equals("smanager")){
	MongoClient mg = new MongoClient("localhost", 27017);
	DB mdb = mg.getDB("Assignment3");

	DBCollection smdetails = mdb.getCollection("Smdetails");
	if(upass.equals(cpass)){
		
	BasicDBObject bdo = new BasicDBObject("name", "pass").append("username", uname)
	.append("password", upass);

	smdetails.insert(bdo);
	response.sendRedirect("Log.jsp");
}
	else{
		out.println("<html>");
		out.println("<head><title>Wrong Password</title></head>");
		out.println("<body align='center'>Passwords do not match<br>");
		out.println("<br><a href='Reg.jsp'>Back</a>");
		out.println("</html>");
	}
}
	
	else if(loginas.equals("salesman")){
		MongoClient mg = new MongoClient("localhost", 27017);
		DB mdb = mg.getDB("Assignment3");

		DBCollection sdetails = mdb.getCollection("Sdetails");
		if(upass.equals(cpass)){
			
		BasicDBObject bdo = new BasicDBObject("name", "pass").append("username", uname)
		.append("password", upass);

		sdetails.insert(bdo);
		response.sendRedirect("Log.jsp");
	}
		else{
			out.println("<html>");
			out.println("<head><title>Wrong Password</title></head>");
			out.println("<body align='center'>Passwords do not match<br>");
			out.println("<br><a href='Reg.jsp'>Back</a>");
			out.println("</html>");
		}
	}

%>