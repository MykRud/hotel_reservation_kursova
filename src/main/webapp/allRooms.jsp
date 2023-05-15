<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Rooms</title>
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
                    <a class="nav-link active show" href="/api/allRooms">
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

                <div class="tab-pane active show" id="tab-3">
                    <div class="row">
                        <div class="col-lg-12 order-2 order-lg-1 mt-3 mt-lg-0">
                            <section id="services" class="services">
                                <div class="container">

                                    <div class="section-title" data-aos="zoom-out">
                                        <h2><strong>${available_rooms}</strong>/${rooms.totalElements} rooms available</h2>
                                    </div>

                                    <p class="text-primary">${message}</p>

                                    <div class="row">

                                    <c:set var="colors" value="${['#ff689b', '#e9bf06', '#3fcdc7', '#41cf2e', '#d6ff22', '#4680ff', '#4287f5', '#95f542']}" />

                                    <c:forEach items="${rooms.elements}" var="room" varStatus="loop">
                                        <div class="col-lg-3 col-md-6 mt-5">
                                            <div class="icon-box" data-aos="zoom-in-left"  data-aos-delay="${loop.index}00">
                                                <div class="icon"><i class="bi bi-house" style="color: ${colors[loop.index]};"></i></div>
                                                <h4 class="title" <c:if test="${room.isReserved == true}">style="pointer-events: none;"</c:if>><a href="" data-bs-toggle="modal" data-bs-target="#exampleModalCenter2" data-bs-id="${room.id}">Room ${room.id}         <i class="bi bi-patch-plus-fill"></i></a></h4>
                                                <p class="description"><strong>Price</strong>: ${room.price}$. <strong>Comfort</strong>: ${room.comfort.comfortName}
                                                    <br />
                                                    <c:if test="${room.isReserved == false}">
                                                        <strong style="color: green;">Available</strong>
                                                    </c:if>
                                                    <c:if test="${room.isReserved == true}">
                                                        <strong style="color: red;">Not Available</strong>
                                                    </c:if>
                                                </p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                    <div class="col-lg-2" style = "margin-top: 3em;">
                                        <button class="btn btn-success btn-large" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-plus-circle-fill"></i></button>
                                    </div>
                                    <!-- Pagination start-->
                                    <c:if test="${rooms.allPages > 0}">
                                        <div class="row">
                                            <div class="col-lg-12  d-flex align-items-center justify-content-center">
                                                <div class="pagination p1">
                                                    <ul>
                                                        <a href="?page=${rooms.page <= 1 ? 1 : rooms.page - 1}"><li class="${rooms.page == 1 ? 'disabled' : ''}"><</li></a>
                                                        <c:set var="num_page" value="${rooms.page}" />
                                                        <c:forEach begin="${rooms.page}"
                                                               end="${rooms.allPages >= rooms.page+4 ? num_page+3 : rooms.allPages}"
                                                               step="1" var="i">
                                                            <c:choose>
                                                                <c:when test="${i == rooms.page}">
                                                                    <a class="${i == rooms.page ? 'is-active' : ''}" href="#"><li>${i}</li></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a class="page-link" href="?page=${i}">
                                                                        <li>${i}</li>
                                                                     </a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <a href="?page=${rooms.page == rooms.allPages ? 1 : rooms.page + 1}"><li class="${rooms.page == rooms.allPages ? 'disabled' : ''}">></li></a>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    <!-- Pagination end-->
                                    </c:if>
                                </div>
                            </section><!-- End Services Section -->
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Features Section -->


</main><!-- End #main -->

