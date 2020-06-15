<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE>
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

ResultSet rs = null;
PreparedStatement pstmt = null;

try{
	String sql = "select id, passwd from member where id = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	
	if(rs.next()){
		String rId = rs.getString("id");
		String rPasswd = rs.getString("passwd");
		if(pstmt != null){
			pstmt.close();
		}
		if (id.equals(rId) && passwd.equals(rPasswd)){
			sql ="update member set name = ? where id = ?";
			pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			out.println("테이빌을 수정했습니다.");
			}else
				out.println("일치하는 비밀번호가 아닙니다.");
	}else
		out.println("테이블에 일치하는 아이디가 없습니다.");
}catch (SQLException e){
	e.printStackTrace();
	out.println("SQLException : "+ e.getMessage());
}finally{
	if(rs!=null)
		rs.close();
	if(conn!=null)
		conn.close();
	if(pstmt!=null)
		pstmt.close();
}
%>
</body>
</html>