<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");

	Connection conn = null;
	PreparedStatement pstmt = null;
	String sql = "";
	ResultSet rs = null;
	String rst = "";
	String msg = "";
	String password = null;
	String idx1 = request.getParameter("idx");
	System.out.println("idx1 : "+idx1);
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passwd = request.getParameter("password");
	
	String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
	
	try{
	Class.forName(jdbc_driver);
	conn = DriverManager.getConnection(jdbc_url,"thswlgns00","Cc3220644!");
	Statement stmt = conn.createStatement();
	
	sql = "select password from board where num="+idx;
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		password = rs.getString("password");
		if(passwd.equals(password)){
			sql = "delete from board where num=" +idx;
			stmt.executeUpdate(sql);
			%>
<script>
			self.window.alert("해당 글을 삭제하였습니다.");
			location.href = "javascript:history.back()";
			location.href = "list.jsp";
			</script>
<%
			rs.close();
			stmt.close();
			conn.close();
					
		}else{
			%>
<
<script type="text/javascript">
			self.window.alert("비밀번호가 틀렸습니다.");
			location.href="javascript:history.back()";
</script>
<%
		}
		
	}else{
		%>
<
<script type="text/javascript">
		self.window.alert("없는 글입니다.");
		location.href="javascript:history.back()";
</script>
<%
	}
	}catch(SQLException e){
		out.println(e.toString());
	}%>
