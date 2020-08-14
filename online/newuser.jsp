<%@ page import="java.sql.*"%>
<%
String uname=request.getParameter("user");
String pass1=request.getParameter("passwd");
String pass2=request.getParameter("repasswd");
String utyp=request.getParameter("utype");
String hint=request.getParameter("hques");
if(uname!=null)
{
	try{
	if(pass1.equals(pass2))
	{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url="jdbc:odbc:retailshopdbdsn";
		Connection con=DriverManager.getConnection(url);
		java.sql.Statement stmt=con.createStatement();
			String sql="select * from log_in Where user_name='" + uname +"'";
			ResultSet rs=stmt.executeQuery(sql);
			if(rs.next())
			{
				%> UserId/Login Already Created.....<br>Choose Another Login ID <a href="newuser.html" target="details">Back</a>
					<br>
			<%
			}
			else
			{
			sql="insert into log_in values('"+uname+"','"+pass1+"','"+utyp+"','"+hint+"')";
			stmt.executeUpdate(sql);
			%>User Created.....<a href="newuser.htm">Back</a>
			<%}
	}
	
	else
	{
		%><b>Password MisMatch........Try Agin</b><%
	}

	}	
	catch(Exception ex)
	{ %>
	<%=ex.getMessage()%>
	<%
        }
}
else
{
%>
	Invalid User Name <br>
<%
}
%>