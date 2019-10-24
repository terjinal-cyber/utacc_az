<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function checkid()
{
	window.open("idsec.jsp","POP","width=400,height=400,left=500,top=300,scrollbars=no");
}
function check() {
	if(Write.id.value.length<1){
		alert("ID無し");
		Write.id.focus();
		return false;
	}
	if(Write.pwd.value.length<1){
		alert("PWD無し");
		Write.pwd.focus();
		return false;
	}
	Write.submit();

}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login</title>
<script type="text/javascript">
</script>
</head>
<body>
<center><font size='3'><b>掲示板Login</b></font></center>
<table border="0" width="600" cellpadding="0" cellspacing="0"align="center">
<tr><td><hr size='1' noshade></td></tr></table>
<Form name="Write" action="loginchk.jsp" method="post" onsubmit="return check()">
<table border="0" cellpadding="1" cellspacing="1" align="center">
<tr><td align="center">ID : </td><td><input type = "Text" name = "id"></td></tr>
<tr><td align="center">PWD : </td> <td><input type = "password" name = "pwd"><br></td></tr>
<tr><td align="right"><input type="Submit" value="login" width="300"></td><td>
<input type="Reset" value="reset" width="300"></td></tr></table>
</Form>

<form action="membership.jsp" method="get">
<table border="0"cellpadding="1" cellspacing="2" width="600"align="center">
<tr><td><input type="Submit" value="会員加入"></td></tr></table>
</form>
<form action="idsec.jsp" method="post">
<table border="0"cellpadding="1" cellspacing="2" width="600"align="center">
<tr><td><input type="button" onclick='checkid()' name="id2" value="ID及びPWD見つける"></td></tr>
</table>
</form>
</body>
</html>