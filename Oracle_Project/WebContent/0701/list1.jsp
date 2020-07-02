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
	font-size: large;
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
			String sql = "select count(*) from course_tbl";
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
		<h1 align="center">교과목 목록</h1>
		<br>
		<table class="t1">
			<tr>
				<td>총 <%=total%>개의 교과목이 있습니다.
				</td>
			</tr>
		</table>
		<form action="insert.jsp" method="post">
		<table class="table">			
				<tr class="tr">
					<th class="th">과목코드</th>
					<th class="th">과목명</th>
					<th class="th">학점</th>
					<th class="th">담당강사</th>
					<th class="th">요일</th>
					<th class="th">시작시간</th>
					<th class="th">종료시간</th>
					<th class="th">관리</th>
				</tr>
				<%
					try {
						String sql = "select id,name,credit,lecturer,week,to_char(start_hour,'0999'),to_char(end_end,'0999') from course_tbl";
						pstmt = conn.prepareStatement(sql);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							int idx = rs.getInt(1);
							String id = rs.getString(1);
							String name = rs.getString(2);
							int credit = rs.getInt(3);
							String lecturer = rs.getString(4);
							int weekNum = rs.getInt(5);
							int start_hour = rs.getInt(6);
							int end_end = rs.getInt(7);
							String week = "";
							switch (weekNum) {
							case 1:
								week = "월요일";
								break;
							case 2:
								week = "화요일";
								break;
							case 3:
								week = "수요일";
								break;
							case 4:
								week = "목요일";
								break;
							case 5:
								week = "금요일";
								break;
							case 6:
								week = "토요일";
								break;
							}
				%>
				<tr class="tr">
					<td class="td"><%=id%></td>
					<td class="td"><%=name%></td>
					<td class="td"><%=credit%></td>
					<td class="td"><%=lecturer%></td>
					<td class="td"><%=week%></td>
					<td class="td"><%=start_hour%></td>
					<td class="td"><%=end_end%></td>
					<td class="td"><a class="a" href="modify.jsp?idx=<%=idx%>">수정</a>/<a
						class="a" href="delete.jsp?idx=<%=idx%>">삭제</a></td>
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
						if (conn != null)
							conn.close();
					}
				%>
			
		</table>
		<br>
		<br>
		<table class="t2">

			<tr>
				<td><input class="button" type="button" value="작성"
					onclick="location.href='insert.jsp'"></td>
			</tr>

		</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>