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
    <%
String num = request.getParameter("num");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet res = null;


Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

String sql = "DELETE from moji where moji_bango=?";
pstmt = con.prepareStatement(sql);
pstmt.setInt(1, Integer.parseInt(num));
pstmt.executeQuery();
response.sendRedirect("login2.jsp");
%>
</body>

</html>