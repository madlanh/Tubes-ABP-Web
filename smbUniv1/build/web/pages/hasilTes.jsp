<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String jurusan = request.getParameter("jurusan");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Hasil Tes Minat Bakat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #EAF4F4;
            color: #000;
            border-radius: 10px;
            padding: 30px;
            margin-top: 100px;
            max-width: 600px;
        }
        h2 {
            color: #2B3D41;
            font-weight: bold;
        }
        h3 {
            color: green;
            font-weight: bold;
        }
        .btn-back {
            margin-top: 30px;
            background-color: #A4C3B2;
            border: none;
            font-weight: bold;
            padding: 10px 20px;
            border-radius: 8px;
            color: #000;
        }
        .btn-back:hover {
            background-color: #89a89e;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2>Hasil Tes Minat Bakat</h2>
        <p class="mt-3">Berdasarkan tes yang Anda kerjakan, jurusan yang direkomendasikan adalah:</p>
        <h3><%= jurusan %></h3>

        <!-- Tombol Kembali -->
        <a href="dashMaba.jsp" class="btn btn-back">Kembali ke Dashboard</a>
    </div>
</body>
</html>