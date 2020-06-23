<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<link rel="stylesheet" href="common.css">
<script>
	function check() {
		if (document.form.id.value == "") {
			alert("사번이 입력되지 안았습니다.");
			document.personel.id.focus();
		}
		else if (document.form.name.value == "") {
			alert("성명이 입력되지 않았습니다");
			document.personel.name.focus();
	
		}else{
			alert("성적입력이 완료 되었습니다!");
			document.form.submit();
		}
	}
</script>
</head>
<body>
	<div id=wrap>
		<header> <%@ include file="header.jsp"%>
		</header>
		<nav> <%@ include file="nav.jsp"%> </nav>
		<section> <!--내용 시작-->
		<h2>인사관리 사원 등록화면</h2>
		<form name=form method="post" action="write1_ok.jsp">
			<table>
				<tr>
					<th align="center">성명</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th align="center">사원번호</th>
					<td><input type="text" name="id"></td>
				</tr>

				<tr>
					<th align="center">소속부서</th>
					<td><select name="dept" style="width: 40%;">
							<option value="">선택</option>
							<option value="인사부">인사부</option>
							<option value="경리부">경리부</option>
							<option value="홍보부">홍보부</option>
							<option value="기획부">기획부</option>
							<option value="영업부">영업부</option>
					</select></td>
				</tr>
				<tr>
					<th align="center">직급</th>
					<td><select name="position" style="width: 40%;">
							<option value="">선택</option>
							<option value="1">1급</option>
							<option value="2">2급</option>
							<option value="3">3급</option>
							<option value="4">4급</option>
					</select></td>
				</tr>
				<tr>
					<th align="center">직책</th>
					<td><input type="text" name="duty"></td>
				</tr>
				<tr>
					<td align="center">연락처</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="button"
						value="등  록" onclick="javascript:check()"> <input
						type="button" value="취  소" onclick="javascript:history.back(-1);">
					</td>
				</tr>
			</table>
		</form>
		</section>
		<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>