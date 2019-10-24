<%@page import="com.sun.org.apache.xpath.internal.functions.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<script type="text/javascript">
function checkid()
{
	window.open("idchk.jsp","POP","width=400,height=400,left=500,top=300,scrollbars=no");
}
function check() {
	if(Write.name.value.length<1){
		alert("名前が無い");
		Write.name.focus();
		return false;
	}
	if(Write.email.value.indexOf("@") + "" == "-1" || Write.email.value.indexOf(".") + "" == "-1"){
		alert("E-mailが無い");
		Write.email.focus();
		return false;
	}
	if(Write.id.value.length<1){
		alert("IDが無い");
		Write.id.focus();
		return false;
	}
	if(Write.pwd.value.length<1){
		alert("PWDが無い");
		Write.pwd.focus();
		return false;
	}
	Write.submit();

}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>会員加入	</title>
</head>
<body>
<center><font size='3'><b><a href="login.jsp">会員加入</a></b></font></center>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td><hr size='1' noshade></td></tr></table>
<form name ='Write' action="memdb.jsp" method="post" onsubmit="return check()">
<table border="0" cellpadding="1" cellspacing="1" align="center">
<tr>
<td>名前</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td class="head">HP</td><td><select name="hp1">
<option value="090">090</option><option value="080">080</option></select>
-<input type="text" name="hp2" maxlength="8"></td></tr>
<tr><td>email</td><td><input type="text" name="email"></td></tr>
<tr><td>Sex</td><td>Man<input type="radio" name="sex"value="man" checked="checked">Woman<input type="radio" name="sex"value="woman"></td></tr>
<tr><td>ID</td>
<td>
<input type="text" name="id">
<input type="button" onclick='checkid()' value="IdCheck">
</tr>
<tr><td>PWD</td><td><input type="password" name="pwd"></td></tr></table>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td><hr size='1' noshade></td></tr></table>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td align="right"><input type="submit" value="加入"></td>
<td align="left"><input type="reset" value="reset"></td></tr></table>
</form>
</body>
</html>