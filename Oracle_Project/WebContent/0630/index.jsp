<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<h1 align="center">쇼핑몰 회원관리 프로그램</h1><br>
	<p>
			쇼핑몰 회원정보와 회원매출정보 데이터 베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
			프로그램순서
		</p>
		<table>
		<ol>
			<li>회원정보 테이블을 생성한다.</li>
			<li>미술정보 테이블을 생성한다.</li>
			<li>회원정보. 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다.</li>
			<li>회원정보 입력화면프로그램을 작성한다.</li>
			<li>회원정보 조회 프로그램을 작성한다.</li>
			<li>회원은 매출 정보 조회 프로그램을 작성한다.</li>
		</ol>
		</table>
</div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>