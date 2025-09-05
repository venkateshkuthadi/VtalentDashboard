package com.VtalentDashboard.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import org.json.JSONObject;

public class Location {
    private static final Map<String, String> locationCache = new HashMap<>();

    
    public String getLocationFromCoordinates(double lat, double lon) {
        String location = "Unknown";
        try {
            if (lat == 0.0 || lon == 0.0) {
               
                return location;
            }

            String apiUrl = "https://nominatim.openstreetmap.org/reverse?format=json&lat=" + lat + "&lon=" + lon;
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("User-Agent", "Mozilla/5.0");

            Thread.sleep(1000); // Respect Nominatim rate limit

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();

            JSONObject json = new JSONObject(response.toString());
            System.out.println("Nominatim Response: " + json.toString());
            JSONObject address = json.getJSONObject("address");

            String neighbourhood = address.optString("neighbourhood", "");
            String suburb = address.optString("suburb", "");
            String village = address.optString("village", "");
            String town = address.optString("town", "");
            String city = address.optString("city", "");
            String district = address.optString("county", "");
            String state = address.optString("state", "");
            String country = address.optString("country", "");

            StringBuilder sb = new StringBuilder();
            if (!neighbourhood.isEmpty()) sb.append(neighbourhood).append(", ");
            if (!suburb.isEmpty()) sb.append(suburb).append(", ");
            if (!village.isEmpty()) sb.append(village).append(", ");
            if (!town.isEmpty()) sb.append(town).append(", ");
            if (!city.isEmpty()) sb.append(city).append(", ");
            if (!district.isEmpty()) sb.append(district).append(", ");
            if (!state.isEmpty()) sb.append(state).append(", ");
            if (!country.isEmpty()) sb.append(country);

            location = sb.toString().replaceAll(", $", "");
            if (location.isEmpty()) {
                location = "No address details found";
            }

        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return location;
    }

    // Detect location from IP → then reverse geocode
    public String getLocationFromIP(String ip) {
        if (locationCache.containsKey(ip)) {
           
            return locationCache.get(ip);
        }
        String location = "Unknown";
        try {
            if ("127.0.0.1".equals(ip) || "::1".equals(ip) || "0:0:0:0:0:0:0:1".equals(ip)) {
                ip = new BufferedReader(
                        new InputStreamReader(new URL("https://api64.ipify.org").openStream())
                ).readLine();
                
            }

            String apiUrl = "http://ip-api.com/json/" + ip;
            URL url = new URL(apiUrl);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");

            BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
            StringBuilder response = new StringBuilder();
            String line;
            while ((line = in.readLine()) != null) {
                response.append(line);
            }
            in.close();

            JSONObject json = new JSONObject(response.toString());
            
            if ("success".equalsIgnoreCase(json.optString("status"))) {
                double lat = json.optDouble("lat", 0.0);
                double lon = json.optDouble("lon", 0.0);
               

                if (lat == 0.0 || lon == 0.0) {
                    return "Invalid coordinates received from IP geolocation";
                }

                location = getLocationFromCoordinates(lat, lon);
                locationCache.put(ip, location); // Cache result
            } else {
                
                location = "Failed to retrieve location from IP: " + json.optString("message");
            }

        } catch (Exception e) {
           
            e.printStackTrace();
        }
        return location;
    }

    
}