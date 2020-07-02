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
</style>
</head>
<body>


		
			<%@ include file="header.jsp"%>
		
			<%@ include file="nav.jsp"%>
	
		<div class="section">
			<!--내용 시작-->
			<%@ include file="DBcon.jsp"%>
			<h3>회원목록조회/수정</h3>
			<hr>
			<table class="table">
				<tr>
					
					<th>회원번호</th>
					<th>회원성명</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
					
				</tr>
				<%
					ResultSet rs = null;
					PreparedStatement pstmt = null;

					try {
						String sql = "select * from member_tbl_02";
						pstmt=conn.prepareStatement(sql);
						rs = pstmt.executeQuery();
						
						while (rs.next()) {
														
							int idx = rs.getInt(1);
							String partCode = rs.getString(1);							
							String partName = rs.getString(2);
							String model = rs.getString(3);
							String standard = rs.getString(4);
							String unit= rs.getString(5);
							String purchase= rs.getString(6);
							String sales= rs.getString(7);
							
				
							
							
				%>
				<tr>
					
					<td><a href="update.jsp?idx=<%=idx%>"><%=partCode%></a></td>
					<td><%=partName%></td>
					<th><%=model%></th>
					<td><%=standard%></td>
					<td><%=unit%></td>
					<td><%=purchase%></td>
					<td><%=sales%></td>
					
				</tr>
				<%
					}//while문 닫아줌
					} catch (Exception e) {
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