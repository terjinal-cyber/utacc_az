
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

try{
	String savePath = request.getServletContext().getRealPath("files");
	int fileSize = 1024*1024*25;

	File file;;
	if(!(file = new File(savePath)).isDirectory()){
	    file.mkdirs();
}
MultipartRequest mr = new MultipartRequest(request, savePath, fileSize,
"UTF-8", new DefaultFileRenamePolicy());

String id = (String) session.getAttribute("id");
String title = mr.getParameter("title");
String naiyo = mr.getParameter("naiyo");
String filename = mr.getFilesystemName("file");
String sql = "Insert into moji(moji_id,moji_title,moji_naiyo,moji_nen,moji_bango,moji_file)";
sql = sql + "values(?,?,?,sysdate,moji_seq.nextval,?)";
pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, title);
pstmt.setString(3, naiyo);
pstmt.setString(4, filename);
pstmt.executeUpdate();

pstmt.close();
con.close();
response.sendRedirect("login2.jsp");
}catch(Exception e)
{
	out.print("error");
}
%>