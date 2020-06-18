<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert</title>
<link rel="stylesheet" href="common.css">
</head>
<body>
	<div id=wrap>
	<header>
		<%@ include file="header.jsp" %>
	</header>
	<nav>
		<%@ include file="nav.jsp" %>
	</nav>
	<section>
	<!--내용 시작-->
	<%@ include file="DBconn.jsp" %>
	<%
		String sNo = request.getParameter("sNo");
		String sName = request.getParameter("sName");
		String kor = request.getParameter("kor");
		String eng = request.getParameter("eng");
		String math = request.getParameter("math");
		String hist = request.getParameter("hist");
		
		PreparedStatement pstmt = null;
		
		try{
			
			String sql = "insert into examtbl values (?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sNo);
			pstmt.setString(2, sName);
			pstmt.setString(3, kor);
			pstmt.setString(4, eng);
			pstmt.setString(5, math);
			pstmt.setString(6, hist);
			
			pstmt.executeUpdate();
			
			response.sendRedirect("index.jsp");
			
		}catch (Exception e){
			out.print("테이블 삽입 실패");
		}finally {
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	%>
	<!--내용 끝-->
	</section>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
	</div>
</body>
</html>