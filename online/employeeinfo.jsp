<%@page import="java.sql.*"%>
<html>
<head>
<title>
Employee Info
</title>
</head>
<body>
<%
String eid,emno,ename,eadd,ejoin,esex,dd,mm,yy;
double esal;
eid=request.getParameter("emp_id");
ename=request.getParameter("emp_name");
eadd=request.getParameter("emp_address");
emno=request.getParameter("emp_mobile_no");
esal=Double.parseDouble(request.getParameter("emp_salary"));
esex=request.getParameter("emp_sex");
dd=request.getParameter("dt");
mm=request.getParameter("mon");
yy=request.getParameter("year");
try
{
	ejoin=dd + "/" + mm + "/" + yy;
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:retailshopdbdsn");
	java.sql.Statement stmt=con.createStatement();
	String sql="insert into employee_info values('"+eid+"','"+ename+"',"+emno+",'"+eadd+"','"+ejoin+"',"+esal+",'"+esex+"')";
	stmt.executeUpdate(sql);
	stmt.executeUpdate("commit");
	stmt.close();
	con.close();
	%>
	<h1> Thank You..!!!! Employee Info Taken Successfully....</h1>
	<h2> Do u want more entry..<a href="employeeinfoentry.htm">Click Here..</a> Go To Home Page..??<a href="home.htm">click Here..</a><h2>
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