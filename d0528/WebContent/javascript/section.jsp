<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common1.css">
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="nav.jsp" %>
<div class ="section" >
<table>
<tr>
<th>가</th>
<th>나1</th>
<th>다</th>
<th>라</th>
<th>마</th>
</tr>
<tr>
<td>123123asdf</td>
<td>123123</td>
<td>123123</td>
<td>123123</td>
<td>123123</td>
</tr>
<tr>
<td>123123</td>
<td>123123</td>
<td>123123</td>
<td>123123</td>
<td>123123</td>
</tr>
<tr>
<td>123123</td>
<td>123123</td>
<td>123123</td>
<td></td>
<td></td>
</tr>
<tr>
<td colspan="5"><input class="button" type="button"  value="전송">
<input class="button"  type="button"  value="취소"></td>
</tr>
</table>
</div>
<%@include file="footer.jsp" %>
</body>
</html>