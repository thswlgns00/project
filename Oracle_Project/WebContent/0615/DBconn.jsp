<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;

	try {
		String url = "jdbc:oracle:thin:@//localhost:1522/xe";
		String user = "system";
		String pwd = "1234";
		Class.forName("oracle.jdbc.OracleDriver");

		conn = DriverManager.getConnection(url, user, pwd);
		System.out.println("오라클 연결 성공");
	} catch (Exception e) {
		System.out.println("오라클 연결 실패");
		System.out.println("SQLExeption : " + e.getMessage());
		e.printStackTrace();
	}
%>
