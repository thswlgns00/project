<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>성적조회</title>
<link rel="stylesheet" href="style.css">
<style>
section h3 {
	text-align: center;
	padding: 2% 0 2% 0;
}

table {
	margin: 0 auto 0 auto;
	width: 70%;
	height: 50%;
	border: 2px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
}

.center {
	text-align: center;
}

.right {
	text-align: right;
}
</style>
</head>
<body>

	<div id=wrap>
		<header>
			<%@ include file="header.jsp"%>
		</header>
		<nav>
			<%@ include file="nav.jsp"%>
		</nav>
		<section>
			<!--내용 시작-->
			<%@ include file="DBcon.jsp"%>
			<h3>고객정보 조회</h3>
			<hr>
			<table>
				<tr>
					<th>id</th>
					<th>성명</th>
					<th>패스워드</th>
					<th>성별</th>
					<th>이메일</th>
					<th>휴대폰</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>차량번호</th>
					<th>차량종류</th>

				</tr>
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;

					try {
						String sql = "select * from custom_member order by id asc";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while (rs.next()) {	
							
							String id = rs.getString(1);
							String name = rs.getString(2);
							String passwd = rs.getString(3);
							String gender = rs.getString(4);
							String email = rs.getString(5);
							String phone = rs.getString(6);
							String tel = rs.getString(7);
							String address = rs.getString(8);
							String carNumber = rs.getString(9);
							String carType = rs.getString(10);
							
				
				%>
				<tr>
					<td><%=id%></td>
					<td><%=name%></td>
					<td><%=passwd %></td>
					<th><%=gender%></th>
					<td><%=email%></td>
					<td><%=phone%></td>
					<td><%=tel%></td>
					<td><%=address%></td>
					<td><%=carNumber%></td>
					<td><%=carType%></td>
				</tr>
				<%
					}//while문 닫아줌
					} catch (SQLException e) {
						out.print("테이블 호출 실패");
						System.out.println("wer" + e.getMessage());
						e.printStackTrace();
					} finally {
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
					}
				%>
			</table>
		</section>
		<footer>
			<%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>