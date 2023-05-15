<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Hotel</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="${request.contextPath}/assets/img/favicon.png" rel="icon">
    <link href="${request.contextPath}/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="${request.contextPath}/assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="${request.contextPath}/assets/css/style.css" rel="stylesheet">
    <link href="${request.contextPath}/assets/css/additional-styles.css" rel="stylesheet">

</head>

<body>

<main id="main">

    <!-- ======= Features Section ======= -->
    <section id="features" class="features">
        <div class="container">

            <ul class="nav nav-tabs row d-flex">
                <li class="nav-item col-3" data-aos="zoom-in">
                    <a class="nav-link" href="/api/allClients">
                        <i class="ri-gps-line"></i>
                        <h4 class="d-none d-lg-block">Clients</h4>
                    </a>
                </li>
                <li class="nav-item col-3" data-aos="zoom-in" data-aos-delay="100">
                    <a class="nav-link" href="/api/allReservations">
                        <i class="ri-body-scan-line"></i>
                        <h4 class="d-none d-lg-block">Reservations</h4>
                    </a>
                </li>
                <li class="nav-item col-3" data-aos="zoom-in" data-aos-delay="200">
                    <a class="nav-link" href="/api/allRooms">
                        <i class="ri-sun-line"></i>
                        <h4 class="d-none d-lg-block">Rooms</h4>
                    </a>
                </li>
                <li class="nav-item col-3" data-aos="zoom-in" data-aos-delay="300">
                    <a class="nav-link active show" href="/api/hotel">
                        <i class="ri-store-line"></i>
                        <h4 class="d-none d-lg-block">Hotel</h4>
                    </a>
                </li>
            </ul>

            <div class="tab-content" data-aos="fade-up">

                <div class="tab-pane  active show" id="tab-4">
                    <div class="row">
                        <div class="col-lg-6 order-2 order-lg-1 mt-3 mt-lg-0">
                            <h3>Hotel Reservation System</h3>
                            <p>Developed by Artemyuk Artem</p>
                            <p>
                                By now, hotel has ${numberOfClients} clients registered, ${numberOfReservations} reservations and ${numberOfRooms} rooms.
                            </p>
                            <p>
                                In this web-site, you can go either with main tabs or with navigable bar elements. More functions available for administrators of the system.
                            </p>
                            <p class="fst-italic">
                                Here you can see main functionallity of web-system
                            </p>
                            <ul>
                                <li><i class="ri-check-double-line"></i> To see clients, use "Clients" tab.</li>
                                <li><i class="ri-check-double-line"></i> In "Room" tab, you can check available rooms and reserve one.</li>
                                <li><i class="ri-check-double-line"></i> In "Reservations" tab you can observe all client's reservations who loggen in and delete them if needed.</li>
                            </ul>
                        </div>
                        <div class="col-lg-6 order-1 order-lg-2 text-center">
                            <img src="assets/img/features-3.png" alt="" class="img-fluid">
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section><!-- End Features Section -->



</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="container">
        <h3>Hotel Reservation System</h3>
        <p>Developed by Artemyuk Artem</p>
    </div>
</footer><!-- End Footer -->


<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="${request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

<!-- Template Main JS File -->
<script src="${request.contextPath}/assets/js/main.js"></script>

</body>

</html>