package com.VtalentDashboard.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.VtalentDashboard.utils.Location;

public class AttandanceDao {
    Connection con;

    public AttandanceDao() {
        con = SQLConnInst.getInstance();
    }

    // Show attendance for a given username
    public ArrayList<String[]> showAttandance(String username) throws Exception {
        String sql = "SELECT l.login_time, l.logout_time, l.location, l.active_time "
                   + "FROM logins l WHERE l.username = ?";

        ArrayList<String[]> list = new ArrayList<>();

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String login_time = rs.getString("login_time");
                String logout_time = rs.getString("logout_time");
                String location = rs.getString("location");
                String active_time = rs.getString("active_time");

                list.add(new String[]{login_time, logout_time, location, active_time});
            }
        }
        return list;
    }

    // Save logout time
    public boolean saveLogOutTime(String username) throws Exception {
        String sql = "UPDATE logins "
                   + "SET logout_time = NOW(), "
                   + "    active_time = TIMEDIFF(NOW(), login_time) "
                   + "WHERE username = ? AND logout_time IS NULL";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            int result = ps.executeUpdate();
            return result > 0;
        }
    }

    // Save login time
    public boolean saveLogInTime(String username, String ipAddress, String latitude, String longitude) throws Exception {
        Location lca = new Location();
        String location = "Unknown";

        if (latitude != null && !latitude.isEmpty() && longitude != null && !longitude.isEmpty()) {
            try {
                double lat = Double.parseDouble(latitude);
                double lon = Double.parseDouble(longitude);
                location = lca.getLocationFromCoordinates(lat, lon); // Prefer GPS
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            location = lca.getLocationFromIP(ipAddress); // Fallback
        }

        // 🔹 Fetch SID from student table
        String sidQuery = "SELECT SID FROM student WHERE Name = ?";
        int sid = -1;
        try (PreparedStatement ps = con.prepareStatement(sidQuery)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                sid = rs.getInt("SID");
            }
        }

        if (sid == -1) {
            throw new Exception("User not found for username: " + username);
        }

        String sql = "INSERT INTO logins(SID, username, login_time, location) VALUES(?, ?, NOW(), ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sid);
            ps.setString(2, username);
            ps.setString(3, location);

            int result = ps.executeUpdate();
            return result > 0;
        }
    }
    public ArrayList<String[]> showAttandanceBySID(int sid) throws Exception {
        String sql = "SELECT l.login_time, l.logout_time, l.location, l.active_time "
                   + "FROM logins l WHERE l.SID = ?";

        ArrayList<String[]> list = new ArrayList<>();

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, sid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String login_time = rs.getString("login_time");
                String logout_time = rs.getString("logout_time");
                String location = rs.getString("location");
                String active_time = rs.getString("active_time");

                list.add(new String[]{login_time, logout_time, location, active_time});
            }
        }
        return list;
    }

    // Check if user already logged in today
    public boolean hasLoggedInToday(String username) throws Exception {
        String sql = "SELECT COUNT(*) FROM logins "
                   + "WHERE username = ? AND DATE(login_time) = CURDATE()";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        }
        return false;
    }
}