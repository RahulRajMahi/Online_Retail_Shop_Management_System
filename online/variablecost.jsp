<%@page import="java.sql.*"%>
<html>
<head>
<title>
Variable Cost Info
</title>
</head>
<body>
<%
String mname,yearnm;
double ebill,tbill,srent;
mname=request.getParameter("month_name");
yearnm=request.getParameter("year");
ebill=Double.parseDouble(request.getParameter("electricity_bill"));
tbill=Double.parseDouble(request.getParameter("telephone_bill"));
srent=Double.parseDouble(request.getParameter("shop_rent"));
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into variable_cost values('"+mname+"',"+yearnm+","+ebill+","+tbill+","+srent+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Variable Cost Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="variablecostinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
<%
}
catch(Exception ex)
{
	%>
	<%=ex.getMessage()%>
	<%
}
%>
</body>
</html>