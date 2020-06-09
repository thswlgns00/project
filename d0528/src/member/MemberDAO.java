package member;

import java.sql.*;
public class MemberDAO {
	
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost/yangjung?serverTimezone=UTC";
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;

}
