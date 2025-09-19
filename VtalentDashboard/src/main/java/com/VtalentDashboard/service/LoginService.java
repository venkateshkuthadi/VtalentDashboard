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
	        	s.setsName(result.getString(2));
	        	s.setSid(result.getString(1));
	        	s.setCourse(result.getString(10));
	        	
	        	System.out.println("Hii"+result.getString(2)+":"+result.getString(1)+":"+result.getString(10));
	        	
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
