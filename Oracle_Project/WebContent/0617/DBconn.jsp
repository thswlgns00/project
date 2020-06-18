<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page  import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); 
Connection conn = null;

try{
	String url = "jdbc:oracle:thin:@//localhost:1522/xe";
	String user = "system";
	String password = "1234";
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	conn=DriverManager.getConnection(url, user, password);
	System.out.println("오라클 연결 성공");
}catch (Exception e) {
	System.out.println("오라클 연결 실패");
	System.out.println("SQLExeption : " + e.getMessage());
	e.printStackTrace();
}
%>
</body>
</html>
