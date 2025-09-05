package com.VtalentDashboard.dao;

	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.ResultSet;
	import java.sql.SQLException;
	

	public class Assessmentdao {
		Connection con;
		PreparedStatement p;
		ResultSet result ;

		
		public Assessmentdao() {
			con=SQLConnInst.getInstance();
		}
		
		public ResultSet fatchdata(String course,String type) {
			System.out.println(type);
			
			try {
				p = con.prepareStatement("select * from test where course=? and type=?");
				p.setString(1, course);
				p.setString(2, type);
				result = p.executeQuery();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.print("hii" + result);
			return result;
			
		}

}
