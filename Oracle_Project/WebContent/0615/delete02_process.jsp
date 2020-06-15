<%@page import="org.apache.jasper.tagplugins.jstl.core.Catch"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Database SQL</title>
</head>
<body>
	<%@ include file="DBconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");				// 삭제시에 궅이 필요하지 않음!

		ResultSet rs = null;
		PreparedStatement pstmt = null;

		try {
			String sql = "select id,passwd from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				String rId = rs.getString("id");
				String rPasswd = rs.getString("passwd");
				if (pstmt != null)
					pstmt.close();

				if (id.equals(rId) && passwd.equals(rPasswd)) {
					sql = "delete from member where id = ? and passwd = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id);
					pstmt.setString(2, passwd);
					pstmt.executeUpdate();
					out.println("테이블을 삭제 했습니다.");
				} else
					out.println("일치하는 비밀번호가 없습니다.");
			} else
				out.println("일치하는 아이디가 없습니다.");
		} catch (SQLException e) {
			out.println("SQLException : " + e.getMessage());
		} finally {
			if (conn != null)
				conn.close();
			if (pstmt != null)
				pstmt.close();
			if (rs != null)
				rs.close();
		}
	%>
</body>
</html>