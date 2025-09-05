package com.VtalentDashboard.service;

import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import com.VtalentDashboard.dao.LoginDao;
import com.VtalentDashboard.entity.LoginEntity;
import com.VtalentDashboard.entity.StudentEntity;

public class LoginService {
	StudentEntity s=new StudentEntity();
	public StudentEntity verifylogin(LoginEntity l) {
		
		LoginDao dao = new LoginDao();
	    ResultSet result = dao.loginDetails(l);
	    
	   
	    try {
	        if (result != null && result.next()) {
	        	s.setsName(result.getString(1));
	        	s.setSid(result.getString(3));
	        	s.setCourse(result.getString(4));
	        	
	        	System.out.println("Hii"+s.getCourse());
	        	
	            return s;
	        } else {
	        	System.out.println("Hii");
	            return s;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        return s;
	    }
	}
	
	

	public static void main(String[] args) {
		

	}

}
