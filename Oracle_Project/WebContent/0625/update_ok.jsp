<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%@ include file="DBcon.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
	 
	       int idx = Integer.parseInt(request.getParameter("idx"));  
	      
	       String b = request.getParameter("custname");
	       String c = request.getParameter("phone");
	       String d = request.getParameter("address");
	       String e = request.getParameter("joindate");
	       String f = request.getParameter("grade");
	       String g = request.getParameter("city");
	       
	       
	       PreparedStatement pstmt = null;
	       
	       try{
	    	   String sql = "update member_tbl_02 set custname=?, phone=?, address=?, joindate=?, grade=? ,city=? where custno =?";
	    	   pstmt = conn.prepareStatement(sql);
	    	  
	    	   pstmt.setString(1, b);
	    	   pstmt.setString(2, c);
	    	   pstmt.setString(3, d);
	    	   pstmt.setString(4, e);
	    	   pstmt.setString(5, f);
	    	   pstmt.setString(6, g);
	    	   pstmt.setInt(7, idx);
	    	   pstmt.executeUpdate();
	    	   %>
	<script language=javascript>
	           self.window.alert("사원정보를 수정 하였습니다.");
	       
	           location.href="modify.jsp";
	           </script>
	<%
	       } catch (SQLException ex) {
	    	   System.out.println("ex"+ex.getMessage());
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