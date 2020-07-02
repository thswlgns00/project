<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select_custom.jsp</title>
<link rel="stylesheet" href="common.css"> 
<style type="text/css">
table{
 border: 1px solid black;
text-align: center;
	width: 900px;	
	margin: auto;
 }
 table th{
 border: 1px solid black;
 text-align: center;
 }
 table td {
  border: 1px solid black;
 text-align: left;
	
}
</style>
</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <jsp:include page="nav.jsp"></jsp:include>
<div class="section">
<h1 align="center">회원목록조회/수정</h1><br>
    <%@ include file = "Dbconn.jsp" %>
    <table>
       <tr>
          <th>회원번호</th>
          <th>회원성명</th>
          <th>전화번호</th>
          <th>주소</th>
          <th>가입일자</th>
          <th>고객등급</th>
          <th>거주지역</th>
       </tr>
       <%
           ResultSet rs = null;
           PreparedStatement pstmt = null;
           
           try{
        	   String sql = "select custno,custname,phone,address,to_char(joindate,'yyyy-mm-dd') as Joindate,grade,to_char(city,'09') as City from member_tbl_02 order by custno asc";
        	   pstmt = conn.prepareStatement(sql);
        	   rs = pstmt.executeQuery();
        	   
        	   while (rs.next()){
        		   int idx = rs.getInt(1);
        		   String custno = rs.getString("custno");
        		   String custname = rs.getString("custname");
        		   String phone = rs.getString("phone");
        		   String address = rs.getString("address");
        		   String joindate = rs.getString("joindate");
        		   String grade = rs.getString("grade");
        		   String city = rs.getString("City");
        		   
        		   String Grade = "";
        		   if(grade.equals("A") || grade.equals("a")){
        			   Grade = "VIP";
        		   }else if(grade.equals("B") || grade.equals("b")){
        			   Grade = "일반";
        		   }else if(grade.equals("C") || grade.equals("c")){
        			   Grade = "직원";
        		   }
        		   
        %>   
        <tr>
           <td>
             <a href="modify_custom.jsp?idx=<%=idx%>"><%=custno %></a>
           </td>
           <td><%=custname %></td>
           <td><%=phone %></td>
           <td><%=address %></td>
           <td><%=joindate %></td>
           <td><%=Grade %></td>
           <td><%=city %></td>
        </tr>
        <% 
        	   }
           } catch (SQLException e) {
        	   out.println("member_tbl_02 테이블 호출이 실패했습니다.<br>");
        	   out.println("SQLException: " + e.getMessage());
           } finally {
        	   if (rs != null)
        		   rs.close();
        	   if (conn != null)
        		   conn.close();
           }
        %>
    </table>
 </div>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>