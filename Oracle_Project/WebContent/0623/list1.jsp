<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title>성적조회</title>
<link rel="stylesheet" href="common.css">
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
			<%@ include file="DBconn1.jsp"%>
			<h3>직원 정보 조회</h3>
			<hr>
			<table>
				<tr>
					<th>no</th>
					<th>성명</th>
					<th>사번</th>
					<th>직급</th>
					<th>직책</th>
					<th>연락처</th>
					<th>소속부서</th>

				</tr>
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;

					try {
						String sql = "select * from personel order by id asc";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						int i = 0;
						while (rs.next()) {

							int idx = rs.getInt(1);
							i++;
							String id = rs.getString(1);
							String name = rs.getString(2);
							String dept = rs.getString(3);
							String position = rs.getString(4);
							String duty = rs.getString(5);
							String phone = rs.getString(6);
				%>
				<tr>
					<td><%=i%></td>
					<td><%=name%></td>
					<td><a href="update1.jsp?idx=<%=idx%>"><%=id%></a></td>
					<th><%=position%></th>
					<td><%=duty%></td>
					<td><%=phone%></td>
					<td><%=dept%></td>
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