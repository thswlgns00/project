<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete_course_process.jsp</title>
</head>
<body>
	<%@ include file="DBconn.jsp"%>
	<%
         request.setCharacterEncoding("utf-8");
     
         String id = request.getParameter("id");
         String name = request.getParameter("name");
         
         ResultSet rs = null;
         PreparedStatement pstmt = null;
         
         try{
        	 String sql = "select id, name from course_tbl where id = ?";
        	 pstmt = conn.prepareStatement(sql);
        	 pstmt.setString(1, id);
        	 rs = pstmt.executeQuery();
        	 
        	 if(rs.next()) {
        		 String rId = rs.getString("id");
        		 String rName = rs.getString("name");
        		 if(pstmt != null){
        			 pstmt.close();
        		 }
        		 
        		 if(id.equals(rId) && name.equals(rName)) {
        			 sql = "delete from course_tbl where id = ? and name = ?";
        			 pstmt = conn.prepareStatement(sql);
        			 pstmt.setString(1, id);
        			 pstmt.setString(2, name);
        			 pstmt.executeUpdate();
        			 %>
	<script language=javascript>
			           self.window.alert("해당 교과목을 삭제하였습니다");
			           self.window.alert("교과목 조회 화면으로 이동합니다.");
			           location.href="list1.jsp";
			           </script>
	<%
        		 } else
        		 %>
	<script language=javascript>
		           self.window.alert("일치하는 과목명이 아닙니다.");
		           location.href="javascript:history.back()";
		           </script>
	<%
        	 } else{
        	 %>
	<script language=javascript>
		         self.window.alert("course 테이블에 일치하는 과목코드가 없습니다.");
		         location.href="javascript:history.back()";
		         </script>
	<%
        	 }
         } catch (SQLException e) {
        	 e.printStackTrace();
        	 out.println("SQLException: " + e.getMessage());
         } finally {
        	 if (rs != null)
        		 rs.close();
        	 if (conn != null)
        		 conn.close();
         }
     %>
</body>
</html>