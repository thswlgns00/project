<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title></title>
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
			<h3>부품 정보 조회</h3>
			<hr>
			<table>
				<tr>
					<th>no</th>
					<th>부품번호</th>
					<th>부품명</th>
					<th>모델명</th>
					<th>규격</th>
					<th>단위</th>
					<th>매입가격</th>
					<th>매출가격</th>
					<th>메모</th>
				</tr>
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;

					try {
						String sql = "select * from partTbl";
						pstmt=conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						int i = 0;
						while (rs.next()) {
														
							i++;
							String partCode = rs.getString(1);							
							String partName = rs.getString(2);
							String model = rs.getString(3);
							String standard = rs.getString(4);
							String unit= rs.getString(5);
							String purchase= rs.getString(6);
							String sales= rs.getString(7);
							String memo= rs.getString(8);
				
							
							
				%>
				<tr>
					<td><%=i%></td>
					<td><%=partCode%></td>
					<td><%=partName%></td>
					<th><%=model%></th>
					<td><%=standard%></td>
					<td><%=unit%></td>
					<td><%=purchase%></td>
					<td><%=sales%></td>
					<td><%=memo%></td>
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