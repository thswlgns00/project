<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html >
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";

	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
	int max = 0;

	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
				"Cc3220644!");
		
		
	
		String title= request.getParameter("title");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String standard = request.getParameter("standard");
		String memo = request.getParameter("memo");
		sql = "SELECT MAX(NUM) FROM board";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			max = rs.getInt(1);
		} else
			max = 0;

		sql = "insert into board(name,password,title,memo,ref,time) values(?,?,?,?,?,sysdate())";

		pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max + 1);
		pstmt.execute();

	} catch (SQLException e) {
		out.println(e.toString());
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
		if (rs != null)
			rs.close();
	}
%>
<script>
	self.window.alert("저장이 완료되었습니다.");
	location.href = "list.jsp";
</script>
