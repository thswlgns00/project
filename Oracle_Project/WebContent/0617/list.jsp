<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>성적조회</title>
<link rel="stylesheet" href="common.css">
<style>
	section h3 {
		text-align: center;
		padding: 2% 0 2% 0;
	}
	table {
		margin: 0 auto 0 auto;
		width: 70%;
		height: 50%;
		border: 2px solid black;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid black;
	}
	.center {
		text-align: center;
	}
	.right {
		text-align: right;
	}
</style>
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
	<h3>성적조회목록</h3>
	<hr>
	<table>
		<tr>
			<th>학년</th>
			<th>반</th>
			<th>번호</th>
			<th>성명</th>
			<th>국어</th>
			<th>영어</th>
			<th>수학</th>
			<th>역사</th>
			<th>총점</th>
			<th>평균</th>
		</tr>
		<%
			ResultSet rs01 = null;
			PreparedStatement pstmt01 = null;
			
			try {
				String sql = "select sNo, sName, kor, eng, math, hist, kor+eng+math+hist, trunc((kor+eng+math+hist)/4, 3) from examtbl order by sNo";
				pstmt01 = conn.prepareStatement(sql);
				rs01 = pstmt01.executeQuery();
				
				while(rs01.next()) {
					String sNo = rs01.getString(1);
					String sName = rs01.getString(2);
					String kor = rs01.getString(3);
					String eng = rs01.getString(4);
					String math = rs01.getString(5);
					String hist = rs01.getString(6);
					String sum = rs01.getString(7);
					String avg = rs01.getString(8);
		%>
		<tr>
			<% String hak = sNo.substring(0,1); %>
			<% String ban = sNo.substring(1,3); %>
			<% String no = sNo.substring(sNo.length()-2, sNo.length()); %>
			<td class=center><%= hak %></td>
			<td class=center><%= ban %></td>
			<td class=center><%= no %></td>
			<td class=center><%= sName %></td>
			<td class=right><%= kor %></td>
			<td class=right><%= eng %></td>
			<td class=right><%= math %></td>
			<td class=right><%= hist %></td>
			<td class=right><%= sum %></td>
			<td class=right><%= avg %></td>
		</tr>
		<%	}//while문 닫아줌
			}catch (SQLException e) {
			out.print("테이블 호출 실패");
			e.printStackTrace();
			} finally {
				if (rs01 != null)
				rs01.close();
				if (pstmt01 != null)
				pstmt01.close();
			}
		%>
		<%
			ResultSet rs02 = null;
			PreparedStatement pstmt02 = null;
			
			try {
				String sql = "select sum(kor), sum(eng), sum(math), sum(hist), sum(kor)+sum(eng)+sum(math)+sum(hist), trunc((sum(kor)+sum(eng)+sum(math)+sum(hist))/4, 3) from examtbl";
				pstmt02 = conn.prepareStatement(sql);
				rs02 = pstmt02.executeQuery();
				
				while(rs02.next()) {
					String Ksum = rs02.getString(1);
					String Esum = rs02.getString(2);
					String Msum = rs02.getString(3);
					String Hsum = rs02.getString(4);
					String Ssum = rs02.getString(5);
					String Asum = rs02.getString(6);
		%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<th>총점</th>
			<td class=right><%= Ksum %></td>
			<td class=right><%= Esum %></td>
			<td class=right><%= Msum %></td>
			<td class=right><%= Hsum %></td>
			<td class=right><%= Ssum %></td>
			<td class=right><%= Asum %></td>
		</tr>
		<%
			}//while문 닫아줌
			}catch (SQLException e) {
			out.print("테이블 호출 실패");
			e.printStackTrace();
			} finally {
				if (rs02 != null)
				rs02.close();
				if (pstmt02 != null)
				pstmt02.close();
			}
		%>
		<%
			ResultSet rs03 = null;
			PreparedStatement pstmt03 = null;
			
			try {
				String sql = "select trunc(avg(kor), 3), trunc(avg(eng), 3), trunc(avg(math), 3), trunc(avg(hist), 3), trunc(avg(kor)+avg(eng)+avg(math)+avg(hist), 3), trunc((avg(kor)+avg(eng)+avg(math)+avg(hist))/4, 3) from examtbl";
				pstmt03 = conn.prepareStatement(sql);
				rs03 = pstmt03.executeQuery();
				
				while(rs03.next()) {
					String Kavg = rs03.getString(1);
					String Eavg = rs03.getString(2);
					String Mavg = rs03.getString(3);
					String Havg = rs03.getString(4);
					String Savg = rs03.getString(5);
					String Aavg = rs03.getString(6);
		%>
		<tr>
			<td></td>
			<td></td>
			<td></td>
			<th>총평균</th>
			<td class=right><%= Kavg %></td>
			<td class=right><%= Eavg %></td>
			<td class=right><%= Mavg %></td>
			<td class=right><%= Havg %></td>
			<td class=right><%= Savg %></td>
			<td class=right><%= Aavg %></td>
		</tr>
		<%
			}//while문 닫아줌
			}catch (SQLException e) {
			out.print("테이블 호출 실패");
			e.printStackTrace();
			} finally {
				if (rs03 != null)
				rs03.close();
				if (pstmt03 != null)
				pstmt03.close();
				if (conn != null)
				conn.close();
			}
		%>
		
	</table>
	<hr>
	<!--내용 끝-->
	</section>
	<footer>
		<%@ include file="footer.jsp" %>
	</footer>
	</div>
</body>
</html>