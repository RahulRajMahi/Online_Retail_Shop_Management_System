<%@page import="java.sql.*"%>
<html>
<head>
<title>
Tax Info
</title>
</head>
<body>
<%
String tid,ttype,tamt;
tid=request.getParameter("tax_id");
ttype=request.getParameter("tax_type");
tamt=request.getParameter("tax_amount");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into tax values('"+tid+"','"+ttype+"',"+tamt+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Tax Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="taxinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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