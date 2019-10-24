<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoginCheck</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet res = null;


Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

try{
	int count=0;
	String sql = "SELECT mem_id , mem_pwd FROM mem WHERE mem_id = ? AND mem_pwd = ?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,pwd);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next())
	{
		count++;
	}
	if(count==0)
	{

		out.println("<script>alert('ID Or Pwdを確認してください。'); location.href='login.jsp'</script>");
	}
	else if(count == 1)
	{
		session.setAttribute("id", id);
		session.setAttribute("pwd", pwd);
		Cookie c = new Cookie("id", id);
		c.setMaxAge(60 * 2);
		c.setPath("/");
		response.addCookie(c);
		out.println("<script>alert('login成功しました。!'); location.href='login2.jsp'</script>");
	}
}catch(Exception e)
	{
		e.printStackTrace();
	}
finally{
	pstmt.close();
	con.close();
}

%>
</body>
</html>