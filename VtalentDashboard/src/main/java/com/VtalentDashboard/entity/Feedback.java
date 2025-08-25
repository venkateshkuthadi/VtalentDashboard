package com.VtalentDashboard.entity;

public class Feedback {
    private int id;
    private String course;
    private String professor;
    private int rating;
    private String suggestion;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCourse() { return course; }
    public void setCourse(String course) { this.course = course; }

    public String getProfessor() { return professor; }
    public void setProfessor(String professor) { this.professor = professor; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getSuggestion() { return suggestion; }
    public void setSuggestion(String suggestion) { this.suggestion = suggestion; }
}