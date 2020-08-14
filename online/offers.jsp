<%@page import="java.sql.*"%>
<html>
<head>
<title>
Offers Info
</title>
</head>
<body>
<%
String oid,oname,c_type,o_laun_at,o_ends_at,pid,dper,dd,ddd,mm,mmm,yy,yyy;
oid=request.getParameter("offer_id");
oname=request.getParameter("offer_name");
c_type=request.getParameter("ctype");
pid=request.getParameter("product_id");
dper=request.getParameter("discount_per");
dd=request.getParameter("dt");
mm=request.getParameter("mon");
yy=request.getParameter("year");
ddd=request.getParameter("dte");
mmm=request.getParameter("mn");
yyy=request.getParameter("yr");
try
{
	o_laun_at=dd + "/" + mm + "/" + yy;
	o_ends_at=ddd + "/" + mmm + "/" + yyy;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into offers values('"+oid+"','"+oname+"','"+c_type+"','"+o_laun_at+"','"+o_ends_at+"','"+pid+"',"+dper+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Offers Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="offersinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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