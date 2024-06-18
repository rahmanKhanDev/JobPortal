package com.my.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
private static Connection con;

//util class
//getting connection object
public static Connection getConnection() {
	try {
		 
		Class.forName("com.mysql.cj.jdbc.Driver");
		con=DriverManager.getConnection("jdbc:mysql:///job_portal","root","root");
		} catch (ClassNotFoundException | SQLException e) {
	
		e.printStackTrace();
	}
	
	return con;
	

}	
}
