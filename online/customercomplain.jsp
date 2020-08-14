<%@page import="java.sql.*"%>
<html>
<head>
<title>
CustomerComplain
</title>
</head>
<body>
<%
String id,date,no,type,st,ctg,pid,dd,mm,yy;
id=request.getParameter("cust_id");
no=request.getParameter("cmpno");
type=request.getParameter("cmptype");
st=request.getParameter("cmpst");
ctg=request.getParameter("pctg");
pid=request.getParameter("pid");
dd=request.getParameter("dt");
mm=request.getParameter("mon");
yy=request.getParameter("year");
try
{
	date=dd + "/" + mm + "/" + yy;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into customer_complain values('"+id+"','"+date+"','"+no+"','"+type+"','"+st+"','"+ctg+"','"+pid+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Customer-Complain Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="customercomplain.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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