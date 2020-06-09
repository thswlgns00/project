<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
include.jsp를 출력하는 내용:<%="Hello World" %>
<jsp:include page="sub.jsp" flush="false"></jsp:include>
액션 태그 수행 이후에 출력되는 내용
</body>
</html>