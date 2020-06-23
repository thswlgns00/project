<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
<script>
function check() {
	if(document.form.name.value == "") {
		alert("성명이 입력되지 않았습니다");
		document.personel.name.focus();
	}
	else if  (document.form.id.value == "") {
		alert("사번이 입력되지 안았습니다.");
		document.personel.id.focus(); 

	}else{
		
		document.form.submit();
	}
}
			</script>
<style>
table {
	margin: auto;
	width: 300px;
	height: 100px;
	border: 1px solid gray;
}

th, td {
	border: 1px solid gray;
}
</style>
</head>
<body>
	<div id=wrap>
		<header> <%@ include file="header.jsp"%>
		</header>
		<nav> <%@ include file="nav.jsp"%> </nav>
		<section> <!--내용 시작-->
		<h2>인사관리 퇴사처리 화면</h2>
		<form name=form method="post" action="delete1_ok.jsp">
			<table>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>사원번호</th>
					<td><input type="text" name="id"></td>
				</tr>
				<td colspan="2" id=button><input type="button" value="삭제"
					onclick="javascript:check()"> <input type="button"
					value="취소" onclick="javascript:history.back(-1);"></td>

			</table>
		</form>
		</section>
		<footer> <%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>