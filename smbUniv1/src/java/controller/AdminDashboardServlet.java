package controller;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import model.jdbc;
import java.sql.ResultSet;
import javax.servlet.annotation.WebServlet;

// made by Muh. Agung Gustiansyah

@WebServlet("/pages/adminDash")
public class AdminDashboardServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        jdbc db = new jdbc();
        db.connect();
        String errorMessage = "";
        ResultSet rs = null;

        if (db.isConnected) {
            rs = db.getData("SELECT calon_mahasiswa.nama, calon_mahasiswa.nisn, "
                          + "pilihan_jurusan.piljurusan1, pilihan_jurusan.piljurusan2, "
                          + "pilihan_jurusan.piljurusan3, pilihan_jurusan.piljurusan4 "
                          + "FROM calon_mahasiswa "
                          + "LEFT JOIN pilihan_jurusan ON calon_mahasiswa.id = pilihan_jurusan.calon_mahasiswa_id");
        } else {
            errorMessage = db.message;
        }

        request.setAttribute("students", rs);
        request.setAttribute("error", errorMessage);
        RequestDispatcher dispatcher = request.getRequestDispatcher("adminDash.jsp");
        dispatcher.forward(request, response);
        db.disconnect();
    }
}