<!-- Modal 1 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add room</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <!-- ======= Contact Section ======= -->
                <section id="contact" class="contact">
                    <div class="container">

                        <div class="row justify-content-center">

                            <div class="col-lg-8 mt-lg-0" data-aos="fade-left">

                                <form:form action="/api/addRoom" method="post" role="form" class="php-email-form" modelAttribute="submit_room">
                                    <div class="form-group mt-3">
                                        <form:label for="capacity" path="capacity" class="col-sm-6 col-form-label">Capacity:</form:label>
                                        <form:input type="text" name="capacity" path="capacity" class="form-control" id="capacity" placeholder="Capacity" required="true" />
                                    </div>
                                    <div class="form-group mt-3">
                                        <form:select path="comfort" class="form-select" aria-label="Choose comfort">
                                            <form:option value="standard class">Standard class</form:option>
                                            <form:option value="lux class">Lux class</form:option>
                                            <form:option value="business class">Business class</form:option>
                                            <form:option value="presidential class">Presidential class</form:option>
                                        </form:select>
                                    </div>
                                    <div class="form-group mt-3">
                                        <form:label for="price" path="price" class="col-sm-6 col-form-label">Price:</form:label>
                                        <form:input type="text" name="price" path="price" class="form-control" id="price" placeholder="Price" required="true" />
                                    </div>
                                    <div class="my-3">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Thank you!</div>
                                    </div>
                                    <div class="text-center"><form:button type="submit">Add room</form:button></div>
                                </form:form>

                            </div>

                        </div>

                    </div>
                </section><!-- End Contact Section -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal2 -->
<div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle2">Reserve room</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <!-- ======= Contact Section ======= -->
                <section id="contact2" class="contact">
                    <div class="container">

                        <div class="row justify-content-center">

                            <div class="col-lg-8 mt-lg-0" data-aos="fade-left">

                                <form action="/api/addReservation" method="post" role="form" class="php-email-form">

                                    <input type="hidden" name="roomId" class="form-control" id="roomId" />

                                        <select name="clientId" class="form-select" aria-label="Choose client">
                                            <c:forEach items="${clients}" var="client">
                                                <option value="${client.id}">${client.lastName} ${client.firstName}</option>
                                            </c:forEach>
                                        </select>

                                    <div class="form-group mt-3">
                                        <label for="reservePrice" class="col-sm-6 col-form-label">Confirm price:</label>
                                        <input type="text" name="price" class="form-control" id="reservePrice" placeholder="Confirm price" required/>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="arrivalDate" class="col-sm-6 col-form-label">Arrival Date:</label>
                                        <input type="date" name="arrivalDate" class="form-control" id="arrivalDate" placeholder="Arrival Date" required />
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="releaseDate" class="col-sm-6 col-form-label">Release Date:</label>
                                        <input type="date" name="releaseDate" class="form-control" id="releaseDate" placeholder="Release Date" required />
                                    </div>
                                    <div class="my-3">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Thank you!</div>
                                    </div>
                                    <div class="text-center"><button type="submit">Reserve</button></div>
                                </form>

                            </div>

                        </div>

                    </div>
                </section><!-- End Contact Section -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="container">
        <h3>Hotel Reservation System</h3>
        <p>Developed by Artemyuk Artem</p>
    </div>
</footer><!-- End Footer -->


<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>


<!-- Vendor JS Files -->
<script src="${request.contextPath}/assets/vendor/aos/aos.js"></script>
<script src="${request.contextPath}/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${request.contextPath}/assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="${request.contextPath}/assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="${request.contextPath}/assets/vendor/swiper/swiper-bundle.min.js"></script>

<script>
var exampleModal = document.getElementById('exampleModalCenter2')
exampleModal.addEventListener('show.bs.modal', function (event) {
  // Button that triggered the modal
  var button = event.relatedTarget
  // Extract info from data-bs-* attributes
  var id = button.getAttribute('data-bs-id')

  var modalTitle = exampleModal.querySelector('.modal-title')
  var modalBodyInput = exampleModal.querySelector('.modal-body input[name="roomId"]')

  modalTitle.textContent = 'Submit reservation ' + id
  modalBodyInput.value = id

})

</script>

<!-- Template Main JS File -->
<script src="${request.contextPath}/assets/js/main.js"></script>

</body>

</html>