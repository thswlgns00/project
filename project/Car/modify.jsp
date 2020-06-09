<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
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
	height: 580px;
	whdth: 100%;
}

div>img {
	border: none;
	height: 77%;
	width: 100%;
}
</style>
<script language = "javascript">  
function modifyCheck()
  {
   var form = document.modifyform;
   
   if( !form.password.value )
   {
    alert( "비밀번호를 적어주세요" );
    form.password.focus();
    return;
   }
   
  if( !form.title.value )
   {
    alert( "제목을 적어주세요" );
    form.title.focus();
    return;
   }
 
  if( !form.memo.value )
   {
    alert( "내용을 적어주세요" );
    form.memo.focus();
    return;
   }  
 		form.submit();
  } 
</script>
<%
	request.setCharacterEncoding("utf-8");
	Class.forName("com.mysql.cj.jdbc.Driver");
	String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
	String id = "";
	String pass = "";
	String name = "";
	String password = "";
	String title = "";
	String memo = "";
	int idx = Integer.parseInt(request.getParameter("idx"));
	
	try {
		
		Connection conn = DriverManager.getConnection(jdbc_url,"thswlgns00","Cc3220644!");
		Statement stmt = conn.createStatement();
		String sql = "select name, password, title, memo from board where num=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		
		if(rs.next()){
			
			name = rs.getString(1);
			password = rs.getString(2);
			title = rs.getString(3);
			memo = rs.getString(4);
		}
		
		rs.close();
		stmt.close();
		conn.close();
	}catch(SQLException e) {
		out.println( e.getMessage() );
	}
	 
%>
 </head>
 <body>
 	<%
		String checkName = "";
		//session 값을 받아옴
		checkName = (String) session.getAttribute("s_Name");
		//로그인이 안된 경우(경고창을 띄움)
		if (checkName == null) {
	%>
	<script type="text/javascript">
		alert("먼저 로그인을 하세요.");
		history.back();
	</script>
	<%
		} else { //로그인이 되있는 경우라면 게시판을 띄움
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
<table align = "center">
<form name=modifyform method=post action="modify_ok.jsp?idx=<%=idx%>">
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('../images/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="../images/table_left.gif" width="5" height="30" /></td>
      <td>수정</td>
      <td width="5"><img src="../images/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
 
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="title" size="50" maxlength="100" value = "<%=title%>"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td> 
      <td><input type = "hidden" name="name" size="50" maxlength="50" value = "<%=name%>"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input type="password" name = "password" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="memo" cols="50" rows="13"><%=memo%></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="수정" OnClick="javascript:modifyCheck();">
       <input type=button value="취소" OnClick="javascript:history.back(-1)">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
 </div>
	<jsp:include page="footer.jsp"></jsp:include>
	<%
		}
	%>
</body> 
</html>