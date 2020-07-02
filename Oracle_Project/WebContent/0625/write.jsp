<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%@ include file="DBcon.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원등록</title>
<style type="text/css">
	.table {
	
	width: 500px;
	height: 200px;
	border: 1px solid gray;
}

.table th{
	border: 1px solid black;
}
.table td{
	border: 1px solid black;
}

</style>
<script>
function check1() {
	location.href="modify.jsp";
	
}

	function check() {
		if (document.form.custname.value == "") {
			alert("회원성명이 입력되지 안았습니다.");
			document.member_tbl_02.custname.focus();
		}else{
			alert("성적입력이 완료 되었습니다!");
			document.form.submit();
		}
	}
	
	<%
		request.setCharacterEncoding("utf-8");%>
	<%
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	String id = "";
	try {
		String sql = " select member_seq_02.nextval from dual";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if (rs.next()) {	
			
			id = rs.getString(1);
		}
		}catch (SQLException e) {
			out.print("테이블 호출 실패");
			System.out.println("wer" + e.getMessage());
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
		}
	%>
</script>

<link rel="stylesheet"href="common.css">

</head>
<body>
<div id = "wrap">
<%@include file = "header.jsp" %>
<%@include file = "nav.jsp" %>

<section class="section" style="height: 100%" >
<h2 style="text-align: center">홈쇼핑 회원 등록</h2><br>
<form name="form" method="post" action="write_ok.jsp">
<table class="table">
<tr>
<th>회원번호(자동발생)</th>
<td><input type="text" name=custno value=<%=id %>></td>
</tr>
<tr>
<th>회원성명</th>
<td><input type="text" name=custname></td>
</tr>
<tr>
<th>회원전화</th>
<td><input type="text" name=phone ></td>
</tr>
<tr>
<th>회원주소</th>
<td><input type="text" name=address ></td>
</tr>
<tr>
<th>가입일자</th>
<td><input type="text" name=joindate ></td>
</tr>
<tr>
<th>고객등급[A:VIP,B:일반,C:직원]</th>
<td><input type="text" name=grade ></td>
</tr>
<tr>
<th>도시코드</th>
<td><input type="text" name=city ></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="button" value="등록" onclick="javascript:check()">
<input type="button" onclick="javascript:check1()" value="조회" >
</td>
</tr>

</table>
</form>
</section>
</div>
<%@include file = "footer.jsp" %>
</body>
</html>