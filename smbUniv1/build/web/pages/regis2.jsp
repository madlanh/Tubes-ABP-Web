<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Halaman Registrasi</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .main-container {
            max-width: 1000px;
            background-color: #EAF4F4;
            color: #000;
            border-radius: 15px;
            padding: 40px;
            margin: 60px auto;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }
        .navbar {
            padding: 0;
            margin-bottom: 30px;
        }
        .navbar-brand {
            font-weight: bold;
            font-size: 16px;
            color: #2B3D41 !important;
        }
        .nav-link {
            font-weight: bold;
            color: #333 !important;
        }
        h4 {
            color: #2B3D41;
            font-weight: bold;
        }
        p {
            font-size: 16px;
            color: #444;
        }
        .btn-selesai {
            background-color: #A4C3B2;
            color: #000;
            font-size: 16px;
            border-radius: 10px;
            padding: 10px 30px;
            border: none;
            font-weight: bold;
            text-decoration: none;
        }
        .btn-selesai:hover {
            background-color: #89a89e;
            color: #fff;
        }
        .illustration img {
            width: 100%;
            max-width: 320px;
            margin: 20px auto;
        }
    </style>
</head>
<body>

    <!-- Main Container (termasuk navbar) -->
    <div class="main-container">
        <!-- Navbar menyatu dengan container -->
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid px-0">
                <a class="navbar-brand" href="#">Registrasi | Seleksi Mahasiswa Baru</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="dashMaba.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="hubKami.jsp">Hubungi Kami</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Konten utama -->
        <div class="row align-items-center">
            <div class="col-md-6 text-center illustration">
                <img src="images/jurusan.png" alt="Illustration">
            </div>
            <div class="col-md-6 text-center">
                <h4>TERIMA KASIH</h4>
                <p>Anda telah sukses melakukan pendaftaran.</p>
                <a href="dashMaba.jsp" class="btn btn-selesai mt-4">Kembali ke Dashboard</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>