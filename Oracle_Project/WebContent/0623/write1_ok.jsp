<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="DBconn1.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	String position = request.getParameter("position");
	String duty = request.getParameter("duty");
	String phone = request.getParameter("phone");

	PreparedStatement pstmt = null;

	try {
		String sql = "insert into personel values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, dept);
		pstmt.setString(4, position);
		pstmt.setString(5, duty);
		pstmt.setString(6, phone);

		pstmt.executeUpdate();
%>
<script>
	alert("사원정보를 추가 하였습니다.");
	location.href = "list1.jsp";
</script>
<%
	} catch (SQLException e) {
		System.out.println("SQL" + e.getMessage());
%>
<script>
	alert("사원정보를 추가 할 수 없습니다.")
	location.href = "javascript:history.back()";
</script>
<%
	} finally {
		if (pstmt != null)
			pstmt.close();
		if (conn != null)
			conn.close();
	}
%>