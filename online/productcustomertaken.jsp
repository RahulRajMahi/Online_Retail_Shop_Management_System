<%@page import="java.sql.*"%>
<html>
<head>
<title>
ProductCustomerTaken
</title>
</head>
<body>
<%
String id,pd,qt;
id=request.getParameter("cid");
pd=request.getParameter("pid");
qt=request.getParameter("qty");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into product_customer_taken values('"+id+"','"+pd+"',"+qt+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Product Customer Taken Info Successfully Completed....</h1>
	<h2> Do u want more entry..<a href="prodcust-taken.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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