<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify_course.jsp</title>
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
function checkWrite() {
	if (document.modify.id.value == "") {
		alert("과목ID를 입력하세요");
		document.modify.id.focus();
	}else{
		document.modify.submit();
	}
}
</script>
</head>
<body>
	<%@ include file="DBconn.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
           
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       int idx = Integer.parseInt(request.getParameter("idx"));
	       String id = "";
	       String name = "";
	       String credit = "";
	       String lecturer = "";
	       int weekNum = 0;
	       String start_hour = "";
	       String end_end = "";
	       String week = "";
	       try{
	    	   String sql = "select * from course_tbl where id=" + idx;
	    	   pstmt = conn.prepareStatement(sql);
	    	   rs = pstmt.executeQuery();
	    	   if(rs.next()){
	    		 id = rs.getString(1);
	    		 name = rs.getString(2);
	    		 credit = rs.getString(3);
	    		 lecturer = rs.getString(4);
	    		 weekNum = rs.getInt(5);
	    		 start_hour = rs.getString(6);
	    		 end_end = rs.getString(7);
	    		 
	    	   }
	       } catch (SQLException e) {
	    	   out.println( e.getMessage() );
	       } finally {
	    	   if (pstmt != null)
	    		   pstmt.close();
	    	   if (conn != null)
	    		   conn.close();
	    	  }
	       System.out.println(id);
	       System.out.println(idx);
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">
		<br>
		<h1 align="center">교과목 정보 수정</h1>
		<br>
		<form name="modify" method="post" action="modify_ok.jsp?idx=<%=idx%>">
			<table align="center" cellspacing="2px" cellpadding=0px class="table">
				<tr>
					<th align="center">교과목ID</th>
					<td><input type="text" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<th align="center">교과목 명</th>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<th align="center">학점</th>
					<td><input type="text" name="credit" value="<%=credit%>"></td>
				</tr>
				<tr>
					<th align="center">강사</th>
					<td><select name="lecturer">
							<option value="1" <%if(lecturer.equals("1")){%> selected <%} %>>김교수</option>
							<option value="2" <%if(lecturer.equals("2")){%> selected <%} %>>이교수</option>
							<option value="3" <%if(lecturer.equals("3")){%> selected <%} %>>박교수</option>
							<option value="4" <%if(lecturer.equals("4")){%> selected <%} %>>우교수</option>
							<option value="5" <%if(lecturer.equals("5")){%> selected <%} %>>최교수</option>
							<option value="6" <%if(lecturer.equals("6")){%> selected <%} %>>강교수</option>
							<option value="7" <%if(lecturer.equals("7")){%> selected <%} %>>황교수</option>
					</select></td>
				</tr>
				<tr>
					<th align="center">요일</th>
					<td>월: <input type="radio" name="week" value="1"
						<%if(weekNum == 1){%> checked <%} %>> 화: <input
						type="radio" name="week" value="2" <%if(weekNum == 2){%> checked
						<%} %>> 수: <input type="radio" name="week" value="3"
						<%if(weekNum == 3){%> checked <%} %>> 목: <input
						type="radio" name="week" value="4" <%if(weekNum == 4){%> checked
						<%} %>> 금: <input type="radio" name="week" value="5"
						<%if(weekNum == 5){%> checked <%} %>> 토: <input
						type="radio" name="week" value="6" <%if(weekNum == 6){%> checked
						<%} %>>
					</td>
				</tr>
				<tr>
					<th align="center">시작시간</th>
					<td><input type="text" name="start_hour"
						value="<%=start_hour%>"></td>
				</tr>
				<tr>
					<th align="center">종료시간</th>
					<td><input type="text" name="end_end" value="<%=end_end%>"></td>
				</tr>
				<tr>
					<td colspan=2 style="text-align: center;"><input type="submit"
						value="수 정" onclick="javascript:checkWrite()"> <input
						type="button" value="조 회"
						onclick="javascript:window.location='list1.jsp'"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>