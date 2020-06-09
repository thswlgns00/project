<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = "";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;

	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";

	try {
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url, "thswlgns00",
				"Cc3220644!");

		sql = "select * from car_member where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();

		if (rs.next()) {
			String userID = rs.getString("id");
			String userPWD = rs.getString("passwd");
			String userName = rs.getString("name");
			String pwd = rs.getString("passwd");
			if (passwd.equals(pwd)) {
%>
<%=rs.getString("name")%>님 환영합니다.<%
	session.setAttribute("s_Name", userName);
				session.setAttribute("s_Id", userID);
				response.sendRedirect("index.jsp"); //main.jsp에 session 정보를 보낸다.

			} else {
%>
<script>
	alert("패스워드 오류\n  패스워드 다시 입력하세요");
	history.back();
</script>
<%
	}
		} else {
%>
<script>
	alert("아이디 오류 \n 아이디를 다시 입력하세요");
	history.back();
</script>
<%
	}

	} catch (SQLException e) {
		out.println(e.getMessage());
	} finally {
		if (rs != null)
			rs.close();
		if (conn != null)
			conn.close();
		if (pstmt != null)
			pstmt.close();
	}
%>