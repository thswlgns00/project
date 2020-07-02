<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
<style type="text/css">
table{
 border: 1px solid black;
text-align: center;
	width: 700px;	
	margin: auto;
 }
 table th{
 border: 1px solid black;
 text-align: center;
 }
 table td {
  border: 1px solid black;
 text-align: left;	
}
</style>

<script type="text/javascript">
function check() {
	if(document.aform.custname.value==""){
		alert("이름을 입력하세요");
	document.aform.custname.focus();	
}else{
document.aform.submit();
}
}
</script>
<%@include file="Dbconn.jsp"%>
<%
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String i = "";
	try {
		String sql = "select tbl_seq.nextval from dual";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if (rs.next())
		i = rs.getString(1);
	} catch (Exception e) {
		System.out.println("실패" + e.getMessage());
		e.printStackTrace();
	} finally {
		if (conn != null)
			conn.close();
		if (pstmt != null)
			pstmt.close();
	}
%>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>

	<div class="section">
		<h1 align="center">홈쇼핑 회원 등록</h1>
		<br>
		<form action="section_member_ok.jsp" method="post" name="aform">
			<table>

				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type="text" name="custno" size="10" value="<%=i%>"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type="text" name="custname" size="10"></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type="text" name="phone" size="15"></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type="text" name="address" size="30"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type="text" name="joindate" size="10"></td>
				</tr>
				<tr>
					<th>고객등급[A:vip,B:일반,C:직원]</th>
					<td><input type="text" name="grade" size="5"></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type="text" name="city" size="5"></td>
				</tr>
				<tr>
					<th colspan="3"><input type="button" value="등록"
						onclick="javascript:check()"> <input type="button"
						value="조회" onclick= "javascript:window.location=list_member.jsp"></th></tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>