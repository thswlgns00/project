<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String jdbc_driver = "com.mysql.cj.jdbc.Driver";
		String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";

		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
					"Cc3220644!");

			String id = request.getParameter("id");
			String sql = "select * from car_member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
	%>
	<script type="text/javascript">
		alert("중복아이디 <br> 이미 등록된 아이디입니다.");
		history.back();
	</script>
	<%
		} else {
	%>
	<script type="text/javascript">
		alert("사용가능한 아이디 입니다.");
		history.back();
	</script>
	<%
		}

		} catch (SQLException e) {
			e.getMessage();

		}
	%>
</body>
</html>