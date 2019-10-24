<%@page import="com.serviet.dto.memdto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet res = null;

Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

String name = request.getParameter("name");
String hp1  = request.getParameter("hp1");
String hp2  = request.getParameter("hp2");
String email = request.getParameter("email");
String sex = request.getParameter("sex");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

try{
String sql = "insert into mem(mem_name,mem_hp1,mem_hp2,mem_email,mem_sex,mem_id,mem_pwd) values(?,?,?,?,?,?,?)";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, name);
pstmt.setString(2, hp1);
pstmt.setString(3, hp2);
pstmt.setString(4, email);
pstmt.setString(5, sex);
pstmt.setString(6, id);
pstmt.setString(7, pwd);
pstmt.executeUpdate();
response.sendRedirect("login.jsp");
}
catch(Exception e)
{%>
	<form action="membership.jsp">
	<input type="submit" value="<-">
	</form>
<%
	out.print("存在するIDです。");}
finally{
	con.close();
	pstmt.close();}
%>
</body>
</html>