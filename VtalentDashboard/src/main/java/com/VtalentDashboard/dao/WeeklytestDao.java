package com.VtalentDashboard.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;


	public class WeeklytestDao {
		Connection con;
		PreparedStatement p;
		ResultSet result ;

		
		public WeeklytestDao() {
			con=SQLConnInst.getInstance();
		}
		
		public ResultSet fatch(String uname) {
			
			try {
				p = con.prepareStatement("select * from java where studentname=? ");
				p.setString(1, uname);
				
				result = p.executeQuery();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
			
		}

}
