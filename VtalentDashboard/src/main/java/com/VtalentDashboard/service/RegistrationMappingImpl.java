package com.VtalentDashboard.service;

import com.VtalentDashboard.dao.RegistrationDao;
import com.VtalentDashboard.entity.RegistrationEntity;

public class RegistrationMappingImpl implements RegistrationMapping {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

	@Override
	public int insert(RegistrationEntity r) {
		RegistrationDao d = new RegistrationDao();
		int result = d.insert(r);
		
		// TODO Auto-generated method stub
		return result;
	}

}
