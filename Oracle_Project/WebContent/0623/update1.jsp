<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>modify.jsp</title>
<link rel="stylesheet" href="common.css">

<script type="text/javascript">
function checkWrite() {
	if (document.modify.name.value == "") {
		alert("성명을 입력하세요");
		document.modify.name.focus();
	}else if (document.modify.id.value == "") {
		alert("사원번호을 입력하세요");
		document.modify.id.focus();
	}else if (document.modify.dept.value == "") {
		alert("소속부서를 입력하세요");
		document.modify.dept.focus();
	}else if (document.modify.position.value == "") {
		alert("직급을 입력하세요");
		document.modify.position.focus();
	}else if (document.modify.duty.value == "") {
		alert("직책을 입력하세요");
		document.modify.duty.focus();
	}else if (document.modify.phone.value == "") {
		alert("연락처를 입력하세요");
		document.modify.phone.focus();
	}else {
		document.modify.submit();
	}
}
</script>
</head>
<body>
	<%@ include file="DBconn1.jsp"%>
	<%
		request.setCharacterEncoding("utf-8");
           
	       PreparedStatement pstmt = null;
	       ResultSet rs = null;
	       int idx =0;
	       if(request.getParameter("idx")!=null){	  	       
	  		 idx= Integer.parseInt(request.getParameter("idx"));
	  		 
	       }
	       
	       String id = "";
	       String name = "";
	   	   String dept = "";
	   	   String position = "";
	   	   String duty = "";
	   	   String phone = "";
	   	   
	       try{
	    	   String sql = "select id, name, dept, position, duty, phone from personel where id=?";
	    	   pstmt = conn.prepareStatement(sql);
	    	   pstmt.setInt(1, idx);
	    	   rs = pstmt.executeQuery();
	    	   
	    	   if(rs.next()){
	   			id = rs.getString(1);
	   			name = rs.getString(2);
	   			dept = rs.getString(3);
	   			position = rs.getString(4);
	   			duty = rs.getString(5);
	   			phone = rs.getString(6);
	    	   }
	       } catch (SQLException e) {
	    	   out.println( e.getMessage() );
	       } finally {
	    	   if (pstmt != null)
	    		   pstmt.close();
	    	   if (conn != null)
	    		   conn.close();	       
	    	  }
	%>
 <header>
		<%@ include file="header.jsp" %>
	</header>
	<nav>
		<%@ include file="nav.jsp" %>
	</nav>
	<section>
	<h1 align="center">인사관리 사원정보변경 화면</h1>
	  <form name = "modify" method = "post" action = "update1_ok.jsp?idx=<%=idx%>">
	   <table align="center" cellspacing="2px" cellpadding=0px>
	    <tr>
	      <th align="center">성명</th>
	      <td><input type = "text" name = "name" value = "<%=name%>"></td>
	    </tr>
	    <tr>
	      <th align="center">사원번호</th>
	      <td><input type = "text" name = "id" value = "<%=id%>">사원번호를 통해 정보를 수정</td>
	    </tr>
	    <tr>
	      <th align="center">소속부서</th>
	      <td>
	         <select name = "dept" style="width: 35%;">
                 <option value="인사부"<%if(dept.equals("인사부")){%>selected<%} %>>인사부</option>
                 <option value="경리부"<%if(dept.equals("경리부")){%>selected<%} %>>경리부</option>
                 <option value="홍보부"<%if(dept.equals("홍보부")){%>selected<%} %>>홍보부</option>
                 <option value="기획부"<%if(dept.equals("기획부")){%>selected<%} %>>기획부</option>
                 <option value="영업부"<%if(dept.equals("영업부")){%>selected<%} %>>영업부</option>
             </select>
	      </td>
	    </tr>
	    <tr>
	      <th align="center">직급</th>
          <td>
             <select name="position" style="width: 35%;">
                 <option value="1"<%if(position.equals("1")){%>selected<%} %>>1급</option>
                 <option value="2"<%if(position.equals("2")){%>selected<%} %>>2급</option>
                 <option value="3"<%if(position.equals("3")){%>selected<%} %>>3급</option>
                 <option value="4"<%if(position.equals("4")){%>selected<%} %>>4급</option>
             </select>
          </td>
	    </tr>
	    <tr>
	      <th align="center">직책</th>
	      <td><input type = "text" name = "duty" value = "<%=duty%>"></td>
	    </tr>
	    <tr>
	      <th align="center">연락처</th>
	      <td><input type = "text" name = "phone" value = "<%=phone%>"></td>
	    </tr>
	    <tr>
          <td colspan="2" align="center">
             <input type="button" value="등  록" onclick="javascript:checkWrite()">
             <input type="button" value="취  소" onclick="javascript:history.back(-1);">
          </td>
        </tr>
	   </table>
	  </form>
	</section>
	<footer>
	<%@include file = "footer.jsp" %>
	</footer>
</body>
</html>