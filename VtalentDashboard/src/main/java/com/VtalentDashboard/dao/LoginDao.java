package com.VtalentDashboard.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.VtalentDashboard.entity.LoginEntity;

public class LoginDao {
	
	Connection con;
	PreparedStatement p;
	ResultSet result ;
	
	public LoginDao() {
		con=SQLConnInst.getInstance();
	}
	
	public ResultSet loginDetails(LoginEntity l) {
		
		if(l.getRole().equals("student")) {
		try {
			String sql="select * from student where  Email_id=? or Name = ?  and Password = ?";
			p=con.prepareStatement(sql);
			p.setString(1, l.getUsername());
			p.setString(2, l.getUsername());
			p.setString(3, l.getPassword());
			result = p.executeQuery();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		}else {
			try {
				String sql="select * from admin where username = ? and password = ?";
				p=con.prepareStatement(sql);
				p.setString(1, l.getUsername());
				p.setString(2, l.getPassword());
				result = p.executeQuery();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return result;
		}
		
		
	}

}
