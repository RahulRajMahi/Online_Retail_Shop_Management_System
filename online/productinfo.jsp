<%@page import="java.sql.*"%>
<html>
<head>
<title>
Product Info
</title>
</head>
<body>
<%
String pid,mrp,p_cat,pkd,bst,name,com,land,dd,mm,yy,ddd,mmm,yyy;
pid=request.getParameter("product_id");
mrp=request.getParameter("product_mrp");
p_cat=request.getParameter("p_category");
name=request.getParameter("product_name");
com=request.getParameter("product_company");
land=request.getParameter("product_landing_rate");
dd=request.getParameter("dt");
mm=request.getParameter("mon");
yy=request.getParameter("year");
ddd=request.getParameter("dte");
mmm=request.getParameter("mn");
yyy=request.getParameter("yr");
try
{
	pkd=dd + "/" + mm + "/" + yy;
	bst=ddd + "/" + mmm + "/" + yyy;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into product_info values('"+pid+"',"+mrp+",'"+p_cat+"','"+pkd+"','"+bst+"','"+name+"','"+com+"',"+land+")";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Product Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="productinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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