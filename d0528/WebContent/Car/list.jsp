<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<style>
nav {
	margin: 0 0 0 0;
	float: left;
	width: 100%;
	background-color: aqua;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #ff0099;
	font-size: 14px;
}

nav ul {
	list-style: none;
}

nav ul li {
	float: left;
	margin: 0px 15px;
	list-style: none;
	font-size: 20px;
}

nav a {
	display: block;
	padding: 5px 5px 8px 5px;
	height: 20px;
	text-decoration: none;
	color: #000000;
	border-style: hidden hidden solid hidden;
	border-color: transparent;
}

.section {
	height: 80%;
	whdth: 100%;
}

div>img {
	border: none;
	height: 77%;
	width: 100%;
}
</style>
</head>
<body>

	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		String rst = "";
		String msg = "";
		int idx;
		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
					"Cc3220644!");

			String sqlCount = "select count(*) from board";
			pstmt = conn.prepareStatement(sqlCount);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				total = rs.getInt(1);
			}
			rs.close();

			String sql = "select num,name,title,time,hit,indent from board order by ref desc, step asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<nav>
		<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">고객정보 등록</a></li>
			<li><a href="#">부품정보 등록</a></li>
			<li><a href="member_list.jsp">고객정보 목록</a></li>
			<li><a href="list.jsp">게시판</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<div class="section">
		<table width="100%" cellpading="0" cellspacing="0" border="0">
			<tr>
				<td colspan=7>
					<%
						out.println("총 게시물 : " + total + "개");
					%>
				</td>
			</tr>
			<tr height=5>
				<td width=5></td>
			</tr>
			<tr
				style="background: url('../image/table_mid.gif') repeat-x; text-align: center;">
				<td width=5><img src="../image/table_left.gif" width=5
					height=30></td>
				<td width=73>번호</td>
				<td width=379>제목</td>
				<td width=73>작성자</td>
				<td width=164>작성일</td>
				<td width=58>조회수</td>
				<td width=7><img src="../image/table_right.gif" width=5
					height=30></td>
			</tr>
			<%
				if (total == 0) {
			%>
			<tr align="center" bgcolor="#ffffff" height=30>
				<td colspan=6>등록된 글이 없습니다.</td>
			</tr>
			<%
				} else {
						while (rs.next()) {
							idx = rs.getInt(1);
							String name = rs.getString(2);
							String title = rs.getString(3);
							String time = rs.getString(4);
							int hit = rs.getInt(5);
							int indent = rs.getInt(6);
			%>
			<tr height=25 align=center>
				<td></td>
				<td><%=idx%></td>
				<td align=left>
					<%
						for (int j = 0; j < indent; j++) {
					%> &ndsp;&ndsp;&ndsp; <%
 	}

 				if (indent != 0) {
 %> <img src="../image/reply_icon.gif"> <%
 	}
 %> <a href="view.jsp?idx=<%=idx%>"><%=title%></a>
				</td>
				<td align=center><%=name%></td>
				<td align=center><%=time%></td>
				<td align=center><%=hit%></td>
				<td></td>
			</tr>
			<tr height=1 bgcolor="#d2d2d2">
				<td colspan=6></td>
			</tr>
			<%
				}
					}
					rs.close();
					pstmt.close();
					conn.close();

				} catch (SQLDataException e) {
					out.println(e.getMessage());
				} finally {
					if (conn != null)
						conn.close();
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
				}
			%>
			<tr height=1 bgcolor="#82b5df">
				<td colspan=6 width=752></td>
			</tr>
		</table>
		<table width="100%" cellpading=0 cellspacing=0 border=0>
			<tr>
				<td colspan=4 height=5></td>
			</tr>
			<tr align=center>
				<td><input type="submit" value="글쓰기"
					onclick="window.location='write.jsp'"></td>
			</tr>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>