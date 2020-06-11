<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
nav {
	margin: 0 0 0 0;
	float: left;
	width: 100%;
	background-color: aqua;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 14px;
	font-weight: bold;
	color: #ff0099;
	font-size: 14px;
}

nav ul {
	list-style: none;
}

nav ul li {
	float: left;
	margin: 0px 5px;
	list-style: none;
}

nav a {
	display: block;
	padding: 5px 5px 8px 5px;
	height: 20px;
	text-decoration: none;
	color: #000000;
	border-style: hidden hidden solid hidden;
	border-color: transparent;
}

.section {
	height: 580px;
	whdth: 100%;
}

div>img {
	border: none;
	height: 77%;
	width: 100%;
}

table, td {
	border: 1px solid;
}

table {
	width: 80%;
	height: 100px;
	margin: auto;
	text-align: center;
}

td {
	margin: auto;
	text-align: center;
}

#b {
	margin: auto;
	text-align: left;
}

#t1 {
	margin: 20px 0 5px 10px;
	color: darkblue;
	font-size: 30px;
	text-align: center;
}
</style>
<script type="text/javascript">
	function check() {
	
		if (document.fname.id.value == "") {
			alert("id를 입력하세요!");
			document.fname.id.focus();
			return;
		} else if (document.fname.name.value == "") {
			alert("이름을 입력하세요!");
			document.fname.name.focus();
			return;
		}
		if (document.fname.passwd.value != document.fname.passcheck.value) {
			alert("패스워드를 다시 확인하세요!");
			document.fname.passwd.focus();
			return;
		}
		document.fname.submit();
	}
	function id_chk() {
		window.open("id_chk.jsp?id=" + document.fname.id.value,
				target = "_self");
	}
</script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<nav>
		<ul>
			<li><a href="#">회사소개</a></li>
			<li><a href="#">고객정보 등록</a></li>
			<li><a href="#">부품정보 등록</a></li>
			<li><a href="member_list.jsp">고객정보 목록</a></li>
			<li><a href="text.jsp">게시판</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<div class="section">


		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<div id="t1">고객관리</div>
		<form name="fname" method="post" action="jdbctest1.jsp">

			<table>
				<tr>
					<td align="center" width="120">아이디</td>
					<td id=b><input type="text" name="id" size="30"> <input
						type="button" value="중복체크" onclick="id_chk()"></td>
				</tr>
				<tr>
					<td align="center" width="120">이름</td>
					<td id=b><input type="text" name="name" size="30"></td>

				</tr>
				<tr>
					<td align="center" width="120">비밀번호</td>
					<td id=b><input type="password" name="passwd" size="30">
					</td>
				</tr>
				<tr>
					<td align="center" width="120">비밀번호확인</td>
					<td id=b><input type="password" name="passcheck" size="30">
					</td>
				</tr>
				<tr>
					<td align="center" width="120">성별</td>
					<td id=b><input type="radio" name="gender" value="남" checked>남
						<input type="radio" name="gender" value="여">여</td>
				</tr>
				<tr>
					<td align="center" width="120">이메일</td>
					<td id=b><input type="text" size=30 value="" name="email1">@
						<select name="email2" style="width: 100px;">
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="google.co.kr">google.co.kr</option>
					</select></td>
				</tr>
				<tr>
					<td align="center" width="120">핸드폰</td>
					<td id=b><select name="h1" style="width: 70px;">
							<option value="010">010
							<option value="011">011
							<option value="012">012
					</select> - <input type="text" size=10 value="" name="h2"> - <input
						type="text" size=10 value="" name="h3"></td>
				</tr>
				<tr>
					<td align="center" width="120">전화번호</td>
					<td id=b><input type="text" size=10 value="" name="p1">
						- <input type="text" size=10 value="" name="p2"> - <input
						type="text" size=10 value="" name="p3"></td>
				</tr>
				<tr>
					<td align="center" width="120">주소</td>
					<td id=b><input type="text" size="80" value="" name="address">
					</td>
				</tr>
				<tr>
					<td align="center" width="120">차량번호</td>
					<td id=b><input type="text" size=80 value="" name="carNumber">
					</td>
				</tr>
				<tr>
					<td align="center" width="120">차량종류</td>
					<td id=b><input type="text" size=80 value="" name="carType">
					</td>
				</tr>
				<tr align="center">
					<td colspan="2" align="center">
					<input type="button" value="저장" onclick="javascript:check();">
					 <input type="reset" value="다시작성"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
