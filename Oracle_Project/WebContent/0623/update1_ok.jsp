<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_process.jsp</title>
</head>
<body>
<%@ include file="DBconn1.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	 
	       int idx = Integer.parseInt(request.getParameter("idx"));  
	       String id = request.getParameter("id");
	       String name = request.getParameter("name");
	       String dept = request.getParameter("dept");
	       String position = request.getParameter("position");
	       String duty = request.getParameter("duty");
	       String phone = request.getParameter("phone");
	       
	       PreparedStatement pstmt = null;
	       
	       try{
	    	   String sql = "update personel set id=?, name=?, dept=?, position=?, duty=?, phone=? where id =" + idx;
	    	   pstmt = conn.prepareStatement(sql);
	    	   pstmt.setString(1, id);
	    	   pstmt.setString(2, name);
	    	   pstmt.setString(3, dept);
	    	   pstmt.setString(4, position);
	    	   pstmt.setString(5, duty);
	    	   pstmt.setString(6, phone);
	    	   pstmt.executeUpdate();
	    	   %>
			   <script language = javascript>
	           self.window.alert("사원정보를 수정 하였습니다.");
	       
	           location.href="list1.jsp";
	           </script>
			  <%
	       } catch (SQLException e) {
	    	   %>
		          <script language=javascript>
		          alert("사원정보를 수정 할 수 없습니다.")
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