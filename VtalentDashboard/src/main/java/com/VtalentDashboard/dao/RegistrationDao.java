package com.VtalentDashboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.VtalentDashboard.entity.RegistrationEntity;
import com.mysql.cj.protocol.Resultset;

public class RegistrationDao {
	Connection con;
	PreparedStatement p;
	ResultSet result;
	public RegistrationDao() {
		con =SQLConnInst.getInstance();
	}
	public boolean isEmailExists(String email) {
        try {
            p = con.prepareStatement("SELECT 1 FROM student WHERE email_id = ?");
            p.setString(1, email);
            result = p.executeQuery();
            return result.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
	 public boolean isContactExists(String contactNo) {
	        try {
	            p = con.prepareStatement("SELECT 1 FROM student WHERE contact_no = ?");
	            p.setString(1, contactNo);
	            result = p.executeQuery();
	            return result.next();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return false;
	    }



	public int insert(RegistrationEntity r) {
		int result = 0;
		try {
			System.out.println("Hiiii.....");
			p = con.prepareStatement("INSERT INTO student(name, qualification, technology, email_id, Contact_no, college, stream, year, location, Prefered_loc,Password,SID) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)",Statement.RETURN_GENERATED_KEYS);
			p.setString(1, r.getName());
			p.setString(2, r.getQualification());
			p.setString(3, r.getTechnology());
			p.setString(4, r.getEmail_id());
			p.setString(5, r.getContact_no());
			p.setString(6, r.getCollege());
			p.setString(7,r.getStream());
			p.setString(8, r.getYear());
			p.setString(9,r.getLocation());
			p.setString(10, r.getPrefered_loc());
			p.setString(11,r.getPassword());
			p.setInt(12, r.getSID());
			result = p.executeUpdate();
			ResultSet rs = p.getGeneratedKeys();
			if (rs.next()) {
			    int sid = rs.getInt(1);
			    System.out.println("SID: " + sid);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	
	
	
	

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
	}
	public RegistrationEntity fatchdata(RegistrationEntity r) {
		try {
		p = con.prepareStatement("select * from student WHERE email_id = ? and name=? ");
			p.setString(1, r.getEmail_id());
			p.setString(2, r.getName());
			
			try (ResultSet rs = p.executeQuery()) {
	            if (rs.next()) {
	                RegistrationEntity user = new RegistrationEntity();
//	                user.setId(rs.getInt("id"));
//	                user.setName(rs.getString("name"));
//	                user.setEmail(rs.getString("email"));
//	                user.setContact(rs.getString("contact_no"));
//	                user.setPassword(rs.getString("password")); // optional
	                r.setName(rs.getString("Name"));
	                r.setQualification(rs.getString("Qualification"));
	                r.setEmail_id(rs.getString("Email_id"));
	                r.setContact_no(rs.getString("Contact_no"));
	                r.setYear(rs.getString("Year"));
	                r.setStream(rs.getString("Stream"));
	                r.setCollege(rs.getString("College"));
	                r.setLocation(rs.getString("Location"));
	                r.setTechnology(rs.getString("Technology"));
	                r.setPrefered_loc(rs.getString("Prefered_loc"));
	                r.setPassword(rs.getString("Password"));
	                r.setSID(rs.getInt("sid"));
	              
	            }
	        }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  return r;
	}

}
