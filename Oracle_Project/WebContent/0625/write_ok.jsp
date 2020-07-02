<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="DBcon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

	int custno = Integer.parseInt(request.getParameter("custno"));
	String custname = request.getParameter("custname");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String  joindate= request.getParameter("joindate");
	String  grade= request.getParameter("grade");
	String  city= request.getParameter("city");
	PreparedStatement pstmt = null;

	try {
		String sql = "insert into member_tbl_02 values(?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, custno);
		pstmt.setString(2, custname);
		pstmt.setString(3, phone);
		pstmt.setString(4, address);
		pstmt.setString(5, joindate);
		pstmt.setString(6, grade);
		pstmt.setString(7, city);

		pstmt.executeUpdate();
%>
<script>
	alert("가입이 완료되었습니다.");
	location.href = "modify.jsp";
</script>
<%
	} catch (SQLException e) {
		System.out.println("SQL" + e.getMessage());
%>
<script>
	alert("실패하였습니다..")
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