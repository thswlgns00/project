<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file = "Dbconn.jsp" %>
<%request.setCharacterEncoding("utf-8");
String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("city");

PreparedStatement pstmt = null;

try{
	String sql ="insert into member_tbl_02 values(?,?,?,?,?,?,?)";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, custno);
	pstmt.setString(2, custname);
	pstmt.setString(3, phone);
	pstmt.setString(4, address);
	pstmt.setString(5, joindate);
	pstmt.setString(6, grade);
	pstmt.setString(7, city);
	pstmt.executeUpdate();
	%>
	<script type="text/javascript">
	alert("회원정보를 추가 하였습니다.");
	location.href="list_member.jsp";
	</script>
	<%
}catch(Exception e){
	%>
 <script>
 alert("회원정보를 추가 할수 없습니다.");
 location.href="list_member.jsp";
 </script>
 <%
}finally{
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();	
}
%>
</body>
</html>