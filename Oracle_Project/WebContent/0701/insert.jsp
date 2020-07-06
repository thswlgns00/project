<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if (document.form.id.value == "") {
			alert("학번을  입력하세요");
			document.form.id.focus();
		} else {
			alert("완료되었습니다.");
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
		<h1 align="center">교과목 추가</h1>
		<br> <br> <br> <br>
		<form action="insert_ok.jsp" name="form" method="post">
			<table class="table">
				<tr>
					<th>과목코드</th>
					<td><input type="text" name="id" size="25" required></td>
				</tr>
				<tr>
					<th>과목명</th>
					<td><input type="text" name="name" size="25" required></td>
				</tr>
				<tr>
					<th>학점</th>
					<td><input type="text" name="credit" size="25" required></td>
				</tr>
				<tr>
					<th>담당강사</th>
					<td><select name="lecturer">
							<option value="">담당 강사</option>
							<option value="1">김교수</option>
							<option value="2">이교수</option>
							<option value="3">박교수</option>
							<option value="4">우교수</option>
							<option value="5">최교수</option>
							<option value="6">강교수</option>
							<option value="7">황교수</option>
					</select></td>
				</tr>
				<tr>
					<th>요일</th>
					<td>월요일<input type="checkbox" value="1" name="week">
						화요일<input type="checkbox" value="2" name="week"> 수요일<input
						type="checkbox" value="3" name="week"> 목요일<input
						type="checkbox" value="4" name="week"> 금요일<input
						type="checkbox" value="5" name="week"> 토요일<input
						type="checkbox" value="6" name="week">
					</td>
				</tr>
				<tr>
					<th>시작 시간</th>
					<td><input type="text" name="start_hour" size="25" required></td>
				</tr>
				<tr>
					<th>종료 시간</th>
					<td><input type="text" name="end_end" size="25" required></td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;"><input
						type="button" value="목록" onclick="location.href = 'list1.jsp'">
						<input type="button" value="등록" onclick="javascript:check();">
					</td>
				</tr>
			</table>
		</form>

	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>