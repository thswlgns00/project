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
String name = request.getParameter("name");

PreparedStatement pstmt = null;

try{
	String sql = "insert into member(id,passwd,name) values(?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	pstmt.setString(3, name);
	pstmt.executeUpdate();
	out.println("Member 테이블 삽입이 성공했습니다.");
	}catch(SQLException e){
		out.println("실패하였습니다.");
		out.println("exception:" +e.getMessage());
	}finally{
		if(conn != null)
			conn.close();
		if(pstmt != null)
			pstmt.close();
	}
	
%>
</body>
</html>