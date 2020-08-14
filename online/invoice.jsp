<%@page import="java.sql.*"%>
<html>
<head>
<title>
invoice Info
</title>
</head>
<body>
<%
String ino,id,vt,dpr,dam,pam,dd,mm,yy,idate;
ino=request.getParameter("ivno");
id=request.getParameter("cid");
vt=request.getParameter("vat");
dpr=request.getParameter("dper");
dam=request.getParameter("damt");
pam=request.getParameter("pamt");
dd=request.getParameter("dt");
mm=request.getParameter("mon");
yy=request.getParameter("year");
try
{
	idate=dd + "/" + mm + "/" + yy;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into invoice values('"+ino+"','"+idate+"','"+id+"',"+vt+","+dpr+","+dam+","+pam+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Invoice Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="invoice.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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