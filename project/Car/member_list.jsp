<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<%
	String checkName = (String) session.getAttribute("s_Name");

	if (checkName == null) {
%><script>
			alert("로그인 후 사용하세요!");
			history.back();
		</script>
<%
	}
%>
</head>
<body>

	<!-- header -->
	<jsp:include page="header.jsp"></jsp:include>

	<nav>
		<ul>
			<li><a href="info.jsp">회사소개</a></li>
			<li><a href="#">고객정보 등록</a></li>
			<li><a href="#">부품정보 등록</a></li>
			<li><a href="member_list.jsp">고객정보 목록</a></li>
			<li><a href="list.jsp">게시판</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>

	<div class="section">
		<br>
		<br>
		<form name="list">
			<table border="1">
				<caption>
					<h1>회원정보 리스트</h1>
				</caption>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>패스워드</th>
					<th>성별</th>
					<th>이메일</th>
					<th>휴대폰번호</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>차량번호</th>
					<th>차량종류</th>
				</tr>

				<%
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;

					try {
						String jdbc_driver = "com.mysql.cj.jdbc.Driver";
						String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
						Class.forName(jdbc_driver);
						conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
								"Cc3220644!"); // db접속
						//System.out.print("데이터베이스연결성공");

						String sql = "select * from car_member";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
					} catch (Exception e) {
						System.out.println(e);
						e.printStackTrace();
					}

					while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString(2)%></td>
					<td><%=rs.getString(3)%></td>
					<td><%=rs.getString(4)%></td>
					<td><%=rs.getString(5)%></td>
					<td><%=rs.getString(6)%></td>
					<td><%=rs.getString(7)%></td>
					<td><%=rs.getString(8)%></td>
					<td><%=rs.getString(9)%></td>
					<td><%=rs.getString(10)%></td>
				</tr>
				<%
					}
				%>

			</table>
		</form>
	</div>

	<!-- footer -->
	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>