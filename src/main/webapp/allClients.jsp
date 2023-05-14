<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Clients</title>
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

            <%@ include file="jspf/nav.jspf" %>

            <div class="tab-content" data-aos="fade-up">

                <div class="tab-pane active show" id="tab-1">
                    <div class="row">
                        <c:set var="colors" value="${['#ff689b', '#e9bf06', '#3fcdc7', '#41cf2e', '#d6ff22', '#4680ff', '#4287f5', '#95f542']}" />
                        <div class="col-lg-12 order-2 order-lg-1 mt-3 mt-lg-0">
                            <section id="services" class="services">
                                <div class="container">

                                    <div class="section-title" data-aos="zoom-out">
                                        <h2>${clients.totalElements} clients</h2>
                                    </div>

                                    <div class="row">
                                    <c:forEach items="${clients.elements}" var="client" varStatus="loop">
                                        <div class="col-lg-3 col-md-6 mt-5">
                                            <div class="icon-box" data-aos="zoom-in-left" data-aos-delay="${loop.index}00">
                                                <div class="icon"><i class="bi bi-person-hearts" style="color: ${colors[loop.index]};"></i></div>
                                                <h4 class="title"><a href="">${client.firstName} ${client.lastName}</a></h4>
                                                <p class="description">User has ${client.reservations.size()} reservations</p>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    </div>
                                    <div class="col-lg-2" style = "margin-top: 3em;">
                                        <button type="button" class="btn btn-success btn-large" data-toggle="modal" data-target="#exampleModalCenter"><i class="bi bi-person-plus-fill"></i></button>
                                    </div>
                                    <!-- Pagination start-->
                                    <c:if test="${clients.allPages > 0}">
                                        <div class="row">
                                            <div class="col-lg-12  d-flex align-items-center justify-content-center">
                                                <div class="pagination p1">
                                                    <ul>
                                                        <a href="?page=${clients.page <= 1 ? 1 : clients.page - 1}"><li class="${clients.page == 1 ? 'disabled' : ''}"><</li></a>
                                                        <c:set var="num_page" value="${clients.page}" />
                                                        <c:forEach begin="${clients.page}"
                                                               end="${clients.allPages >= clients.page+4 ? num_page+3 : clients.allPages}"
                                                               step="1" var="i">
                                                            <c:choose>
                                                                <c:when test="${i == clients.page}">
                                                                    <a class="${i == clients.page ? 'is-active' : ''}" href="#"><li>${i}</li></a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a class="page-link" href="?page=${i}">
                                                                        <li>${i}</li>
                                                                     </a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                        <a href="?page=${clients.page == clients.allPages ? 1 : clients.page + 1}"><li class="${clients.page == clients.allPages ? 'disabled' : ''}">></li></a>
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


<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Add client</h5>
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

                                <form:form action="/api/addClient" method="post" role="form" class="php-email-form" modelAttribute="submit_client">

                                    <div class="form-group mt-3">
                                        <form:input type="text" name="firstName" path="firstName" class="form-control" id="firstName" placeholder="First name" required="true" />
                                    </div>
                                    <div class="form-group mt-3">
                                        <form:input type="text" name="lastName" path="lastName" class="form-control" id="lastName" placeholder="Last name" required="true" />
                                    </div>

                                    <div class="my-3">
                                        <div class="loading">Loading</div>
                                        <div class="error-message"></div>
                                        <div class="sent-message">Thank you!</div>
                                    </div>
                                    <div class="text-center"><form:button type="submit">Add client</form:button></div>
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

<%@ include file="jspf/footer.jspf" %>

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

<!-- Template Main JS File -->
<script src="${request.contextPath}/assets/js/main.js"></script>

</body>

</html>