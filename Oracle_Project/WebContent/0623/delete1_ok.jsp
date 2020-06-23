<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="DBconn1.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name");
		String id = request.getParameter("id");

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "select name, id from personel where name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String rName = rs.getString("name");
				String rId = rs.getString("id");
				if (pstmt != null) {
					pstmt.close();
				}

				if (id.equals(rId) && name.equals(rName)) {
					sql = "delete from personel where name = ? and id = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
	%>
	<script language=javascript>
		self.window.alert("해당 사원을 삭제하였습니다");

		location.href = "list1.jsp";
	</script>
	<%
		} else
	%>
	<script language=javascript>
		alert("일치하는 사원번호가 아닙니다.")
		location.href = "javascript:history.back()";
	</script>
	<%
		} else {
	%>
	<script language=javascript>
		alert("personnel 테이블에 일치하는 성명이 없습니다.")
		location.href = "javascript:history.back()";
	</script>
	<%
		}
		} catch (SQLException e) {
			e.printStackTrace();
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null)
				rs.close();
			if (conn != null)
				conn.close();
		}
	%>
</body>
</html>