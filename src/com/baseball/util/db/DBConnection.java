package com.baseball.util.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnection {
	// public static Connection makeConnection() throws SQLException {

	// Connection conn = null;
	//
	// try {
	// Context ictx = new InitialContext();
	// Context ctx = (Context) ictx.lookup("java:comp/env");
	// DataSource datasource = (DataSource) ctx.lookup("jdbc/baseballl");
	// conn = datasource.getConnection();
	// } catch (NamingException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// return conn;
	// }
	// }
	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static Connection makeConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "project2", "project2");
	}
}
