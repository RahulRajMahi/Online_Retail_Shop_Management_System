<%@ page import="java.sql.*"%>
<html>
<head>
<title>
CompanyDistributor
</title>
</head>
<body>
<%
String id,cnm;
cnm=request.getParameter("cname");
id=request.getParameter("dfid");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into company_distributor values('"+cnm+"','"+id+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Company-Distributor Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="companydistributor.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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