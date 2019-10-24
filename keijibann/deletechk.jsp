<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>掲示板</title>
</head>
<body>
<%
String id = (String) session.getAttribute("id");
String user = request.getParameter("user");

if(user.equals(id))
{
	String num = request.getParameter("num");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id2 = "web";
	String pw = "0402";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	Class.forName(driver);
	con = DriverManager.getConnection(url, id2, pw);


	try{
		String sql = "select * from moji where moji_bango=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));

		rs = pstmt.executeQuery();
		rs.next();

		String title = rs.getString("moji_title");
		String naiyo = rs.getString("moji_naiyo");
		String filename = rs.getString("moji_file");
		%>


<center><font size='3'><b><a href="login2.jsp">掲示板</a></b></font></center>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td align="right"><%=id%><a href="logout.jsp">[logout]</a></tr>
</table>

<table border="0" width="600" cellpadding="0" cellspacing="0" align="center">
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr> <td width="100" bgcolor="cccccc" align="center">
<font size=2><b>Title</b></font></td>

<td align="center">
<font size=2><%=title %></font></td></tr>
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr>
<td bgcolor="cccccc" align="center"><font size=2><b>内容</b></font></td>

<%
if(filename != null)
{
%>
<td align="center" width="600" height="400"><font size=2><%=naiyo %>
<img src= "../files/<%=filename%>" width="500" height="400"></font></td></tr>
<%}
else
{
%>
<td align="center" width="600" height="400"><font size=2><%=naiyo %></font></td>
<%}%>

<tr> <td colspan="2"> <hr size=1 noshade> </td> </tr>
</table>

<table border="0" width="600" align="center">
<tr><td align="left"><a href="suite.jsp?num=<%=num %>">[修整]</a></td>
<td align="right"><a href="Delete.jsp?num=<%=num%>">[Delete]</a></td></tr>
</table>

<%
sql = "update moji set moji_count=moji_count+1 where moji_bango=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeQuery();

	}catch(Exception e)
	{
		out.print("no");
	}
}


else
{
	String num = request.getParameter("num");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String id2 = "web";
	String pw = "0402";

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	Class.forName(driver);
	con = DriverManager.getConnection(url, id2, pw);


	try{
		String sql = "select * from moji where moji_bango=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,Integer.parseInt(num));

		rs = pstmt.executeQuery();
		rs.next();

		String title = rs.getString("moji_title");
		String naiyo = rs.getString("moji_naiyo");
		String filename = rs.getString("moji_file");
		%>


<center><font size='3'><b><a href="login2.jsp">掲示板</a></b></font></center>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td align="right"><%=id%><a href="logout.jsp">[logout]</a></tr>
</table>

<table border="0" width="600" cellpadding="0" cellspacing="0" align="center">
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr> <td width="100" bgcolor="cccccc" align="center">
<font size=2><b>Title</b></font></td>

<td align="center">
<font size=2><%=title %></font></td></tr>
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr>
<td bgcolor="cccccc" align="center"><font size=2><b>内容</b></font></td>
<%
if(filename != null)
{
%>
<td align="center" width="600" height="400"><font size=2><%=naiyo %>
<img src= "../files/<%=filename%>" width="500" height="400"></font></td></tr>
<%}
else
{
%>
<td align="center" width="600" height="400"><font size=2><%=naiyo %></font></td>
<%}%>
<tr> <td colspan="2"> <hr size=1 noshade> </td> </tr>
</table>

<%
sql = "update moji set moji_count=moji_count+1 where moji_bango=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeQuery();

	}catch(Exception e)
	{
		out.print("no");
	}

}

%>
</body>
</html>