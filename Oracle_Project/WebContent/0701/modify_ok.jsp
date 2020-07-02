<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_course_process.jsp</title>
</head>
<body>
	<%@ include file="DBconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	 
	       int idx = Integer.parseInt(request.getParameter("idx"));  
	       String id = request.getParameter("id");
	       String name = request.getParameter("name");
	       String credit = request.getParameter("credit");
	       String lecturer = request.getParameter("lecturer");
	       String week = request.getParameter("week");
	       String start_hour = request.getParameter("start_hour");
	       String end_end = request.getParameter("end_end");
	       
	       PreparedStatement pstmt = null;
	       
	       try{
	    	   String sql = "update course_tbl set id=?, name=?, credit=?, lecturer=?, week=?, start_hour=?, end_end=? where id=" + idx;
	    	   pstmt = conn.prepareStatement(sql);
	    	   pstmt.setString(1, id);
	    	   pstmt.setString(2, name);
	    	   pstmt.setString(3, credit);
	    	   pstmt.setString(4, lecturer);
	    	   pstmt.setString(5, week);
	    	   pstmt.setString(6, start_hour);
	    	   pstmt.setString(7, end_end);
	    	   pstmt.executeUpdate();
	    	   
	    	   %>
	<script language=javascript>
	           self.window.alert("교과목정보를 수정 하였습니다.");
	           self.window.alert("교과목 목록 화면으로 이동합니다.");
	           location.href="list1.jsp";
	           </script>
	<%
	       } catch (SQLException e) {
	    	   %>
	<script language=javascript>
		          alert("교과목정보를 수정 할 수 없습니다.")
		          location.href="javascript:history.back()";
		          </script>
	<%
	       } finally {
	    	   if (pstmt != null)
	    		   pstmt.close();
	    	   if (conn != null)
	    		   conn.close();
	    	  }
	%>
</body>
</html>