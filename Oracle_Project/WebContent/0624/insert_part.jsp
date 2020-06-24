<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script type="text/javascript">
function check() {
	if(document.form.partCode.value == ""){
		alert("부품번호를 입력하세요");
		document.form.partCode.focus();		
	}else if(document.form.partName.value == ""){
		alert("부품명을 입력하세요");
		document.form.partName.focus();
	}document.form.submit();
	
}
</script>
</head>
<body>
	<div id=wrap>
		<header> <%@ include file="header.jsp"%>
		</header>
		<nav> <%@ include file="nav.jsp"%> </nav>
		<section>
	<h1>고객 정보 등록 화면</h1>
	<hr>
	
	<form name="form" method="post" action="insert_part_ok.jsp">
	<table>
	<tr>
	<th>부품번호</th>
	<td colspan="3"><input type="text" name ="partCode" ></td>
	</tr>
	<tr>
	<th>부품명</th>
	<td colspan="3"><input type="text" name ="partName" ></td></tr>	
	<tr>
	<th>모델명</th>
	<td colspan="3"><input type="text" name ="model" ></td></tr>
	<tr>
	<th>규격</th>
	<td colspan="3"><input type="text" name ="standard" ></td></tr>
	<th>단위</th>
	<td colspan="3"><input type="text" name ="unit" ></td></tr>
	<th>매입가</th>
	<td><input type="text" name ="purchase" ></td>
	<th>매출가</th>
	<td><input type="text" name ="sales" ></td></tr>
	<tr>
	<th>메모</th>
	<td colspan="3"><textarea cols="50"rows ="8" name ="memo" ></textarea></td></tr>
	<tr align="center">
					<td colspan="6" align="center">
					<input type="button" value="저장" onclick="javascript:check();">
					 <input type="reset" value="다시작성"></td>
				</tr>

	</table>
	</form>
	</section>
	
	
	
	
		<footer> <%@ include file="footer.jsp"%>
		</footer>
	</div>
</body>
</html>