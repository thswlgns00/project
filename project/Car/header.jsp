<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome to yangjung</title>
<style>
#logo {
	float: left;
	vertical-align: middle;
	margin: 10px 0 0 20px;
	color: darkblue;
	font-size: 48px;
}

.right {
	float: right;
}
</style>
</head>
<body>
	<header>

		<%
			String checkName = null;
			checkName = (String) session.getAttribute("s_Name");

			if (checkName == null) {
		%>
		<a id="logo" href="index.jsp">카센터 (붕붕이 나라)</a> <span class="right"
			style="padding: 20px 10px;">
			<form method="post" action="login.jsp">
				<fieldset>
					<label for="ID">회원ID:</label> <input type="text" id="id" name="id"
						size="10" maxlength="10" required="required" /> <label for="pasd">비밀번호:</label>
					<input type="password" id="passwd" name="passwd" size="10"
						maxlength="10" required="required" />
					<button type="submit">로그인</button>
					<a href="form1.jsp">회원가입</a>

				</fieldset>
			</form>
		</span>
		<%
			} else {
		%>
		<a id="logo" href="index.jsp">카센터 (붕붕이 나라)</a> <span class="right"
			style="padding: 30px 10px;"> <%=checkName%>님 환영합니다. <a
			href="logout.jsp">logout</a>

		</span>
		<%
			}
		%>
	</header>

</body>
</html>