<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
img{
float: left;
height: 10%;
	width: 10%;
}
section h3{
text-align: center;
color: blue;
}
p{
text-align: left;
}

section h2{

}
#text{
font-weight: bold;
}
#t1{
width: 50%;
}

</style>
</head>
<body>
<div id=wrap>
		<header> <%@ include file="header.jsp"%>
		</header>
		<nav> <%@ include file="nav.jsp"%> </nav>
<section>

<p id = text>반갑습니다.<br>
카센터 붕붕이 나라 입니다.</p>
<hr>

<div id = t1>
<img alt="aa" src="image/Koala.jpg">
<p>안녕하십니까?
카센터 붕붕이나라는 부산시 부산진구 양정동에 위치하고있습니다.
저희 붕붕이 나라는 고객의 다양한 요구에 부합되는 최고의 서비스와 
경쟁력 있는 가격으로 고객 만족을 실현하기 위해 모든 임직원이 다함꼐 노력할 것을 약속드립니다.
항상 한발 앞서가는 고객만족의 경영을 실천하며, 고객과의 약속을 가장 중요시 하겠습니다.
고객여려분의 끊임없는 격려와 관심으로 성원해주시길 부탁드립니다.</p>


<h3>감사합니다.</h3>
</div>
</section>

	<footer> <%@ include file="footer.jsp"%>
		</footer>
		</div>
</body>
</html>