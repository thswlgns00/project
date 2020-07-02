<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="common.css">
<style>
section h3 {
	text-align: center;
	padding: 2% 0 2% 0;
}

</style>
</head>
<body>	
		<header>
			<%@ include file="header.jsp"%>
		</header>
		<nav>
			<%@ include file="nav.jsp"%>
		</nav>
		<div class="section">
			<!--내용 시작-->
			<%@ include file="DBcon.jsp"%>
			<h3>직원 정보 조회</h3>
			<hr>
			<table class="table">
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
						String sql = "select member_tbl_02.custno,member_tbl_02.custname,member_tbl_02.grade,money_tbl_02.price from member_tbl_02,money_tbl_02 where member_tbl_02.custno = money_tbl_02.custno";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while (rs.next()) {							
							String a = rs.getString(1);
							String b = rs.getString(2);
							String c = rs.getString(3);
							String d = rs.getString(4);						
				%>
				<tr>
					<td><%=a%></td>
					<td><%=b%></td>					
					<th><%=c%></th>
					<td><%=d%></td>
					
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
	</div>
		
			<%@ include file="footer.jsp"%>
	
	
</body>
</html>