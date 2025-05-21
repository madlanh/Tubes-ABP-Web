<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tes Minat Bakat</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #3C4A45;
            color: #000;
            font-family: Arial, sans-serif;
        }
        .container {
            background-color: #EAF4F4;
            border-radius: 10px;
            padding: 30px;
            margin-top: 50px;
            margin-bottom: 50px;
            max-width: 800px;
        }
        h2, h6 {
            color: #000;
            font-weight: bold;
        }
        .form-check {
            margin-bottom: 8px;
        }
        .submit-btn {
            background-color: #A4C3B2;
            border: none;
            padding: 10px 20px;
            color: #000;
            font-weight: bold;
            border-radius: 5px;
            margin-top: 30px;
        }
        .submit-btn:hover {
            background-color: #8AB8A2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="mb-4 text-center">Tes Minat dan Bakat</h2>
        <form action="prosesTes.jsp" method="post">
            <%-- Soal 1–15 --%>
            <%
                String[] questions = {
                    "Saya senang memecahkan masalah logika atau matematika.",
                    "Saya tertarik dengan dunia kesehatan dan teknologi medis.",
                    "Saya suka menganalisis data dan sistem informasi.",
                    "Saya ingin menjadi manajer atau mengelola bisnis.",
                    "Saya tertarik dengan teknologi komputer dan pemrograman.",
                    "Saya memiliki ketertarikan pada sistem informasi di perusahaan.",
                    "Saya suka mengatur strategi organisasi atau manajemen tim.",
                    "Saya ingin bekerja di rumah sakit atau fasilitas kesehatan.",
                    "Saya menikmati membuat aplikasi atau software.",
                    "Saya suka meneliti dan mengolah informasi.",
                    "Saya tertarik pada bidang jaringan komputer dan keamanan data.",
                    "Saya memiliki minat terhadap database dan analisis data.",
                    "Saya senang bekerja secara kolaboratif dalam tim manajemen.",
                    "Saya ingin mengetahui bagaimana teknologi bisa membantu kesehatan manusia.",
                    "Saya tertarik pada pekerjaan yang melibatkan sistem dan prosedur bisnis."
                };
            %>
            
            <%
                for (int i = 0; i < questions.length; i++) {
            %>
            <div class="mb-4">
                <h6><%= (i + 1) + ". " + questions[i] %></h4>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q<%= (i + 1) %>" value="TI" required> Sangat Setuju
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q<%= (i + 1) %>" value="SI"> Setuju
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q<%= (i + 1) %>" value="RK"> Kurang Setuju
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="q<%= (i + 1) %>" value="MJ"> Tidak Setuju
                </div>
            </div>
            <% } %>

            <div class="text-center">
                <button type="submit" class="submit-btn">Lihat Rekomendasi Jurusan</button>
            </div>
        </form>
    </div>
</body>
</html>