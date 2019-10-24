<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function check() {
	if(Write.title.value.length<1){
		alert("Title無い");
		Write.title.focus();
		return false;
	}
	if(Write.naiyo.value.length<1){
		alert("内容無い");
		Write.naiyo.focus();
		return false;
	}
	Write.submit();
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center><font size=3><b><a href="login2.jsp">掲示板登録</a></b></font></center>

<form name="Write"action="write_input.jsp"
method="post" enctype="multipart/form-data" onsubmit="return check()">
<table border="0" width="600" cellpadding="0" cellspacing="0" align="center">
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr> <td width="100" bgcolor="cccccc" align="center">
<font size=2><b>title</b></font></td>

<td>
<font size=2><input type="text" size=68 maxlength="50" name="title"></font></td></tr>
<tr> <td colspan="2"><hr size=1 noshade></td></tr>
<tr>
<td bgcolor="cccccc" align="center"><font size=2><b>内容</b></font></td>
<td><font size=2><textarea cols=70 rows=15 name="naiyo">
*要らない時は消してください*

場所:</textarea></font></td></tr>
<tr> <td colspan="2"> <hr size=1 noshade> </td> </tr>
<tr>
<td width="100" bgcolor="cccccc" align="center"><font size=2>File : </font></td>
<td><input type="file" name="file"></td></tr>
<tr>
<td align="center" colspan="2" width="100">
<table>
<tr><td align="left" width="100">
<input type="reset" value="reset"></td>
<td width="200" align="center"><input type="submit" value="登録"></td></tr>

</table>
</td></tr>
</table>
</form>
</body>
</html>