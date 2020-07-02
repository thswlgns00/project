<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete_course.jsp</title>
<link rel="stylesheet" href="common.css">
<style>
.table {
	border: 2px solid black;
	width: 600px;
	height: 100px;
	text-align: center;
}

.table tr {
	border: 1px solid black;
}

.table th {
	border: 1px solid black;
	text-align: center;
	background-color: gray;
}

.table td {
	border: 1px solid black;
	text-align: left;
}
</style>

<script type="text/javascript">
function checkDelete() {
	if (document.deleteform.id.value == "") {
		alert("과목코드를 입력하세요");
		document.deleteform.id.focus();
	}else if (document.deleteform.name.value == "") {
		alert("과목명을 입력하세요");
		document.deleteform.name.focus();
	}else
		document.deleteform.submit();
}
</script>

</head>
<body>
	<%@ include file="DBconn.jsp"%>
	<%
          ResultSet rs = null;
          PreparedStatement pstmt = null;
          int idx = Integer.parseInt(request.getParameter("idx"));
          String id = "";
          String name = "";
           try{
        	   String sql = "select id, name from course_tbl where id=" + idx;
        	   pstmt = conn.prepareStatement(sql);
        	   rs = pstmt.executeQuery();
           
           if(rs.next()){
        	   id = rs.getString(1);
        	   name = rs.getString(2);
           }
     %>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<br>
		<h1 align="center">교과목 삭제 화면</h1>
		<br>
		<hr>
		<form name="deleteform" method="post" action="delete_ok.jsp">
			<table border=1 align="center" class="table">
				<tr>
					<th>과목코드</th>
					<td><input type="text" name="id" value="<%=id %>"></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="name" value="<%=name %>">
					</td>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;"><input type="submit"
						value="삭  제" onclick="javascript:checkDelete()"> <input
						type="button" value="취  소" onclick="javascript:history.back(-1);">
					</td>
				</tr>
				<% 
           } catch (SQLException e) {
        	   out.println("테이블 호출에 실패했습니다.<br>");
        	   out.println("SQLException: " + e.getMessage());
           } finally {
        	   if (rs != null)
        		   rs.close();
        	   if (conn != null)
        		   conn.close();
        	   if (pstmt != null)
        		   pstmt.close();
           }
        %>
			</table>
		</form>
	</div>
	>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>