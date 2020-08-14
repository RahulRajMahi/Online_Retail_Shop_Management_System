<%@ page import="java.sql.*"%>

<%
String uname=request.getParameter("userid");
String hint=request.getParameter("hint");

if(uname!=null && hint!=null)
{
	try{
	
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		String url="jdbc:odbc:retailshopdbdsn";
		Connection con=DriverManager.getConnection(url);
		java.sql.Statement stmt=con.createStatement();
		String sql="select * from log_in Where user_name='" + uname +"'";
		ResultSet rs=stmt.executeQuery(sql);
		if(rs.next())
		{
			%> 
				<b><%=rs.getString("password")%></b>
			<%
		}
		else
		{
			%>Hint Questions Mismatched<%
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
	Invalid User Name/Question not Specified <br>
<%
}
%>	