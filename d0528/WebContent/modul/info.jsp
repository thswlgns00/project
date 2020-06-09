<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
<style>

table {
	width: 100%;
	heigth: 100%;
	border: 1;
	cellpadding: 0;
	cellspacing: 0;
	align: center;
}

.con {
	width: 80%;
	height: 500px;
	background-color: green;
}

</style>
</head>
<body>
<table>
	<tr>
		<td colspan=2 height=10% bgcolor=yellow>
		<jsp:include page="header.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td class="con">
		<img src="../image/bird2.jpg" width=350 />
		</td>
	</tr>
	<tr>
		<td width=20% bgcolor="pink">
		<jsp:include page="right.jsp"></jsp:include>
		</td>
	</tr>
	<tr>
		<td colspan="2" height=10% bgcolor="gray">
			<jsp:include page="footer.jsp"></jsp:include>
		</td>
	</tr>
</table>
</body>
</html>