<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
		
			<%@ include file="DBconn.jsp"%>
			<%
				int idx = Integer.parseInt(request.getParameter("sNo"));
				try {
					ResultSet rs = null;
					Statement stmt = conn.createStatement();

					String sql = "select sNo from examtbl where sNo=" + idx;
					rs = stmt.executeQuery(sql);
					String sNo;
					if (rs.next()) {
						sNo = rs.getString("sNo");
						if (sNo.equals(sNo)) {
							sql = "delete from examtbl where sNo=" + idx;
							stmt.executeUpdate(sql);
			%>
			<script>
				self.window.alert("해당 글을 삭제하였습니다.");
				location.href = "javascript:history.back()";
				location.href = "list.jsp";
			</script>
			<%
				} else {
							rs.close();
							stmt.close();
							conn.close();
						}
					}
				} catch (SQLException e) {
					out.println(e.toString());
				}
			%>
		