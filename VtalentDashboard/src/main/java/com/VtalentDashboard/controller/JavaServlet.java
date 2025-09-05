package com.VtalentDashboard.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.VtalentDashboard.entity.WeeklyEntity;
import com.VtalentDashboard.service.WeeklytestMappingImpl;

@WebServlet("/javaServlet")
public class JavaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public JavaServlet() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String studentname = request.getParameter("uname");
        System.out.println(studentname);
        WeeklytestMappingImpl imp = new WeeklytestMappingImpl();
        ResultSet result = imp.fatch(studentname);

        List<WeeklyEntity> data = new ArrayList<>();

        try {
            while (result.next()) {
                WeeklyEntity r1 = new WeeklyEntity();
                r1.setId(result.getString("studentid"));
                r1.setCourse(result.getString("studentcourse"));
                r1.setName(result.getString("studentname"));
                r1.setAssessment(result.getString("assessment"));
                data.add(r1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (!data.isEmpty()) {
            request.setAttribute("user", data);
            RequestDispatcher rd = request.getRequestDispatcher("java.jsp");
            rd.forward(request, response);
        } else {
            response.getWriter().println("No records found in database.");
        }
    }
}
