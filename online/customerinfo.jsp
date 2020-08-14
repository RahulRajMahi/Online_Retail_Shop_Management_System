<%@page import="java.sql.*"%>
<html>
<head>
<title>
Customer Info
</title>
</head>
<body>
<%
String cid,cname,cadd,cmno,ceid,ctype;
cid=request.getParameter("cust_id");
cname=request.getParameter("cust_name");
cadd=request.getParameter("cust_address");
cmno=request.getParameter("cust_mobile_no");
ceid=request.getParameter("cust_email_id");
ctype=request.getParameter("ctype");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into customer_info values('"+cid+"','"+cname+"','"+cadd+"','"+cmno+"','"+ceid+"','"+ctype+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Customer Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="customerinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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