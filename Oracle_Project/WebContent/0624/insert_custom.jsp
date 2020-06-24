<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
function check() {
	if(document.form.id.value ==""){
		alert("아이디를 입력하세요");
		document.form.id.focus();
	}else if(document.form.name.value ==""){
		alert("이름을 입력하세요");
		document.form.name.focus();
	}else if(document.form.passwd.value ==""){
		alert("비밀번호를 입력하세요");
		document.form.passwd.focus();
	}if (document.form.passwd.value != document.form.passwd1.value) {
		alert("패스워드를 다시 확인하세요!");
		document.form.passwd.focus();
		return;
	}
	document.form.submit();
	
}
</script>
<%@ include file="DBcon.jsp"%>
<%
	request.setCharacterEncoding("utf-8");%>
<%
ResultSet rs = null;
PreparedStatement pstmt = null;
String id = "";
try {
	String sql = " select member_seq.nextval from dual";
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
</head>
<body>
	<div id=wrap>
		<header> <%@ include file="header.jsp"%>
		</header>
		<nav> <%@ include file="nav.jsp"%> </nav>
		<section>
	<h1>고객 정보 등록 화면</h1>
	<hr>
	<form name="form" method="post" action="insert_custom_ok.jsp">
	<table>
	<tr>
	<th>아이디</th>
	<td><input type="text" name ="id" value=<%=id %>>자동증가</td>
	</tr>
	<tr>
	<th>이름</th>
	<td><input type="text" name ="name" ></td></tr>
	<tr>
	<th>비밀번호</th>
	<td><input type="password" name ="passwd" ></td></tr>
	<tr>
	<th>비밀번호 확인</th>
	<td><input type="password" name ="passwd1" ></td></tr>
	<tr>
	<th>성별</th>
	<td><input type="radio" name="gender" value="1" checked>남
						<input type="radio" name="gender" value="2">여</td></tr>
					<tr>
					<th>이메일</th>
					<td><input type="text" name="email">@
						<select name="email1">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.co.kr">google.co.kr</option>
					</select></td>
				</tr>
				<tr>
				<th>핸드폰</th>
				<td><select name="phone">
							<option value="010">010</option>
							<option value="016">016</option>
							<option value="011">011</option>
					</select>
					-<input type="text" name ="phone1">-<input type="text" name ="phone2">
					</td></tr> 
					<tr>
					
					<th>전화번호</th>
					<td><input type="text"name="tel">
						- <input type="text"name="tel1"> - <input
						type="text" name="tel2"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" size = "70">
					</td>
				</tr>
				<tr>
					<th >차량번호</th>
					<td><input type="text"name="carNumber">
					</td>
				</tr>
				<tr>
					<th>차량종류</th>
					<td><input type="text" name="carType">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2" align="center">
					<input type="button" value="저장" onclick="javascript:check();">
					 <input type="reset" value="다시작성"></td>
				</tr>
		
	
				
				
	</table>
		</form>
	 </section>
		<footer> <%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>