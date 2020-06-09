<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
	request.setCharacterEncoding("utf-8");
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";

	try {
		Class.forName(jdbc_driver);
		out.println("database 연결중..." + "<br>");

		conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
				"Cc3220644!");
		String sql = "insert into car_member values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		pstmt.setString(2, request.getParameter("name"));
		pstmt.setString(3, request.getParameter("passwd"));
		pstmt.setString(4, request.getParameter("gender"));

		pstmt.setString(5, request.getParameter("email1") + "@"
				+ request.getParameter("email2"));
		pstmt.setString(
				6,
				request.getParameter("h1") + "-"
						+ request.getParameter("h2") + "-"
						+ request.getParameter("h3"));

		pstmt.setString(
				7,
				request.getParameter("p1") + "-"
						+ request.getParameter("p2") + "-"
						+ request.getParameter("p3"));

		pstmt.setString(8, request.getParameter("address"));
		pstmt.setString(9, request.getParameter("carNumber"));
		pstmt.setString(10, request.getParameter("carType"));
		out.println("성공" + "<br>");

		pstmt.executeUpdate();

	} catch (Exception e) {
		out.println("database 연결 오류" + e.getMessage() + "<br>");
	}
	
%>
<%

%>
<html>
<head>

<title>결과</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
	%>
	아이디 :
	<%=id%><br> 이름 :
	<%=name%><br> 등록 되었습니다.
	<script>
	self.window.alert("가입 완료 되었습니다.");
	location.href = "javascript:history.back()";
	location.href = "index.jsp";
	</script>
	
</body>
</html>
