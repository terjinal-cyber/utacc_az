<%@ page import = "java.sql.* , java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>IDCheck</title>
</head>
<body>
<form>
<table border= '1' width=250>
<%
String id = request.getParameter("id");
if(id == "")
{
%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>IDno!</font></td></tr>
<tr> <td align="center"><a href=javascript:close()>[close]</a></td></tr>
<%
}
else
{
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";
Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

String sql = "SELECT mem_id from mem where mem_id='" + id + "'";
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
if(!rs.next())
{
	%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>ID : <%=id %><br>使用可能</font></td></tr>
<tr> <td align="center"><a href=javascript:close()>[close]</a></td></tr>
<%
}
else
{
%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>ID : <%=id %><br>使用不可能</font></td></tr>
<tr> <td align="center"><a href="idchk.jsp">[return]</a></td></tr>
<%
}
rs.close();
con.close();
pstmt.close();
}
%>
</table>
</form>
</body>
</html>