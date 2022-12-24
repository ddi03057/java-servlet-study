package jdbcexam;

import java.sql.*;

public class JDBCConnect {
	
	public Connection getConnection() throws Exception{
		//Class.forName("com.mysql.jdbc.Driver");
		//Class.forName(:oracel.jdbc.driver.OracleDriver");
		Class.forName("com.mysql.cj.jdbc.Driver"); // 실무용
		Connection conn = DriverManager.getConnection("jdbc:mysql://43.200.187.8/mysql?user=root&password=12345");
		//connection String
		
		//--
		// jdbc:mysql://데이터베이스 주소 : 포트/접근할 데이터베이스명?user=아이디&password=비밀번호
		// jdbc:oracle:thin://
		// jdbc:mssql://
		return conn;
	}
	
}
