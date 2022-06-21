package project.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconn {

		String url = "jdbc:mysql://127.0.0.1:3306/sys?serverTimezone=UTC&characterEncoding=UTF-8";
		String user = "root";
		String password = "123456789";

		public Connection getConection () {
			Connection conn = null;
			
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try {
					conn = DriverManager.getConnection(url, user, password);
				} catch (SQLException e) {
					
					e.printStackTrace();
				}
			} catch (ClassNotFoundException e) {

				e.printStackTrace();
			}
			return conn;
			
		}
		



}
