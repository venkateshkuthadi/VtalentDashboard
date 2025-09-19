package com.VtalentDashboard.service;

import java.sql.ResultSet;
import java.util.List;

import com.VtalentDashboard.dao.RegistrationDao;
import com.VtalentDashboard.entity.RegistrationEntity;

public class RegistrationMappingImpl implements RegistrationMapping {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}
	RegistrationDao d = new RegistrationDao();
	@Override
	public int insert(RegistrationEntity r) {
		
		int result = d.insert(r);
		
		// TODO Auto-generated method stub
		return result;
	}
	
	public List<RegistrationEntity> fatchrecords() {
		List<RegistrationEntity> result=d.fatchrecords();
		System.out.println(result);
		return result;
	}

}
