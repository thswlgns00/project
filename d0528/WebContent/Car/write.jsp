<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
	margin: 0px 15px;
	list-style: none;
	font-size: 20px;
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
	height: 80%;
	whdth: 100%;
}

div>img {
	border: none;
	height: 77%;
	width: 100%;
}
</style>
<script language="javascript">
	function wirteCheck() {
		var form = document.writeform;
		if (!form.name.value) {
			alert("이름을 적어주세요");
			return;
		}
		if (!form.title.value) {
			alert("비밀번호를 적어주세요");
			form.password.focus();
			return;
		}
		if (!form.memo.value) {
			alert("내용을 적어주세요");
			return;
		}
		form.submit();
	}
</script>
</head>
<body>
	<%
		String checkName = "";
		checkName = (String) session.getAttribute("s_Name");
		if (checkName == null) {
	%>
	<script>
		self.window.alert("먼저 로그인 하세요");
		location.href = "javascript:history.back()";
	</script>
	<%
		}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<nav>
		<ul>
		    <li><a href="#">회사소개</a></li>
			<li><a href="#">고객정보 등록</a></li>
			<li><a href="#">부품정보 등록</a></li>
			<li><a href="member_list.jsp">고객정보 목록</a></li>
			<li><a href="list.jsp">게시판</a></li>
			<li><a href="index.jsp">홈으로</a></li>
		</ul>
	</nav>
	<div class="section">
		<table align=center>
			<form name=writeform method="post" action="write_ok.jsp">
				<tr>
					<td>
						<table width="100%" cellpadding="0" border="0">
							<tr	style="background: url('../image/table_mid.gif') repeat-x; text-align: center;">
								<td width="5"><img src="../image/table_left.gif" width="5"
									height="30"></td>
								<td>글쓰기</td>
								<td width="5"><img src="../image/table_right.gif" width="5"
									height="30"></td>
							</tr>
						</table>
						<table>
							<tr>
								<td>&nbsp;</td>
								<td align="center">제목</td>
								<td><input name="title" size="50" maxlength="100"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">이름</td>
								<td><input name="name" size="50" maxlength="50"
									value=<%=checkName%>></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan = 4></td>
								
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">비밀번호</td>
								<td><input name="password" size="50" maxlength="50"></td>
								<td>&nbsp;</td>
							</tr>
							<tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td align="center">내용</td>
								<td><textarea name="memo" cols="50" rows="13"></textarea></td>
								<td>&nbsp;</td>
							</tr>
							 <tr height="1" bgcolor="#dddddd">
								<td colspan="4"></td>
							</tr> 
							
							 <tr height="1" bgcolor="#82B5DF">
							 
								<td colspan="4"></td>
							</tr>
							<tr align="center">
								<td>&nbsp;</td>
								<td colspan="2"><input type="button" value="등록"
									onclick="javascript:wirteCheck()"> <input
									type=button value="취소" onclick="window.location='list.jsp'">
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
				</tr>
			</form>
		</table>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>