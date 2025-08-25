package com.VtalentDashboard.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class SQLConnInst {
	private static SQLConnInst sql = new SQLConnInst(); // limited it to this class
	Connection con;  // SQL predefined Inter/class
	
	private SQLConnInst() {
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vtalent","root","root");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static Connection getInstance() {
		return sql.con;
		
	}
	public static void main(String[] args) {
		System.out.println(SQLConnInst.getInstance());
		
	}
	    
		

}
