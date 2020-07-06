<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if (document.form.studNo.value == "") {
			alert("학번을를 입력하세요");
			document.form.studNo.focus();
			return;
		} else if (document.form.name.value == "") {
			alert("이름을를 입력하세요");
			document.form.name.focus();
			return;
		} else if (document.form.dept.value == "") {
			alert("학번을를 입력하세요");
			document.form.dept.focus();
			return;
		} else if (document.form.position.value == "") {
			alert("학년을를 입력하세요");
			document.form.position.focus();
			return;
		} else {
			document.form.submit();
		}
	}
</script>
<style type="text/css">
.table {
	border: 2px solid black;
	width: 600px;
	height: 300px;
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
<link rel="stylesheet" href="common.css">
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<jsp:include page="nav.jsp"></jsp:include>
	<div class="section">

		<br>
		<br>
		<br>
		<h1 align="center">학사정보 추가</h1>
		<br>
<form action="insert_1_ok.jsp" name="form" method="post">
		<table class="table">
			
				<tr>
					<th>학번</th>
					<td><input type="text" name="studNo" size="25"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" name="name" size="25"></td>
				</tr>
				<tr>
					<th>학과</th>
					<td><select name="dept">
							<option value="1">컴퓨터공학과
							<option value="2">기계공학과
							<option value="3">전자과
							<option value="4">영문학과
							<option value="5">일어과
							<option value="6">경영학과
							<option value="7">무역학과
							<option value="7">교육학과
					</select></td>
				</tr>
				<tr>
					<th>학년</th>
					<td><select name="position">
							<option value="1">1학년
							<option value="2">2학년
							<option value="3">3학년
							<option value="4">4학년
					</select></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" size="25"></td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input type="text" name="phone" size="25"></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" value="등록" style="width: 100px"
						onclick="javascript:check()"> <input type="button"
						style="width: 100px" value="취소"
						onclick="location.href = 'list2.jsp'"></td>
				</tr>
		</table>
			</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>