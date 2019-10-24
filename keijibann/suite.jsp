<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修整</title>
<script type="text/javascript">
function check() {
	if(Write.title.value.length<1){
		alert("Titleが無い");
		Write.title.focus();
		return false;
	}
	if(Write.naiyo.value.length<1){
		alert("内容が無い");
		Write.naiyo.focus();
		return false;
	}
	Write.submit();
}
</script>
</head>
<body>
<center><font size=3><b><a href="login2.jsp">掲示板修整</a></b></font></center>
<%
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

String sql = "select * from moji where moji_bango=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1,Integer.parseInt(num));

rs = pstmt.executeQuery();
rs.next();

String title = rs.getString("moji_title");
String naiyo = rs.getString("moji_naiyo");
String file = rs.getString("moji_file");
%>
<form name="Write"action="suite_input.jsp"
enctype="multipart/form-data" method="post" onsubmit="return check()">
<input type="hidden" name="num" value="<%=num %>">
<table border="0" width="600" cellpadding="0" cellspacing="0" align="center">
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr> <td width="100" bgcolor="cccccc" align="center">
<font size=2><b>Title</b></font></td>

<td>
<font size=2><input type="text" size=68 maxlength="50" name="title" value="<%=title%>"></font></td></tr>
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr>
<td bgcolor="cccccc" align="center"><font size=2><b>内容</b></font></td>
<td><font size=2><textarea cols=70 rows=15 name="naiyo"><%=naiyo %></textarea></font></td></tr>
<tr> <td colspan="2"> <hr size=1 noshade> </td> </tr>
<tr>
<tr>
<td width="100" bgcolor="cccccc" align="center"><font size=2>File : </font></td>
<td><input type="file" name="file"></td></tr>
<tr>
<td align="center" colspan="2" width="100">
<table>
<tr><td align="center" width="100">
<input type="reset" value="reset"></td>
<td width="200" align="center"><input type="submit" value="修整"></td></tr>
</table>
</form>
</body>
</html>