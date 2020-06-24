<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="DBcon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	
	String partCode = request.getParameter("partCode");
	String partName = request.getParameter("partName");
	String model = request.getParameter("model");
	String standard = request.getParameter("standard");
	String unit = request.getParameter("unit");
	int purchase = Integer.parseInt(request.getParameter("purchase"));
	int sales = Integer.parseInt(request.getParameter("sales"));
	String memo = request.getParameter("memo");

	PreparedStatement pstmt = null;

	try {
		String sql = "insert into partTbl values(?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, partCode);
		pstmt.setString(2, partName);
		pstmt.setString(3, model);
		pstmt.setString(4, standard);
		pstmt.setString(5, unit);
		pstmt.setInt(6, purchase);
		pstmt.setInt(7, sales);
		pstmt.setString(8, memo);

		pstmt.executeUpdate();
%>
<script>
	alert("등록되었습니다.");
	location.href = "index.jsp";
</script>
<%
	} catch (SQLException e) {
		System.out.println("SQL" + e.getMessage());
%>
<script>
	alert("등록 실패.");
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