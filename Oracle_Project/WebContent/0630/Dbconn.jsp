<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
request.setCharacterEncoding("utf-8");

Connection conn = null;

try{
	String url = "jdbc:oracle:thin:@//localhost:1522/xe";
			String user = "system";
			String password = "1234";
			Class.forName("oracle.jdbc.OracleDriver");
			
			conn =DriverManager.getConnection(url, user, password);
			
			System.out.println("성공");
		}catch(Exception e){
			System.out.println("실패"+e.getMessage());
			e.printStackTrace();
	
		}
%>