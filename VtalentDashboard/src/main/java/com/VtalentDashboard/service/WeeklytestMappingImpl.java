package com.VtalentDashboard.service;
import java.sql.ResultSet;

import com.VtalentDashboard.dao.Assessmentdao;
import com.VtalentDashboard.dao.Pythondao;
import com.VtalentDashboard.dao.WeeklytestDao;



	public class WeeklytestMappingImpl implements WeeklytestMapping{

		@Override
		public ResultSet fatch(String r) {
			WeeklytestDao d = new WeeklytestDao();
			ResultSet result = d.fatch(r);
			return result;
		}
		
		public ResultSet fatchpython(String r) {
			Pythondao d1=new Pythondao();
			//WeeklytestDao d = new WeeklytestDao();
			System.out.print("hii"+r);
			ResultSet result = d1.fatch(r);
			return result;
		}
		
	

		public ResultSet fatchAssessmentLinks(String course,String type) {
			Assessmentdao dao= new Assessmentdao();
			ResultSet data=dao.fatchdata(course,type);
			return data;
		}
		

	}



