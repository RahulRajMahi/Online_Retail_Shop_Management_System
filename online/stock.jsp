<%@page import="java.sql.*"%>
<html>
<head>
<title>
Stock Info
</title>
</head>
<body>
<%
String pi,no,ctg;
pi=request.getParameter("pid");
no=request.getParameter("nop");
ctg=request.getParameter("pctg");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into stock values('"+pi+"',"+no+",'"+ctg+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Stock Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="stock.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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