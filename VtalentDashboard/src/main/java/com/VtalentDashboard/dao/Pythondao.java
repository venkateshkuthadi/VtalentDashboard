package com.VtalentDashboard.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	

	public class Pythondao {
		Connection con;
		PreparedStatement p;
		ResultSet result ;

		
		public Pythondao() {
			con=SQLConnInst.getInstance();
		}
		
		public ResultSet fatch(String uname) {
			System.out.print("hii"+uname);
			try {
				p = con.prepareStatement("select * from python where studentname=? ");
				p.setString(1, uname);
				
				result = p.executeQuery();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.print("hii" + result);
			return result;
			
		}

}
