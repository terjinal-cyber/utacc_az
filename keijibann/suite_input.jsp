
<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@page import="java.io.File"%>
<%@ page import = "java.sql.* , java.util.*" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;


Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

//try{
	String savePath = request.getServletContext().getRealPath("files");
	int fileSize = 1024*1024*25;

	File file;;
	if(!(file = new File(savePath)).isDirectory()){
	    file.mkdirs();
}
MultipartRequest mr = new MultipartRequest(request, savePath, fileSize,
"UTF-8", new DefaultFileRenamePolicy());
int num = Integer.parseInt(mr.getParameter("num"));
String id = (String) session.getAttribute("id");
String title = mr.getParameter("title");
String naiyo = mr.getParameter("naiyo");
String filename = mr.getFilesystemName("file");

if(filename!=null)
{
String sql = "update moji set moji_title=?,moji_naiyo=?,moji_file=? where moji_bango=?";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, title);
pstmt.setString(2, naiyo);
pstmt.setString(3,filename);
pstmt.setInt(4,num);
pstmt.executeUpdate();
pstmt.close();
con.close();
}
else
{
	String sql = "update moji set moji_title=?,moji_naiyo=? where moji_bango=?";
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, title);
	pstmt.setString(2, naiyo);
	pstmt.setInt(3,num);
	pstmt.executeUpdate();
	pstmt.close();
	con.close();
}
pstmt.close();
con.close();
response.sendRedirect("login2.jsp");
%>