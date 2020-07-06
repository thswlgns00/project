<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
<style>
.table {
	width: 80%;
	height: 50%;
	border: 3px solid black;
}

.tr {
	text-align: center;
	border: 1px solid black;
}

.th {
	text-align: center;
	border: 1px solid black;
	background-color: gray;
}

.td {
	text-align: center;
	border: 1px solid black;
}

.a {
	text-decoration: none;
}

.t1 {
	text-align: left;
	width: 80%;
}

.t2 {
	text-align: center;
	width: 80%;
}

.button {
	width: 100px;
	height: 50px;
	background-color: black;
	color: white;
	font-size: small;
}
</style>
</head>
<body>
	<%@include file="DBconn.jsp"%>
	<%
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		int total = 0;
		try {
			String sql = "select count(*) from studTbl";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				total = rs.getInt(1);
			}

		} catch (SQLException e) {
			out.print("테이블 호출 실패");
			System.out.println("wer" + e.getMessage());
			e.printStackTrace();
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<br>
		<h1 align="center">학사 정보 조회</h1>
		<br>
		<table class="t1">
			<tr>
				<td>총 <%=total%>개의 학사정보가 있습니다.
				</td>
			</tr>
		</table>
		<table class="table">
			<tr class="tr">
				<th class="th">학번</th>
				<th class="th">성명</th>
				<th class="th">학과</th>
				<th class="th">학년</th>
				<th class="th">주소</th>
				<th class="th">연락처</th>

			</tr>
			<%
				try {
					String sql = "select * from studTbl order by studNo";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();

					while (rs.next()) {
						int studNo = rs.getInt(1);
						String name = rs.getString(2);
						int dept = rs.getInt(3);
						int position = rs.getInt(4);
						String address = rs.getString(5);
						String phone = rs.getString(6);
						
		%>
			<tr class="tr">
				<td class="td"><%=studNo%></td>
				<td class="td"><%=name%></td>
				<td class="td"><%=dept%></td>
				<td class="td"><%=position%></td>
				<td class="td"><%=address%></td>
				<td class="td"><%=phone%></td>

			</tr>
			<%
				}//while문 닫아줌
				} catch (SQLException e) {
					System.out.print("테이블 호출 실패");
					System.out.println("wer" + e.getMessage());
					e.printStackTrace();
				} finally {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if(conn!=null)
						conn.close();
				}
			%>
		</table>
		<br>
		<br>
		<table class="t2">

			<tr>
				<td><input class="button" type="button" value="작성"
					onclick="location.href='insert_1.jsp'"></td>
			</tr>

		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>