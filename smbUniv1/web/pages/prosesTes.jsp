<%@ page import="java.sql.*" %>
<%@ page session="true" %>
<%
    // Inisialisasi skor untuk masing-masing jurusan
    int skorTI = 0;
    int skorSI = 0;
    int skorRK = 0;
    int skorMJ = 0;

    // Ambil nilai dari 15 pertanyaan
    for (int i = 1; i <= 15; i++) {
        String jawaban = request.getParameter("q" + i);
        if (jawaban != null) {
            switch (jawaban) {
                case "TI":
                    skorTI++;
                    break;
                case "SI":
                    skorSI++;
                    break;
                case "RK":
                    skorRK++;
                    break;
                case "MJ":
                    skorMJ++;
                    break;
            }
        }
    }

    // Tentukan jurusan dengan skor tertinggi
    String jurusanRekomendasi = "Teknik Informatika";
    int maxSkor = skorTI;

    if (skorSI > maxSkor) {
        jurusanRekomendasi = "Sistem Informasi";
        maxSkor = skorSI;
    }
    if (skorRK > maxSkor) {
        jurusanRekomendasi = "Rekayasa Kedokteran";
        maxSkor = skorRK;
    }
    if (skorMJ > maxSkor) {
        jurusanRekomendasi = "Manajemen";
        maxSkor = skorMJ;
    }

    // Ambil username dari session
    String username = (String) session.getAttribute("username");

    // Simpan hasil ke tabel calon_mahasiswa
    Connection conn = null;
    PreparedStatement ps = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/seleksimaba", "root", "");

        String sql = "UPDATE calon_mahasiswa SET rekomendasi_jurusan = ? WHERE username = ?";
        ps = conn.prepareStatement(sql);
        ps.setString(1, jurusanRekomendasi);
        ps.setString(2, username);
        ps.executeUpdate();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Terjadi kesalahan: " + e.getMessage() + "</p>");
    } finally {
        try { if (ps != null) ps.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }

    response.sendRedirect("hasilTes.jsp?jurusan=" + jurusanRekomendasi);
%>