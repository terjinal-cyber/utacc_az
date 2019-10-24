<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<table border= '1' width=250>
<%
String phone = request.getParameter("phone");
String hp1 = request.getParameter("hp1");
if(phone == "")
{
%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>Phoneを入力してください。</font></td></tr>
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
String sql = "SELECT mem_id from mem where mem_hp2='" + phone + "' AND mem_hp1='" + hp1 + "'";
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
if(!rs.next())
{
	%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>IDが探せません<br></font></td></tr>

<tr> <td align="center"><a href=javascript:close()>[close]</a></td></tr>
<%
}
else
{
String id = rs.getString("mem_id");
%>
<tr>
<td align="center" bgcolor="cccccc">
<font size='2'>ID : <%=id %><br></font></td></tr>
<tr> <td align="center"><a href=javascript:close()>[close]</a></td></tr>
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