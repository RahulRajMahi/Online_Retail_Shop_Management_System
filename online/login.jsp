<%@ page import="java.sql.*"%>
<%
String uname=request.getParameter("userid");
String pwd=request.getParameter("password");
if(uname!=null)
{
	try{

	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	String url="jdbc:odbc:retailshopdbdsn";
	Connection con=DriverManager.getConnection(url);
	java.sql.Statement stmt=con.createStatement();
	String sql="select * from log_in Where user_name='" + uname + "' and password='"+ pwd +"'";
	ResultSet rs=stmt.executeQuery(sql);
	if(rs.next())
		{
			%>
			Welcome &nbsp;<b><%=uname%></b> &nbsp;&nbsp;&nbsp;PROCEED &nbsp;<a href="admin.htm" target="details">&nbsp;>>>&nbsp;</a>
			<%
		}
		
	else
		{
		%>
			Invalid UserName/Password<br>
			Would you like to <a href=login.htm>Try Again</a>
		<%
		}
		rs.close();
		stmt.close();
		con.close();
	}
	catch(Exception e)
	{ %>
	<%=e.getMessage()%>
	<%}
}
else
{%>
	Invalid User Name/Password<br><a href="login.htm" target="details">BACK</a>
<%
}
%>