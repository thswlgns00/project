<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ include file="DBcon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");
	

	int id = Integer.parseInt(request.getParameter("id"));
	String name = request.getParameter("name");
	String passwd = request.getParameter("passwd");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email")+"@"+request.getParameter("email1");
	String phone = request.getParameter("phone")+"-"+request.getParameter("phone1") + "-" + request.getParameter("phone2");
	String tel = request.getParameter("tel")+"-" +request.getParameter("tel1")+"-"+request.getParameter("tel2");
	String address = request.getParameter("address");
	String carNumber = request.getParameter("carNumber");
	String carType = request.getParameter("carType");
	PreparedStatement pstmt = null;

	try {
		String sql = "insert into custom_member values(?,?,?,?,?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, passwd);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, phone);
		pstmt.setString(7, tel);
		pstmt.setString(8, address);
		pstmt.setString(9, carNumber);
		pstmt.setString(10, carType);

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
	alert("등록되지안았습니다.")
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