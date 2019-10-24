<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>掲示板HOME</title>
    <style type="text/css">
        <!--
        a:link {
            font-family: "";
            color: black;
            text-decoration: none;
        }

        a:visited {
            font-family: "";
            color: black;
            text-decoration: none;
        }

        a:hover {
            font-family: "";
            color: black;
            text-decoration: none;
        }
        -->
    </style>
</head>

<body>
    <%
int cou=0;
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@localhost:1521:orcl";
String id2 = "web";
String pw = "0402";

Connection con = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
Class.forName(driver);
con = DriverManager.getConnection(url, id2, pw);

String sql = "select * from moji order by moji_bango DESC";
pstmt = con.prepareStatement(sql);
rs = pstmt.executeQuery();
%>


    <center>
        <font size='3'><b>掲示板</b></font>
    </center>
    <table border="0" width="700" cellpadding="0" cellspacing="0" align="center">
        <tr>
            <td align="right"><%String id = (String) session.getAttribute("id");
 out.print("" +id);%><a href="logout.jsp">[logout]</a>
        </tr>
        <tr>
            <td>
                <hr size='1' noshade>
            </td>
        </tr>
    </table>


    <table border="0" cellpadding="1" cellspacing="2" width="700" align="center">
        <tr bgcolor="cccccc">
            <td>
                <center>
                    <font size=2><b>番後</b></font>
                </center>
            </td>
            <td>
                <center>
                    <font size="2"><b>Title</b></font>
                </center>
            </td>
            <td>
                <center>
                    <font size="2"><b>User</b></font>
                </center>
            </td>
            <td>
                <center>
                    <font size="2"><b>作成時間</b></font>
                </center>
            </td>
            <td>
                <center>
                    <font size="2"><b>Count</b></font>
                </center>
            </td>
            <td>
                <center>
                    <font size="2"><b>File</b></font>
                </center>
            </td>
        </tr>
        <%
	while(rs.next())
	{
      int num = rs.getInt("moji_bango");
      String title = retle");
      String user = rs.getString("moji_id");
      String nen2 = rs.getString("moji_nen");
      int count = rs.getInt("moji_count");
      String file = rs.getString("moji_file");
      cou++;
%>
        <tr bgcolor="ededed">
            <td align="center">
                <font size=2 color="black"><%=cou %></font>
            </td>

            <td align="center">
                <a href="deletechk.jsp?num=<%=num %>&user=<%=user%>">
                    <font size="2" color="black"><%=title %></font>
                </a></td>


            <td align="center">
                <font size=2 color="black"><%=user %></font>
            </td>
            <td align="center">
                <font size=2 color="black"><%=nen2 %></font>
            </td>
            <td align="center">
                <font size=2><%=count %></font>
            </td>
            <%if(file!=null){%>
            <td align="center">
                <font size=2><%=file %></font>
        </tr>
        <%}
else if(file==null){
%>
        <td align="center">
            <font size=2>File無し</font>
            </tr>
            <%
}
}
%>
    </table>


    <table border="0" cellpadding="1" cellspacing="2" width="700" align="center">
        <tr>
            <td>
                <hr size="1" noshade>
            </td>
        </tr>
    </table>

    <table border="0" width="600" align="center">
        <tr>
            <td align="left"></td>
            <td align="right"><a href="write.jsp">[登録]</a>

    </table>
</body>

</html>