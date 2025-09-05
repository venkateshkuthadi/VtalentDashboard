package com.VtalentDashboard.dao;

import java.sql.Connection; 
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.VtalentDashboard.entity.Feedback;





public class FeedbackDAO {
	
	Connection con;
	PreparedStatement p;
	ResultSet result ;
	
	public FeedbackDAO() {
		con=SQLConnInst.getInstance();
	}
	

    public int saveFeedback(Feedback feedback) {
    	int result = 0;
        String sql = "INSERT INTO feedback (course, professor, rating, suggestion) VALUES (?, ?, ?, ?)";
        try {
         

            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, feedback.getCourse());
            stmt.setString(2, feedback.getProfessor());
            stmt.setInt(3, feedback.getRating());
            stmt.setString(4, feedback.getSuggestion());
            result=stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

	
}