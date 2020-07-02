<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify.jsp</title>
<link rel="stylesheet" href="common.css">

<script type="text/javascript">
function checkWrite() {
	if (document.modify.custname.value == "") {
		alert("성명을 입력하세요");
		document.modify.name.focus();
	
	}else {
		document.modify.submit();
	}
}
function check() {
	location.href="modify.jsp";
	
}
</script>
</head>
<body>
	<%@ include file="DBcon.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
           
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       int idx =0;
	       if(request.getParameter("idx")!=null){	  	       
	  		 idx= Integer.parseInt(request.getParameter("idx"));
	  		 
	       }
	       
	       String custno = "";
	       String custname = "";
	   	   String phone = "";
	   	   String address = "";
	   	   String joindate = "";
	   	   String grade = "";
	   	 String city = "";
	   	   
	       try{
	    	   String sql = "select * from member_tbl_02 where custno=?";
	    	   pstmt = conn.prepareStatement(sql);
	    	   pstmt.setInt(1, idx);
	    	   rs = pstmt.executeQuery();
	    	   
	    	   if(rs.next()){
	   			custno = rs.getString(1);
	   			custname = rs.getString(2);
	   			phone = rs.getString(3);
	   			address = rs.getString(4);
	   			joindate = rs.getString(5);
	   			grade = rs.getString(6);
	   			city = rs.getString(7);
	    	   }
	       } catch (SQLException e) {
	    	   out.println( e.getMessage() ); 
	       } finally {
	    	   if (pstmt != null)
	    		   pstmt.close();
	    	   if (conn != null)
	    		   conn.close();	       
	    	  }
	%>
	 <%@ include file="header.jsp"%>
	
	 <%@ include file="nav.jsp"%> 
	<div class="section">
	<h1 align="center">홈쇼핑 회원 정보 수정</h1>
	<form name="modify" method="post" action="update_ok.jsp?idx=<%=idx%>">
		<table class="table">
			<tr>
				<th align="center">회원번호</th>
				<td><input type="text" name="custno" value="<%=custno%>"></td>
			</tr>
			<tr>
				<th align="center">회원성명</th>
				<td><input type="text" name="custname" value="<%=custname%>">
					</td>
			</tr>
			<tr>
				<th align="center">회원전화</th>
				<td><input type="text" name="phone" value="<%=phone%>"></td>
			</tr>
			<tr>
				<th align="center">회원주소</th>
				<td><input type="text" name="address" value="<%=address%>"></td>
			</tr>
			<tr>
				<th align="center">가입일자</th>
				<td><input type="text" name="joindate" value=<%=joindate%>></td>
			</tr>
			<tr>
				<th align="center">고객등급[A:VIP,B:일반,C:직원]</th>
				<td><input type="text" name="grade" value="<%=grade%>"></td>
			</tr>
			<tr>
				<th align="center">도시코드</th>
				<td><input type="text" name="city" value="<%=city%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button"
					value="등  록" onclick="javascript:checkWrite()"> <input
					type="button" value="조 회" onclick="javascript:check();">
				</td>
			</tr>
		</table>
	</form>
</div>
	 <%@include file="footer.jsp"%>

</body>
</html>