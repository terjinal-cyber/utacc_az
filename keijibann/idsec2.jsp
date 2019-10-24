<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("sex");
if(id.equals("ID"))
{
%>
<form action="idsec3.jsp" method="post">
<select name="hp1">
<option value="090">090</option><option value="080">080</option></select>
携帯版語 : <input type="text" name="phone" maxlength="8">
<input type="submit" value="登録">
</form>
<%
}
else if(id.equals("PWD"))
{
%>
<form action="pwd.jsp" method="post">
ID : <input type="text" name="id"><br>
E-mail : <input type="text" name="email"><br>
<input type="submit" value="登録">
</form>
<%
}
%>

</body>
</html>