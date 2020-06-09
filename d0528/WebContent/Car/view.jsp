<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
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
	height: 580px;
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
		String checkName = "";
		checkName = (String) session.getAttribute("s_Name");
		if (checkName == null) {
	%>
	<script type="text/javascript">
		alert("로그인 먼저 하세요.");
		history.back();
	</script>
	<%
		} else {
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
		<%
			Connection conn = null;
				PreparedStatement pstmt = null;
				String sql = "";
				ResultSet rs = null;
				String rst = "";
				String msg = "";

				int idx = Integer.parseInt(request.getParameter("idx"));
				String jdbc_driver = "com.mysql.cj.jdbc.Driver";
				String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
				int max = 0;

				try {
					Class.forName(jdbc_driver);
					conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
							"Cc3220644!");

					Statement stmt = conn.createStatement();
					sql = "select name,title,memo,time,hit from board where num = "
							+ idx;
					rs = stmt.executeQuery(sql);
					
					if (rs.next()) {
						String name = rs.getString(1);
						String title = rs.getString(2);
						String memo = rs.getString(3);
						String time = rs.getString(4);
						int hit = rs.getInt(5);
						hit++;
						%>
						<table align="center">
			<tr>
				<td>
					<table width="100%" cellpadding="0" cellspacing="0" border="0">
						<tr
							style="background: url('../image/table_mid.gif') repeat-x; text-align: center;">
							<td width="5"><img src="../image/table_left.gif" width="5"
								height="30" /></td>
							<td>내 용</td>
							<td width="5"><img src="../image/table_right.gif" width="5"
								height="30" /></td>
						</tr>
					</table>
					<table width="413">
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">글번호</td>
							<td width="319"><%=idx%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">조회수</td>
							<td width="319"><%=hit%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">이름</td>
							<td width="319"><%=name%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">작성일</td>
							<td width="319"><%=time%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							<td align="center" width="76">제목</td>
							<td width="319"><%=title%></td>
							<td width="0">&nbsp;</td>
						</tr>
						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr>
							<td width="0">&nbsp;</td>
							
							<td width="399" colspan="2" height="200">&nbsp;<%=memo %></td>
						</tr>

						<tr height="1" bgcolor="#dddddd">
							<td colspan="4" width="407"></td>
						</tr>
						<tr height="1" bgcolor="#82B5DF">
							<td colspan="4" width="407"></td>
						</tr>
						
						<tr align="center">
							<td width="0">&nbsp;</td>
							<td colspan="2" width="399">
							<input type=button value="글쓰기"
								onclick="window.location='write.jsp'">
								 <input type=button  value="답글" onclick="window.location = 'reply.jsp?idx=<%=idx%>'">
								  <input type=button  value="목록" onclick="window.location = 'list.jsp'">
								<input type=button  value="수정" onclick="window.location = 'modify.jsp?idx=<%=idx%>'"> 
								<input type=button 	value="삭제" onclick="window.location = 'delete.jsp?idx=<%=idx%>'">
							<td width="0">&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		<%
	  
		
		sql = "update board set hit = "+hit+" where num = "+idx;
		
					stmt.executeUpdate(sql);
					rs.close();
					stmt.close();
					conn.close();
					
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
		%>

	</div>
	<%} %>
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>