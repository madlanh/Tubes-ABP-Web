<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException"%>
<%
    model.jdbc db = new model.jdbc();
    db.connect();

    Boolean isLulus = null;

    try {
        String username = (String) session.getAttribute("username");
        String query = "SELECT status FROM calon_mahasiswa WHERE username = ?";

        try (PreparedStatement ps = db.getConnection().prepareStatement(query)) {
            ps.setString(1, username);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    boolean statusValue = rs.getBoolean("status");
                    if (rs.wasNull()) {
                        isLulus = null;
                    } else {
                        isLulus = statusValue;
                    }
                } else {
                    isLulus = null;
                }
            }
        }
    } catch (SQLException e) {
        session.setAttribute("error", "Error: " + e.getMessage());
        response.sendRedirect("error.jsp");
        return;
    } finally {
        db.disconnect();
    }

    if (isLulus == null) {
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hasil | Seleksi Mahasiswa Baru</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #54655E;
            color: #fff;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #EAF4F4;
            border-radius: 10px;
            padding: 50px;
            margin-top: 65px;
        }
        .navbar {
            background-color: #EAF4F4;
            font-weight: bold;
        }
        .navbar-brand, .nav-link {
            color: #000;
        }
        .btn-icon {
            background: none;
            border: none;
            margin-left: 10px;
        }
        .btn-icon img {
            width: 20px;
            height: 20px;
        }
        .sidebar {
            position: fixed;
            top: 0;
            right: -300px;
            width: 300px;
            height: 100%;
            background-color: #CCE3DE;
            box-shadow: -2px 0 5px rgba(0, 0, 0, 0.5);
            overflow-y: auto;
            transition: 0.3s;
            z-index: 1000;
            padding: 20px;
        }
        .sidebar.active {
            right: 0;
        }
        .sidebar .close-btn {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 20px;
            cursor: pointer;
            color: #000;
        }
        .sidebar .menu-header {
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .sidebar .profile-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: block;
        }
        .sidebar ul {
            list-style: none;
            padding: 0;
        }
        .sidebar ul li {
            margin: 15px 0;
        }
        .sidebar ul li a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
            display: block;
            padding: 10px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .sidebar ul li a:hover {
            background-color: #A4C3B2;
        }
        .content {
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        .content img {
            width: 80%;
            max-width: 300px;
            height: auto;
        }
        .content h1 {
            color: black;
            font-weight: bold;
            font-size: 2.5rem;
        }
        .content p {
            color: black;
            font-size: 1.2rem;
        }
        @media (min-width: 768px) {
            .content {
                flex-direction: row;
                text-align: left;
            }
            .content .img-container {
                flex: 1;
                display: flex;
                justify-content: center;
            }
            .content .text-container {
                flex: 1;
                padding-left: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="dashMaba.jsp">Seleksi Mahasiswa Baru | SMB</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="dashMaba.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item d-flex align-items-center">
                            <a class="nav-link" href="hubKami.jsp">Hubungi Kami</a>
                            <button class="btn-icon" onclick="toggleSidebar()">
                                <img src="images/right-align.png" alt="sidebar">
                            </button>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Konten "Mohon Tunggu" -->
        <br><br>
        <div class="content">
            <div class="img-container">
                <img src="images/tunggu.png" alt="Ilustrasi Menunggu">
            </div>
            <div class="text-container">
                <h1 class="text-center">MOHON TUNGGU</h1>
                <p class="text-center fs-4">Status kelulusan Anda<br>belum tersedia saat ini.<br><strong>Silakan cek kembali nanti.</strong></p>
            </div>
        </div>
    </div>

    <!-- Sidebar -->
    <div id="sideMenu" class="sidebar">
        <span class="close-btn" onclick="toggleSidebar()">&times;</span>
        <img src="images/profile.png" alt="Profile Picture" class="profile-img">
        <div class="menu-header">
            <%= session.getAttribute("nama") != null ? session.getAttribute("nama") : "Nama Calon Mahasiswa"%>
            <br>
            <small>
                <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Username"%>
            </small>
        </div>
        <ul>
            <li><a href="bio.jsp">Biodata</a></li>
            <li><a href="logout.jsp">Keluar</a></li>
        </ul>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function toggleSidebar() {
            document.getElementById('sideMenu').classList.toggle('active');
        }
    </script>
</body>
</html>
<%
    } else if (isLulus) {
        response.sendRedirect("lulus.jsp");
    } else {
        response.sendRedirect("gagal.jsp");
    }
%>
