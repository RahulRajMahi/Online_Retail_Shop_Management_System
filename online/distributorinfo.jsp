<%@page import="java.sql.*"%>
<html>
<head>
<title>
Distributor Info
</title>
</head>
<body>
<%
String did,name,cno,add,eid;
did=request.getParameter("distributor_firm_id");
name=request.getParameter("distributor_name");
cno=request.getParameter("distributor_contact_no");
add=request.getParameter("distributor_address");
eid=request.getParameter("distributor_email_id");
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into distributor_info values('"+did+"','"+name+"','"+cno+"','"+add+"','"+eid+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Distributor Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="distributorinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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
	