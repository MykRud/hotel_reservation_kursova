<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Reservations</title>
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
                    <a class="nav-link active show" href="/api/allReservations">
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
                    <a class="nav-link" href="/api/hotel">
                        <i class="ri-store-line"></i>
                        <h4 class="d-none d-lg-block">Hotel</h4>
                    </a>
                </li>
            </ul>

        <div class="tab-content" data-aos="fade-up">
          

          <div class="tab-pane active show" id="tab-2">
            <div class="row">
              <div class="col-lg-12 order-2 order-lg-1 mt-3 mt-lg-0">

                <!-- ======= Team Section ======= -->
                <section id="team" class="team">
                  <div class="container">

                    <div class="section-title" data-aos="zoom-out">
                      <h2>${reservations.totalElements} reservations</h2>
                    </div>

                    <p class="text-primary">${message}</p>

                    <div class="row">
                    <c:forEach items="${reservations.elements}" var="reservation" varStatus="loop">
                      <div class="col-lg-3 col-md-6 d-flex align-items-stretch">
                        <div class="member" data-aos="fade-up" data-aos-delay="${loop.index}00">
                          <div class="member-info">
                            <h3>${loop.index + 1}. ${reservation.client.firstName} ${reservation.client.lastName}, Room ${reservation.room.id}</h3>
                              <strong>Hotel reservation:</strong><br /> from <fmt:formatDate type="date" dateStyle="medium" value="${reservation.arrivalDate}" /> to <fmt:formatDate type="date" dateStyle="medium" value="${reservation.releaseDate}" />. <br /><strong>Price with discount:</strong> ${reservation.price}$. <br /><strong>Room</strong> #${reservation.room.id}, <strong>comfort:</strong> ${reservation.room.comfort.comfortName}
                          </div>
                          <form action="/api/deleteReservation?id=${reservation.id}" method="post">
                            <input type="submit" class="btn btn-danger" value="Delete" />
                          </form>
                        </div>

                      </div>

                      </c:forEach>
                    </div>

                  </div>
                </section><!-- End Team Section -->
              </div>
            </div>
          </div>


        </div>
                                <!-- Pagination start-->
                                    <c:if test="${reservations.allPages > 0}">
                                        <div class="row">
                                            <div class="col-lg-12  d-flex align-items-center justify-content-center">
                                                <div class="pagination p1">
                                                    <ul>
                                                        <a href="?page=${reservations.page <= 1 ? 1 : reservations.page - 1}"><li class="${reservations.page == 1 ? 'disabled' : ''}"><</li></a>
                                                        <c:set var="num_page" value="${reservations.page}" />
                                                        <c:forEach begin="${reservations.page}"
                                                               end="${reservations.allPages >= reservations.page+4 ? num_page+3 : reservations.allPages}"
                                                               step="1" var="i">
                                                            <c:choose>
                                                                <c:when test="${i == reservations.page}">
                                                                    <a class="${i == reservations.page ? 'is-active' : ''}" href="#"><li>${i}</li></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a class="page-link" href="?page=${i}">
                                                                        <li>${i}</li>
                                                                     </a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <a href="?page=${reservations.page == reservations.allPages ? 1 : reservations.page + 1}"><li class="${reservations.page == reservations.allPages ? 'disabled' : ''}">></li></a>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- Pagination end-->
                                    </c:if>
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