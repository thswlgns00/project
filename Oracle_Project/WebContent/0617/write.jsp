<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<link rel="stylesheet" href="common.css">
<script>
	function check() {
		if (document.form.sNo.value == "") {
			alert("학번이 입력되지 않았습니다");
			document.form.sNo.focus();
		}
		else if (document.form.sName.value == "") {
			alert("성명이 입력되지 않았습니다");
			document.form.sName.focus();
		}
		else if (document.form.kor.value == "") {
			alert("국어성적이 입력되지 않았습니다");
			document.form.kor.focus();
		}
		else if (document.form.eng.value == "") {
			alert("영어성적이 입력되지 않았습니다");
			document.form.eng.focus();
		}
		else if (document.form.math.value == "") {
			alert("수학성적이 입력되지 않았습니다");
			document.form.math.focus();
		}
		else if (document.form.hist.value == "") {
			alert("역사성적이 입력되지 않았습니다");
			document.form.hist.focus();
		}else{
			alert("성적입력이 완료 되었습니다!");
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<div id=wrap>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<nav>
		<%@ include file="nav.jsp" %>
	</nav>
	<section>
	<!--내용 시작-->
	<h2>학생 성적 입력</h2>
	<form name=form method="post" action="write_ok.jsp">
		<table>
			<tr>
				<th>학번</th>
				<td><input type="text" name="sNo" maxlength="5"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" name="sName"></td>
			</tr>
			<tr>
				<th>국어</th>
				<td><input type="number" name="kor"></td>
			</tr>
			<tr>
				<th>영어</th>
				<td><input type="number" name="eng"></td>
			</tr>
			
			<tr>
				<th>수학</th>
				<td><input type="number" name="math"></td>
			</tr>
			<tr>
				<th>역사</th>
				<td><input type="number" name="hist"></td>
			</tr>
			<tr>
				<td colspan="2" id=button>
				<input type="button" value="성적저장" onclick="javascript:check()">
				</td>
			</tr>
		</table>
	</form>
	<!--내용 끝-->
	</section>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
	</div>
</body>
</html>