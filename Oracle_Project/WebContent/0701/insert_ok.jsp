<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="DBconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	PreparedStatement pstmt = null;
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String credit = request.getParameter("credit");
	String lecturer = request.getParameter("lecturer");
	String week = request.getParameter("week");
	String start_hour = request.getParameter("start_hour");
	String end_end = request.getParameter("end_end");
	try {
		String sql = "insert into course_tbl values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, credit);
		pstmt.setString(4, lecturer);
		pstmt.setString(5, week);
		pstmt.setString(6, start_hour);
		pstmt.setString(7, end_end);
		pstmt.executeUpdate();
%>
<script type="text/javascript">
	alert("회원정보를 추가 하였습니다.");
	location.href = "list1.jsp";
</script>
<%
	} catch (Exception e) {
		out.println("실패" + e.getMessage());
		e.printStackTrace();

	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>